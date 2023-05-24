USE [Vet_ElBuenProductor]
GO

INSERT INTO [dbo].[estado]([NombreEstado])
     VALUES
           ('ACTIVO')
GO

INSERT INTO [dbo].[veterinario]([cod_veterinario],[id_estado],[nom_vet],[dir_vet],[cel_vet],[correo_vet],[id_credencial])
     VALUES
           ('VET0001',1,'Gabriel Sebastian Reyes Cajina','KM 14 Carretera Masaya - Managua','8965478','gsrey001@gmail.com',1)
GO

INSERT INTO [dbo].[credenciales]([usuario],[contrasena],[rol],[cargo])VALUES('admin','pbkdf2:sha256:260000$8mRTUVOxiF8vUtO2$091e6418e5120d4f103c2e3d1d9486c5518043e598847ec72a88393cb3e8ec6d',1,1)
GO

