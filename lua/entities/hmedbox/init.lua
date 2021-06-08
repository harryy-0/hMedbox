AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("imgui.lua")
include("config.lua")
util.AddNetworkString( "HP" )
util.AddNetworkString( "Armour" )

include("shared.lua")


 
net.Receive( "HP", function( len, ply ) 
    local ent = net.ReadEntity()
    if ent:GetPos():Distance(ply:GetPos()) > 500 then return end
    ply:SetHealth(100)
    ply:addMoney(-500)

 end )

net.Receive( "Armour", function( len, ply ) 
    local ent = net.ReadEntity()
    
   if ent:GetPos():Distance(ply:GetPos()) > 500 then return end

    ply:SetArmor(100)
    ply:addMoney(-500)

 end )


function ENT:Initialize()
   
    
   
   
   self:SetModel("models/hunter/blocks/cube075x075x025.mdl")
   self:SetMaterial("lights/white")
   self:PhysicsInit(SOLID_VPHYSICS)
   self:SetMoveType(MOVETYPE_VPHYSICS)
   self:SetSolid(SOLID_VPHYSICS)
   self:Health(100)
   self:SetColor(HCONFIG.PropColor)
   




   local phys = self:GetPhysicsObject()


    if phys:IsValid() then

     phys:Wake()


     end

 end

