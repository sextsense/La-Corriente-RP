USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('police','PFA')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('police',0,'recruit','Agente',10000,'{}','{}'),
	('police',1,'cabo','Cabo',12500,'{}','{}'),
	('police',2,'cabo1','Cabo 1ro',13000,'{}','{}'),
	('police',3,'sargento','Sargento',14000,'{}','{}'),
	('police',4,'sargento1','Sargento 1ro',15000,'{}','{}'),
	('police',5,'subaux','Sub oficial auxiliar',18000,'{}','{}'), 
	('police',6,'intendent','Sub oficial mayor',19000,'{}','{}'),
	('police',7,'officer','Sub inspector',20000,'{}','{}'),
	('police',8,'sergeant','Inspector',23000,'{}','{}'),
	('police',9,'lieutenant','Sub comisario',27000,'{}','{}'), 
	('police',10,'chef','Comisario',30000,'{}','{}'),
	('police',11,'boss','Comisario general',35000,'{}','{}')
;

CREATE TABLE `fine_types` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`label` varchar(255) DEFAULT NULL,
	`amount` int(11) DEFAULT NULL,
	`category` int(11) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `fine_types` (label, amount, category) VALUES
	('Abuso de la bocina',2000,0),
	('Cruzar una línea continua',2500,0),
	('Tráfico inverso',2500,0),
	('Giro en U no permitido',3000,0),
	('Tráfico fuera de carretera',4000,0),
	('Incumplimiento de las distancias de seguridad.',3000,0),
	('Parada peligrosa / prohibida',1500,0),
	('Estacionamiento incómodo / prohibido',3000,0),
	('Incumplimiento de la prioridad correcta',3000,0),
	('Incumplimiento de un vehículo prioritario',3000,0),
	('Incumplimiento de una señal de parar',5000,0),
	('Incumplimiento de una luz roja.',6000,0),
	('Adelantamiento peligroso',3500,0),
	('Vehículo no en buen estado.',4000,0),
	('Conducir sin licencia',7000,0),
	('Delito de fuga',10000,0),
	('Exceso de velocidad <100 km / h',3500,0),
	('Exceso de velocidad 100-150 km / h',4500,0),
	('Exceso de velocidad 150-200 km / h',6500,0),
	('Exceso de velocidad> 300 km / h',8500,0),
	('Obstrucción del tráfico',5000,1),
	('Deterioro de la vía pública.',4000,1),
	('Desorden público',6000,1),
	('Obstrucción de la operación policial.',9000,1),
	('Insultos a / entre civiles',7000,1),
	('Desprecio del oficial de policía',8000,1),
	('Amenaza verbal o intimidación contra civiles.',10000,1),
	('Amenaza verbal o intimidación contra la policía.',15000,1),
	('Demostración ilegal',4000,1),
	('Intento de corrupción',15000,1),
	('Cuchillo en la ciudad',3000,2),
	('Arma letal en la ciudad',8000,2),
	('Transporte no autorizado de armas (falta de licencia)',12000,2),
	('Transporte ilegal de armas.',10000,2),
	('Atrapado en el pestillo de la bandera',3000,2),
	('Robo de autos',10000,2),
	('venta de sustancias',5000,2),
	('fabricacion de sustancias',7000,2),
	('posecion de sustancias',4000,2),
	('Toma de rehenes civiles',15000,2),
	('Toma de rehenes por P.F.A',15000,2),
	('Robo específico',10000,2),
	('Robo en la tienda',20000,2),
	('Robo a un banco',30000,2),
	('Tiroteo civil',15000,3),
	('P.F.A de tiro',10000,3),
	('Intento de asesinato de civiles',20000,3),
	('Intento de asesinato de un P.F.A',30000,3),
	('Asesinato de civiles',40000,3),
	('Muerte de un P.F.A',60000,3),
	('Asesinato involuntario',10000,3),
	('Estafa de negocios',9000,2)
;
