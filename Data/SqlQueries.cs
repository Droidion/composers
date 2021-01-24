namespace Data
{
    public static class SqlQueries
    {
        /// <summary>
        /// Select Composer by its slug name
        /// </summary>
        public const string ComposerBySlug = @"
select json_build_object(
       'Id', c.id,
       'LastName', c.last_name,
       'FirstName', c.first_name,
       'YearBorn', c.year_born,
       'YearDied', c.year_died,
       'Countries', json_agg(c2.name),
       'Slug', c.slug,
       'Enabled', c.enabled,
       'WikipediaLink', c.wikipedia_link,
       'ImslpLink', c.imslp_link) json
from composers as c
         join composers_countries cc on c.id = cc.composer_id
         join countries c2 on cc.country_id = c2.id
where c.slug = @ComposerSlug
group by c.id, c.last_name, c.first_name, c.year_born, c.year_died
order by c.last_name";

        /// <summary>
        /// Select composers grouped by music periods
        /// </summary>
        public const string PeriodsAndComposers = @"
select json_agg(json_build_object(
                        'Id', p.id,
                        'Name', p.name,
                        'YearStart', p.year_start,
                        'YearEnd', p.year_end,
                        'Slug', p.slug,
                        'Composers', p.composers
                    ) order by p.year_start) as Json
from (select p.id,
             p.name,
             p.year_start,
             p.year_end,
             p.slug,
             json_agg(json_build_object(
                              'Id', c.id,
                              'LastName', c.last_name,
                              'FirstName', c.first_name,
                              'YearBorn', c.year_born,
                              'YearDied', c.year_died,
                              'Countries', c.countries,
                              'Slug', c.slug,
                              'Enabled', c.enabled,
                              'WidipediaLink', c.wikipedia_link,
                              'ImslpLink', c.imslp_link) order by c.last_name) composers
      from periods p
               join (select c.id,
                            c.last_name,
                            c.first_name,
                            json_agg(c2.name) countries,
                            c.year_born,
                            c.year_died,
                            c.slug,
                            c.enabled,
                            c.wikipedia_link,
                            c.imslp_link,
                            c.period_id
                     from composers c
                              join composers_countries cc on c.id = cc.composer_id
                              join countries c2 on cc.country_id = c2.id
                     group by c.id, c.last_name, c.first_name, c.year_born, c.year_died, c.slug, c.wikipedia_link,
                              c.imslp_link, c.period_id
      ) c on p.id = c.period_id
      group by p.id, p.name, p.year_start, p.year_end, p.slug) p";

        /// <summary>
        /// Select work by its id
        /// </summary>
        public const string WorkById = @"
select w.id,
       w.title,
       w.year_start,
       w.year_finish,
       w.average_minutes,
       c.name as catalogue_name,
       w.catalogue_number,
       w.catalogue_postfix,
       k.name as key,
       w.no,
       w.nickname
from works w
         left join catalogues c on w.catalogue_id = c.id
         left join keys k on w.key_id = k.id
where w.id = @Id";

        /// <summary>
        /// Select works by their parent work Id
        /// </summary>
        public const string ChildWorks = @"
select w.id,
       w.title,
       w.year_start,
       w.year_finish,
       w.average_minutes,
       c.name as catalogue_name,
       w.catalogue_number,
       w.catalogue_postfix,
       k.name as key,
       w.no,
       w.nickname
from works w
         left join catalogues c on w.catalogue_id = c.id
         left join keys k on w.key_id = k.id
where w.parent_work_id = @Id
order by no, catalogue_number, catalogue_postfix";

        /// <summary>
        /// Select works grouped by genres by composer Id
        /// </summary>
        public const string GenresAndWorksByComposer = @"
select json_agg(json_build_object(
                        'Name', g.name,
                        'Icon', g.icon,
                        'Works', g.works
                    ) order by g.name) json
from (select g.name,
             g.icon,
             json_agg(json_build_object(
                              'Id', w.id,
                              'Title', w.title,
                              'YearStart', w.year_start,
                              'YearFinish', w.year_finish,
                              'AverageMinutes', w.average_minutes,
                              'CatalogueName', c.name,
                              'CatalogueNumber', w.catalogue_number,
                              'CataloguePostfix', w.catalogue_postfix,
                              'Key', k.name,
                              'No', w.no,
                              'Nickname', w.nickname
                          ) order by w.year_finish, w.catalogue_number) works
      from works w
               join works_genres wg on w.id = wg.work_id
               join genres g on wg.genre_id = g.id
               left join catalogues c on w.catalogue_id = c.id
               left join keys k on w.key_id = k.id
      where w.composer_id = @ComposerId
      group by g.name,
               g.icon) g";

        /// <summary>
        /// Select recordings of certain work
        /// </summary>
        public const string RecordingsByWork = @"
select jsonb_agg(jsonb_build_object(
                        'Id', w.Id,
                        'CoverName', w.cover_name,
                        'YearStart', w.year_start,
                        'YearFinish', w.year_finish,
                        'Performers', w.performers,
                        'Label', w.name,
                        'Length', w.length,
                        'Streamers', w.streamers
                    )) json
from (select r.id,
       jsonb_agg(jsonb_build_object(
               'FirstName', p.first_name,
               'LastName', p.last_name,
               'Priority', pri.priority,
               'Instrument', i.name
           ) order by pri.priority, p.last_name) performers,
       r.cover_name,
       r.year_start,
       r.year_finish,
       r.name,
       r.length,
       r.streamers
from (
         select r.id,
                r.cover_name,
                r.year_start,
                r.year_finish,
                l.name,
                r.length,
                jsonb_agg(jsonb_build_object('Name', s.name,
                                           'Icon', s.icon_name,
                                           'Link', rs.link,
                                           'Prefix', s.app_prefix) order by s.name) streamers
         from recordings r
                  left join labels l on r.label_id = l.id
                  join recordings_streamers rs on r.id = rs.recording_id
                  join streamers s on rs.streamer_id = s.id
         where r.work_id = @WorkId
         group by r.id,
                  r.cover_name,
                  r.year_start,
                  r.year_finish,
                  l.name,
                  r.length
     ) r
         join performers_recordings_instruments pri on r.id = pri.recording_id
         join performers p on pri.performer_id = p.id
         join instruments i on pri.instrument_id = i.id
group by r.id,
         r.cover_name,
         r.year_start,
         r.year_finish,
         r.name,
         r.length,
         r.streamers
order by r.year_finish) w";
    }
}