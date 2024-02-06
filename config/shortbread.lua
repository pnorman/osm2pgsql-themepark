-- ---------------------------------------------------------------------------
--
-- Shortbread theme
--
-- Configuration for the osm2pgsql Themepark framework
--
-- ---------------------------------------------------------------------------

local themepark = require('themepark')

themepark.debug = false

-- Add JSONB column `tags` with original OSM tags in debug mode
themepark:set_option('tags', 'all_tags')

-- ---------------------------------------------------------------------------
-- Choose which names from which languages to use in the map.
-- See 'themes/core/README.md' for details.

-- themepark:add_topic('core/name-single', { column = 'name' })
-- themepark:add_topic('core/name-list', { keys = {'name', 'name:de', 'name:en'} })

themepark:add_topic('core/name-with-fallback', {
    keys = {
        name = { 'name', 'name:en', 'name:de' },
        name_de = { 'name:de', 'name', 'name:en' },
        name_en = { 'name:en', 'name', 'name:de' },
    }
})

-- --------------------------------------------------------------------------

themepark:add_topic('core/layer')

themepark:add_topic('external/oceans', { name = 'ocean' })

themepark:add_topic('shortbread_v1/aerialways')
themepark:add_topic('shortbread_v1/boundaries')
themepark:add_topic('shortbread_v1/boundary_labels')
themepark:add_topic('shortbread_v1/bridges')
themepark:add_topic('shortbread_v1/buildings')
themepark:add_topic('shortbread_v1/dams')
themepark:add_topic('shortbread_v1/ferries')
themepark:add_topic('shortbread_v1/land')
themepark:add_topic('shortbread_v1/piers')
themepark:add_topic('shortbread_v1/places')
themepark:add_topic('shortbread_v1/pois')
themepark:add_topic('shortbread_v1/public_transport')
themepark:add_topic('shortbread_v1/sites')
themepark:add_topic('shortbread_v1/streets')
themepark:add_topic('shortbread_v1/water')

-- Must be after "pois" layer, because as per Shortbread spec addresses that
-- are already in "pois" should not be in the "addresses" layer.
themepark:add_topic('shortbread_v1/addresses')

-- ---------------------------------------------------------------------------

-- Create config files only in create mode, not when updating the database.
-- This protects the file in case it contains manual edits.
if osm2pgsql.mode == 'create' then
-- Enable if you want to create a config file for the T-Rex tile server.
--
--    themepark:plugin('t-rex'):write_config('t-rex-config.toml', {})

-- Enable if you want to create a config file for the Tilekiln tile server.
-- (You must also create the directory 'shortbread_config'.)
--
--     themepark:plugin('tilekiln'):write_config('shortbread_config', {
--         tileset = 'shortbread_v1',
--         name = 'OpenStreetMap Shortbread',
--         attribution = '<a href="https://www.openstreetmap.org/copyright">© OpenStreetMap</a>'
--     })

-- Enable if you want to create a taginfo project file.
--
--    themepark:plugin('taginfo'):write_config('taginfo-shortbread', {
--        project = { name = 'shortbread' }
--    })
end

-- ---------------------------------------------------------------------------
