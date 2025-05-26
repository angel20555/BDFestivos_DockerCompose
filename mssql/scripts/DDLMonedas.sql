CREATE DATABASE Monedas
GO

USE Monedas
GO

/* Crear tabla MONEDA */
CREATE TABLE Moneda( 
	Id int IDENTITY(1,1) NOT NULL, 
	CONSTRAINT pkMoneda_Id PRIMARY KEY (Id),
	Moneda varchar(50) NOT NULL,
	Sigla varchar(5) NOT NULL,
	Imagen Image NULL
	)

/* Crear indice para MONEDA
	ordenado por MONEDA */
CREATE UNIQUE INDEX ixMoneda
	ON Moneda(Moneda)

/* Crear tabla CAMBIOMONEDA */
CREATE TABLE CambioMoneda( 
	IdMoneda int NOT NULL,
	CONSTRAINT fkCambioMoneda_IdMoneda FOREIGN KEY (IdMoneda)
		REFERENCES Moneda(Id),
	Fecha smalldatetime NOT NULL,
	Cambio float NOT NULL
)

/* Crear indice para CAMBIOMONEDA
	ordenado por MONEDA, FECHA */
CREATE UNIQUE INDEX ixCambioMoneda
	ON CambioMoneda(IdMoneda, Fecha)

/* Crear tabla PAIS */
CREATE TABLE Pais( 
	Id int IDENTITY(1,1) NOT NULL, 
	CONSTRAINT pkPais_Id PRIMARY KEY (Id),
	Pais varchar(50) NOT NULL, 
	IdMoneda int NOT NULL,
	CONSTRAINT fkPais_IdMoneda FOREIGN KEY (IdMoneda)
		REFERENCES Moneda(Id),
	CodigoAlfa2 varchar(5) NOT NULL,
	CodigoAlfa3 varchar(5) NOT NULL,
	Mapa image NULL,
	Bandera image NULL
)

/* Crear indice para PAIS
	ordenado por PAIS */
CREATE UNIQUE INDEX ixPais
	ON Pais(Pais)