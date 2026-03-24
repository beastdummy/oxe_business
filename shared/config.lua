--[[
    oxe_business — Shared Configuration

    Este archivo define TODA la configuración estática del sistema de negocios.

    ⚠️ IMPORTANTE:
    - Aquí SOLO hay datos (configuración).
    - NO se debe meter lógica de framework (Qbox, ESX, etc.).
    - NO se deben hacer llamadas a exports o funciones externas.
    - Este archivo debe ser seguro de cargar tanto en client como en server.

    Objetivo:
    - Centralizar configuración
    - Facilitar mantenimiento
    - Permitir escalabilidad (Tebex-ready)
    - Ayudar a la IA a entender la estructura del sistema
]]

Config = Config or {}

--========================================================--
-- 🔧 DEBUG
--========================================================--

-- Activar/desactivar logs de debug
-- Recomendado: false en producción
Config.Debug = false


--========================================================--
-- 🌐 LOCALE
--========================================================--

-- Idioma principal del sistema
-- Debe coincidir con un archivo en /locales (ej: es.json, en.json)
Config.Locale = 'es'


--========================================================--
-- ⚙️ FEATURES (MÓDULOS ACTIVABLES)
--========================================================--

-- Activar o desactivar funcionalidades del sistema
-- Permite modular el script sin tocar código
Config.Features = {
    blips = true,         -- Mostrar negocios en el mapa
    interactions = true,  -- Interacciones con target o puntos
    employees = true,     -- Sistema de empleados
    billing = true,       -- Facturación entre jugadores
    logs = true           -- Logs internos del sistema
}


--========================================================--
-- 🔌 INTEGRACIONES
--========================================================--

-- Define qué sistemas externos se están usando
-- Esto permitirá usar adapters en el futuro

Config.Target = 'ox_target'        -- ox_target / qb-target / custom
Config.Inventory = 'ox_inventory' -- ox_inventory / qb-inventory / custom


--========================================================--
-- 🏢 CONFIGURACIÓN DE NEGOCIOS
--========================================================--

-- Cada negocio se define aquí
-- Clave = ID único del negocio

Config.Businesses = {

    ['oxe_demo'] = {
        label = 'OXE Demo Business', -- Nombre visible
        type = 'shop',               -- Tipo (shop, warehouse, office, etc.)
        enabled = true,              -- Activar/desactivar negocio

        job = 'oxe_demo',            -- Job asociado al negocio
        maxEmployees = 10,           -- Límite de empleados

        -- Coordenadas del negocio
        coords = {
            management = vec3(0.0, 0.0, 0.0) -- Punto de gestión (boss menu)
        },

        -- Configuración del blip en el mapa
        blip = {
            enabled = true,
            sprite = 52,
            colour = 2,
            scale = 0.8
        },

        -- Ajustes internos del negocio
        settings = {
            taxRate = 0.0
        }
    }
}


--========================================================--
-- 📌 NOTAS DE DISEÑO (IMPORTANTE PARA IA Y FUTURO)
--========================================================--

-- Este archivo está diseñado para:
-- ✔ ser simple
-- ✔ ser extensible
-- ✔ no romper cuando se añadan nuevos módulos

-- Ejemplo de futuras extensiones:
-- Config.Features.delivery = true
-- Config.Features.reviews = true

-- Ejemplo de nuevos campos en negocios:
-- business.stash
-- business.crafting
-- business.delivery

-- La lógica SIEMPRE debe ir en:
-- - client/
-- - server/
-- - framework/
-- - integrations/

-- NUNCA aquí.
