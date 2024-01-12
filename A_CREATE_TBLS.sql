CREATE SCHEMA AUTHORIZATION ALAIN
CREATE TABLE ALAIN.RESERVA 
(
ID 		    NUMERIC (12,0) NOT NULL,
TIMESTAMP_ 		DATE NOT NULL,
WEBSITE 		VARCHAR (2) NOT NULL,
ESTADO 		VARCHAR (10) CONSTRAINT ESTADO_CONSTRAINT CHECK (ESTADO IN ('CERRADA', 'ABIERTA')),
CONSTRAINT PK_RESERVA PRIMARY KEY (ID)
)


CREATE TABLE ALAIN.PRODUCTO
(
ID 			NUMERIC(12,0) NOT NULL,
RESERVA_ID 		NUMERIC(12) NOT NULL,
TIPO 			VARCHAR (10) CONSTRAINT TIPO_CONSTRAINT CHECK (TIPO IN ('VUELO', 'HOTEL', 'COCHE')),
PROVEEDOR		VARCHAR (10) NOT NULL,
PRECIO_EN_EUR 	NUMERIC (10, 2) NOT NULL,
COBRADO 		CHAR(1) CONSTRAINT COBRADO_CONSTRAINT CHECK (COBRADO IN ('T', 'F')),
CONSTRAINT PK_PRODUCTO PRIMARY KEY (ID),
CONSTRAINT FK_PRODUCTO_RESERVA FOREIGN KEY (RESERVA_ID) REFERENCES RESERVA(ID)
)

CREATE TABLE ALAIN.FINANZAS
(
RESERVA_ID 		NUMERIC(12) NOT NULL,
AGENTE_ASIGNADO	VARCHAR (50) NOT NULL,
FACTURADO 		CHAR(1) CONSTRAINT FACTURADO_CONSTRAINT CHECK (FACTURADO IN ('T', 'F')),
ERROR			VARCHAR (100) NOT NULL,
CONSTRAINT PK_FINANZAS PRIMARY KEY (RESERVA_ID),
CONSTRAINT FK_FINANZAS_RESERVA FOREIGN KEY (RESERVA_ID) REFERENCES RESERVA(ID)
)