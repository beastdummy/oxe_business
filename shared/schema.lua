--[[
    oxe_business — Shared Schema

    Este archivo define las estructuras base del sistema de negocios.

    ⚠️ IMPORTANTE:
    - NO hay lógica aquí
    - NO hay framework
    - SOLO definiciones de datos (contratos)

    Objetivo:
    - Unificar estructura entre client y server
    - Evitar inconsistencias
    - Facilitar trabajo con IA
]]

Schema = Schema or {}

--========================================================--
-- 🏢 BUSINESS
--========================================================--

---@class Business
---@field id string Identificador único del negocio
---@field label string Nombre visible
---@field type string Tipo de negocio (shop, warehouse, etc.)
---@field owner string|nil Identificador del dueño (puede ser nil)
---@field balance number Dinero del negocio
---@field employees table<string, Employee> Lista de empleados
---@field state string Estado actual (open / closed)

Schema.Business = {
    id = '',
    label = '',
    type = '',
    owner = nil,
    balance = 0,
    employees = {},
    state = 'closed'
}


--========================================================--
-- 👤 EMPLOYEE
--========================================================--

---@class Employee
---@field identifier string Identificador del jugador
---@field role string Rol (boss, manager, employee)
---@field grade number Nivel dentro del negocio
---@field salary number Salario asignado

Schema.Employee = {
    identifier = '',
    role = 'employee',
    grade = 0,
    salary = 0
}


--========================================================--
-- 🔐 ROLES
--========================================================--

Schema.Roles = {
    boss = {
        canManageEmployees = true,
        canWithdraw = true,
        canDeposit = true,
        canHire = true,
        canFire = true
    },

    manager = {
        canManageEmployees = true,
        canWithdraw = false,
        canDeposit = true,
        canHire = true,
        canFire = false
    },

    employee = {
        canManageEmployees = false,
        canWithdraw = false,
        canDeposit = false,
        canHire = false,
        canFire = false
    }
}


--========================================================--
-- 📊 STATES
--========================================================--

Schema.States = {
    OPEN = 'open',
    CLOSED = 'closed'
}


--========================================================--
-- 📌 NOTAS
--========================================================--

-- Este archivo sirve como referencia estructural.
-- No se instancia directamente.
-- Se usará en server/client para crear entidades reales.

-- Ejemplo:
-- local business = {
--     id = "burgershot",
--     label = "Burger Shot",
--     ...
-- }
