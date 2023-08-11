/*
 Navicat Premium Data Transfer

 Source Server         : local work
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : 127.0.0.1:3306
 Source Schema         : extensiones

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 11/08/2023 13:26:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for documentos
-- ----------------------------
DROP TABLE IF EXISTS `documentos`;
CREATE TABLE `documentos`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_documento` varchar(255) CHARACTER SET koi8u COLLATE koi8u_general_ci NOT NULL,
  `id_tipo` int(3) UNSIGNED NOT NULL,
  `id_subgrupo` int(3) UNSIGNED NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `estatus` bit(1) NOT NULL COMMENT '0 activo, 1 inactivo',
  `ruta` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_tipo`(`id_tipo`) USING BTREE,
  INDEX `fk_subgrupo_documentos`(`id_subgrupo`) USING BTREE,
  CONSTRAINT `fk_subgrupo_documentos` FOREIGN KEY (`id_subgrupo`) REFERENCES `subgrupo_documentos` (`id_subgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_documento` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_documentos` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = latin1 COLLATE = latin1_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of documentos
-- ----------------------------
INSERT INTO `documentos` VALUES (1, 'Gerencia general coorporativa', 1, 1, 'Manual administrativo d la gerencia general coorporativa', b'0', 'MA%20Gcia%20Gral%20Corporativa%20Rev-00%202015.pdf');
INSERT INTO `documentos` VALUES (2, 'Controlatoria coorporativa', 1, 1, 'Manual administrativo de La controlatoria coorporativa', b'0', 'MA%20Contralor%20Rev-00%202015.pdf');
INSERT INTO `documentos` VALUES (3, 'Gerencia coorporativa de aditoria interna', 1, 1, 'Manual de funciones del departamento de aditoria interna', b'0', 'MA%20Auditoria%20Rev-03%202015.pdf');
INSERT INTO `documentos` VALUES (5, 'Gerencia coorporativa de contabilidad', 1, 1, 'Manual administrativo del departamento de contabilidad', b'0', 'MA%20Contabilidad%20Rev-01%202015.pdf');
INSERT INTO `documentos` VALUES (6, 'Gerencia coorporativa de recursos humanos', 1, 1, 'Manual administrativo del departamento de recursos humanos', b'0', 'MA%20RECURSOS%20HUMANOS%20Rev-01%202015.pdf');
INSERT INTO `documentos` VALUES (7, 'Gerencia coorporativa de tesoreria', 1, 1, 'Manual administrativo del departamento de tesoreria', b'0', 'MA%20Depto%20Tesoreria%20Rev-03%202015.pdf');
INSERT INTO `documentos` VALUES (8, 'Gerencia coorporativa de  TI', 1, 1, 'Manual administrativo del departamento de la informacion TI', b'0', 'MA%20Tecnol.%20de%20la%20Informacion%20Rev-01%202015.pdf');
INSERT INTO `documentos` VALUES (11, 'Gerencia coorporativa de administracion de obras', 1, 1, 'Manual administrativo del departamento de administracion de obras', b'0', 'MA%20Adm%20de%20Obras%20Rev-01%202015.pdf');
INSERT INTO `documentos` VALUES (13, 'Direccion y vivienda', 1, 2, 'Manual administrativo de direccion y vivienda', b'0', 'M.A.%20Urbanizadora%20DIR.%20VIVIENDA.pdf');
INSERT INTO `documentos` VALUES (16, 'Gerencia de direccion y vivienda', 1, 2, 'Manual administrativo de la operacion de la gerencia de direccion y vivienda', b'0', 'M.A.O.%20Urbanizadora%20Merida%20Ger.%20Viv.pdf');
INSERT INTO `documentos` VALUES (17, 'Gerencia administrativa ', 1, 3, 'Manual administrativo gerencia administrativa de mafusa y perforaciones de la peninsula', b'0', 'M.A.%20MAFUSA%20Y%20Perforaciones%20Gcia.%20Administrativa.pdf');
INSERT INTO `documentos` VALUES (19, 'Gerencia cancun', 1, 3, 'Manual administrativo gerencia de sucursal cancun de mafusa y perforaciones de la peninsula', b'0', 'M.A.O.%20MAFUSA%20y%20Perforaciones%20Gcia.%20Cancun.pd');
INSERT INTO `documentos` VALUES (21, 'Gerencia comercia', 1, 3, 'Manual administrativo y operativo gerencia comercial de mafusa y perforaciones de la peninsula', b'0', 'M.A.O.%20MAFUSA%20y%20Perforaciones%20Gcia.%20Comercial%20.pdf');
INSERT INTO `documentos` VALUES (22, 'Gerencia general', 1, 3, 'Manual administrativo y operativo gerencia general de mafusa y perforaciones de la peninsula', b'0', 'M.A.O.%20MAFUSA%20y%20Perforaciones%20Gcia.%20Gral.pdf');
INSERT INTO `documentos` VALUES (23, 'Gerencia tecnica', 1, 3, 'Manual administrativo y operativo gerencia tecnica de mafusa y perforaciones de la peninsula', b'0', 'M.A.O.%20MAFUSA%20y%20Perforaciones%20Gcia.%20Tecnica%20.pdf');
INSERT INTO `documentos` VALUES (25, 'Jefatura tecnica', 1, 4, 'Manual administrativo y operativo jefatura tecnica de perforaciones de la peninsula', b'0', 'M.A.O.%20MAFUSA%20y%20Perforaciones%20Jef.%20Tecnica%20MID.pdf');
INSERT INTO `documentos` VALUES (26, 'Gerencia general', 1, 5, 'Manual de fucniones de la gerencia general de trimex', b'0', 'M.A.%20TRIMEX%20Gcia%20General%20.pdf');
INSERT INTO `documentos` VALUES (27, 'Gerencia administrativas', 1, 5, 'Manual de funciones de departamento administrativo de trimex Xtepen', b'0', 'M.A.%20TRIMEX%20UMAN%20-%20Gcia.%20Administrativa.pdf');
INSERT INTO `documentos` VALUES (28, 'Gerencia de produccion', 1, 5, 'Manual de funciones del departamento de produccion de trimex Xtepen', b'0', 'MF%202013%20B-BFGcia.%20de%20Produccion.pdf');
INSERT INTO `documentos` VALUES (30, 'Coordinador general', 1, 6, 'Manual administrativo SyP coordinador general', b'0', 'M.A.%20Structor%20y%20Praimer-Coor.%20General.pdf');
INSERT INTO `documentos` VALUES (31, 'Gerencia administrativa', 1, 6, 'Manual administrativo SyP gerencia administrativa Merida', b'0', 'MA-S&P-Adm.pdf');
INSERT INTO `documentos` VALUES (32, 'Gerencia de logistica R-01', 1, 6, 'Manual administrativo y operativo gerencia de logistica Merida', b'0', 'MA-S&P-Logistica.pdf');
INSERT INTO `documentos` VALUES (33, 'Gerencia de manteniemiento R-01', 1, 6, 'Manual administrativo y operativo gerencia de mantenimiento Merida', b'0', 'MA-S&P-Mantto.pdf');
INSERT INTO `documentos` VALUES (34, 'Asistente de la direccion de construccion', 1, 7, 'Manual de funciones de la asistente de la direccion de construccion', b'0', 'M.F.%20Canteras%20Asistente%20Dir.%20Construccion.pdf');
INSERT INTO `documentos` VALUES (35, 'Compra de vehiculos con arrendamiento financiero', 2, 17, 'Compra de vehiculos con arrendamiento financiero', b'0', NULL);
INSERT INTO `documentos` VALUES (36, 'Desalojo de predios invadidos', 2, 17, 'Desalojo de predios invadidos', b'0', NULL);
INSERT INTO `documentos` VALUES (37, 'Inspeccion de predios', 2, 17, 'Inspeccion de predios', b'0', NULL);
INSERT INTO `documentos` VALUES (38, 'Capacitacion', 2, 17, 'Capacitacion', b'0', NULL);
INSERT INTO `documentos` VALUES (40, 'Escritura de inmuebles', 2, 17, 'Escritura de inmuebles', b'0', NULL);
INSERT INTO `documentos` VALUES (43, 'Entrega de inmuebles', 2, 17, 'Escritura de inmuebles', b'0', NULL);
INSERT INTO `documentos` VALUES (44, 'Contratacion ', 2, 17, 'Contratacion', b'0', NULL);
INSERT INTO `documentos` VALUES (45, 'Reclutamiento y seleccion', 2, 17, 'Reclutamiento y seleccion', b'0', NULL);
INSERT INTO `documentos` VALUES (46, 'Mantenimiento preventivo de maquinaria', 2, 17, 'Mantenimiento preventivo de maquinaria', b'0', NULL);
INSERT INTO `documentos` VALUES (47, 'Elaboracion de presupuesto de SEASU', 2, 17, 'Elaboracion de presupuesto de SEASU', b'0', NULL);
INSERT INTO `documentos` VALUES (48, 'Mantenimiento correctivo maquinaria propia y filiales', 2, 17, 'Mantenimiento correctivo maquinaria propia y filiales', b'0', NULL);
INSERT INTO `documentos` VALUES (49, 'Mantenimiento de maquinaria por terminarcion de obra', 2, 17, 'Mantenimiento de maquinaria por terminarcion de obra', b'0', NULL);
INSERT INTO `documentos` VALUES (50, 'Calculo y pago de comisiones por ventas en llantica', 2, 17, 'Calculo y pago de comisiones por ventas en llantica', b'0', NULL);
INSERT INTO `documentos` VALUES (51, 'Cobranza por compra, venta y arrendamiento de inmuebles', 2, 17, 'Cobranza por compra, venta y arrendamiento de inmuebles', b'0', NULL);
INSERT INTO `documentos` VALUES (52, 'Compra de terrenos', 2, 17, 'Compra de terrenos', b'0', NULL);
INSERT INTO `documentos` VALUES (53, 'Bancos V9', 3, 8, 'Bancos V9', b'0', NULL);
INSERT INTO `documentos` VALUES (54, 'Compras V9', 3, 8, 'Compras V9', b'0', NULL);
INSERT INTO `documentos` VALUES (55, 'Contabilidad V9', 3, 8, 'Contabilidad V9', b'0', NULL);
INSERT INTO `documentos` VALUES (56, 'Creditos puente V9', 3, 8, 'Creditos puente V9', b'0', NULL);
INSERT INTO `documentos` VALUES (57, 'Inventario V9', 3, 8, 'Inventario V9', b'0', NULL);
INSERT INTO `documentos` VALUES (58, 'Precios unitarios V9', 3, 8, 'Precios unitarios V9', b'0', NULL);
INSERT INTO `documentos` VALUES (59, 'Proveedores V9', 3, 8, 'Proveedores V9', b'0', NULL);
INSERT INTO `documentos` VALUES (60, 'Vivienda V9', 3, 8, 'Vivienda V9', b'0', NULL);
INSERT INTO `documentos` VALUES (61, 'Nomina', 3, 8, 'Nomina', b'0', NULL);
INSERT INTO `documentos` VALUES (62, 'Cancelacion de facturas CFDI 4.0', 3, 9, 'Cancelacion de facturas CFDI 4.0', b'0', NULL);
INSERT INTO `documentos` VALUES (63, 'Portal web proveedores', 3, 9, 'Portal web proveedores', b'0', NULL);
INSERT INTO `documentos` VALUES (64, 'Nomina ajustes subsidio para el empleo', 3, 9, 'Nomina ajustes subsidio para el empleo', b'0', NULL);
INSERT INTO `documentos` VALUES (65, 'Manual timbrado V3.3', 3, 9, 'Manual timbrado V3.3', b'0', NULL);
INSERT INTO `documentos` VALUES (66, 'Orden de compra multi CC', 3, 9, 'Orden de compra multi CC', b'0', NULL);
INSERT INTO `documentos` VALUES (67, 'Timbrado de nomina - nomina V1.2', 3, 9, 'Timbrado de nomina - nomina V1.2', b'0', NULL);
INSERT INTO `documentos` VALUES (68, 'Nomina UMA', 3, 9, 'Nomina UMA', b'0', NULL);
INSERT INTO `documentos` VALUES (69, 'Gastos por comprobar', 3, 9, 'Gastos por comprobar', b'0', NULL);
INSERT INTO `documentos` VALUES (70, 'Guia rapida, mejoras precios unitarios', 3, 9, 'Guia rapida, mejoras precios unitarios', b'0', NULL);
INSERT INTO `documentos` VALUES (71, 'Guia rapida para emisiones de complementos de pagos', 3, 9, 'Guia rapida para emisiones de complementos de pagos', b'0', NULL);
INSERT INTO `documentos` VALUES (74, 'Manual conciliacion CFDI 3.2 y 3.3', 3, 9, 'Manual conciliacion CFDI 3.2 y 3.3', b'0', NULL);
INSERT INTO `documentos` VALUES (75, 'Generacion OC de firmas', 3, 10, 'Generacion OC de firmas', b'0', NULL);
INSERT INTO `documentos` VALUES (76, 'Gestor de recibos de nomina', 3, 10, 'Gestor de recibos de nomina', b'0', NULL);
INSERT INTO `documentos` VALUES (77, 'Manual de sistema de acarreos de material', 3, 10, 'Manual de sistema de acarreos de material', b'0', NULL);
INSERT INTO `documentos` VALUES (79, 'Uso y control de uniformes', 4, 18, 'Uso y control de uniformes', b'0', NULL);
INSERT INTO `documentos` VALUES (80, 'Politica de compras', 4, 18, 'Politica de compras', b'0', NULL);
INSERT INTO `documentos` VALUES (81, 'Politica de dias festivos', 4, 18, 'Politica de dias festivos', b'0', NULL);
INSERT INTO `documentos` VALUES (82, 'Control de fondo fijo en oficina central y filiales', 4, 18, 'Control de fondo fijo en oficina central y filiales', b'0', NULL);
INSERT INTO `documentos` VALUES (83, 'Control de fondo fijo en obras', 4, 18, 'Control de fondo fijo en obras', b'0', NULL);
INSERT INTO `documentos` VALUES (84, 'Politica de confidencialidad', 4, 18, 'Politica de confidencialidad', b'0', NULL);
INSERT INTO `documentos` VALUES (85, 'Uso de camaras de seguridad', 4, 18, 'Uso de camaras de seguridad', b'0', NULL);
INSERT INTO `documentos` VALUES (86, 'Credito y cobranza en unidades de negocio centro llantero', 4, 18, 'Credito y cobranza en unidades de negocio centro llantero', b'0', NULL);
INSERT INTO `documentos` VALUES (87, 'Liberacion de fondos de garantia', 4, 18, 'Liberacion de fondos de garantia', b'0', NULL);
INSERT INTO `documentos` VALUES (89, 'Control de viaticos por obra', 4, 18, 'Control de viaticos por obra', b'0', NULL);
INSERT INTO `documentos` VALUES (90, 'Solicitud y asiganacion de equipos de computo', 4, 18, 'Solicitud y asiganacion de equipos de computo', b'0', NULL);
INSERT INTO `documentos` VALUES (91, 'Mantenimiento y reemplazo de equipos de computo', 4, 18, 'Mantenimiento y reemplazo de equipos de computo', b'0', NULL);
INSERT INTO `documentos` VALUES (92, 'Uso de redes ymedios sociales', 4, 18, 'Uso de redes ymedios sociales', b'0', NULL);
INSERT INTO `documentos` VALUES (93, 'Gestion de servicios de tecnologiasde la informacion', 4, 18, 'Gestion de servicios de tecnologiasde la informacion', b'0', NULL);
INSERT INTO `documentos` VALUES (94, 'Control y seguridad de la informacion', 4, 18, 'Control y seguridad de la informacion', b'0', NULL);
INSERT INTO `documentos` VALUES (95, 'Uso y control de consumibles de computo', 4, 18, 'Uso y control de consumibles de computo', b'0', NULL);
INSERT INTO `documentos` VALUES (97, 'Desarrollo de sofware y licenciamiento', 4, 18, 'Desarrollo de sofware y licenciamiento', b'0', NULL);
INSERT INTO `documentos` VALUES (101, 'Control de fondo fijo en oficina central y filiales', 4, 18, 'Control de fondo fijo en oficina central y filiales', b'0', NULL);
INSERT INTO `documentos` VALUES (103, 'Control de fondo fijo en obras', 4, 18, 'Control de fondo fijo en obras', b'0', NULL);
INSERT INTO `documentos` VALUES (104, 'Titulacion y entrega  de inmuebles pertenecientes a los desarrollos del grupo ', 4, 18, 'Titulacion y entrega  de inmuebles pertenecientes a los desarrollos del grupo ', b'0', NULL);
INSERT INTO `documentos` VALUES (105, 'Compras', 4, 18, 'Compras', b'1', NULL);
INSERT INTO `documentos` VALUES (106, 'Elaboracion y control de libros corporativos', 4, 18, 'Elaboracion y control de libros corporativos', b'0', NULL);
INSERT INTO `documentos` VALUES (107, 'Elaboracion y control de presupuestos', 4, 18, 'Elaboracion y control de presupuestos', b'0', NULL);
INSERT INTO `documentos` VALUES (108, 'Pagos con anticipos de compra de productos o servicios', 4, 18, 'Pagos con anticipos de compra de productos o servicios', b'0', NULL);
INSERT INTO `documentos` VALUES (109, 'Control de gastos por concepto de viaticos por viaje', 4, 18, 'Control de gastos por concepto de viaticos por viaje', b'0', NULL);
INSERT INTO `documentos` VALUES (110, 'Uso y control de uniformes Grand Marina', 4, 18, 'Uso y control de uniformes Grand Marina', b'0', NULL);
INSERT INTO `documentos` VALUES (111, 'Control interno de contratos e ingresos Marina Kinuh', 4, 18, 'Control interno de contratos e ingresos Marina Kinuh', b'0', NULL);
INSERT INTO `documentos` VALUES (112, 'Elaboracion de contratos', 4, 18, 'Elaboracion de contratos', b'0', NULL);
INSERT INTO `documentos` VALUES (113, 'Credito y cobranza en empresas del grupo', 4, 18, 'Credito y cobranza', b'0', NULL);
INSERT INTO `documentos` VALUES (115, 'Compra y venta de inmuebles patrimoniales', 4, 18, 'Compra y venta de inmuebles patrimoniales', b'0', NULL);
INSERT INTO `documentos` VALUES (116, 'Politica de venta de maquinaria', 4, 18, 'Politica de venta de maquinaria', b'0', NULL);
INSERT INTO `documentos` VALUES (117, 'Politica de vacaciones R-03 ', 4, 18, 'Politica de vacaciones R-03 ', b'0', NULL);
INSERT INTO `documentos` VALUES (118, 'Puntualidad, faltas y permisos R-02', 4, 18, 'Puntualidad, faltas y permisos R-02', b'0', NULL);
INSERT INTO `documentos` VALUES (119, 'Normas funcionamiento de oficinas', 4, 18, 'Normas funcionamiento de oficinas', b'0', NULL);
INSERT INTO `documentos` VALUES (120, 'Normas de comportamiento y diciplina', 4, 18, 'Normas de comportamiento y diciplina', b'0', NULL);
INSERT INTO `documentos` VALUES (121, 'Codigo de conducta uso de vehiculos R-01', 4, 18, 'Codigo de conducta uso de vehículos R-01', b'0', NULL);
INSERT INTO `documentos` VALUES (122, 'Venta de vehiculos utilitarios', 4, 18, 'Venta de vehículos utilitarios', b'0', NULL);
INSERT INTO `documentos` VALUES (123, 'Entrega de contra recibos a proveedores externos', 4, 18, 'Entrega de contra-recibos a proveedores externos', b'0', NULL);
INSERT INTO `documentos` VALUES (124, 'Ahorro de energia R00', 4, 18, 'Ahorro de energía R-00', b'0', NULL);
INSERT INTO `documentos` VALUES (125, 'Calculo de depreciaciones de activo fijo', 4, 18, 'Cálculo de depreciaciones de activo fijo', b'0', NULL);
INSERT INTO `documentos` VALUES (126, 'Cierre mensual de CxCOBRAR y CxPAGAR', 4, 18, 'Cierre mensual de CxCOBRAR y CxPAGAR', b'0', NULL);
INSERT INTO `documentos` VALUES (127, 'Cierre y manejo de inventarios', 4, 18, 'Cierre y manejo de inventarios', b'0', NULL);
INSERT INTO `documentos` VALUES (128, 'Comprobacion de gastos por visita a obra', 4, 18, 'Comprobación de gastos por visita a obra', b'0', NULL);
INSERT INTO `documentos` VALUES (129, 'Control de acceso al estacionamiento interno R-00', 4, 18, 'Control de acceso al estacionamiento interno R-00', b'0', NULL);
INSERT INTO `documentos` VALUES (130, 'Control y reguardo de celulares', 4, 18, 'Control y reguardo de celulares', b'0', NULL);
INSERT INTO `documentos` VALUES (131, 'Creacion y manejo de insumos EnKontrol', 4, 18, 'Creación y manejo de insumos EnKontrol', b'0', NULL);
INSERT INTO `documentos` VALUES (133, 'OC Cheques y efectivo', 4, 18, 'OC Cheques y efectivo', b'0', NULL);
INSERT INTO `documentos` VALUES (134, 'Pago de comisiones TRIMEX', 4, 18, 'Pago de comisiones - TRIMEX', b'0', NULL);
INSERT INTO `documentos` VALUES (135, 'Pago de comisiones PROYECTOS YUCATAN R-07', 4, 18, 'Pago de comisiones PROYECTOS YUCATAN R-07', b'0', NULL);
INSERT INTO `documentos` VALUES (136, 'Pago de comisiones URBANIZADORA Q. ROO R-03', 4, 18, 'Pago de comisiones URBANIZADORA Q. ROO R-03', b'0', NULL);
INSERT INTO `documentos` VALUES (137, 'Registro de consumo por area cuenta', 4, 18, 'Registro de consumo por área cuenta', b'0', NULL);
INSERT INTO `documentos` VALUES (138, 'Requisiciones y ordenes de compra', 4, 18, 'Requisiciones y órdenes de compra', b'0', NULL);
INSERT INTO `documentos` VALUES (139, 'Varias aplicables en campo', 4, 18, 'Varias aplicables en campo', b'0', NULL);
INSERT INTO `documentos` VALUES (140, 'Requerimiento de equipo de computo', 5, 11, 'Requerimiento de equipo de cómputo', b'0', NULL);
INSERT INTO `documentos` VALUES (141, 'Logos autorizados para GCP', 5, 11, 'Logos autorizados para GCP', b'0', NULL);
INSERT INTO `documentos` VALUES (142, 'Layout documentacion TI', 5, 11, 'Layout documentación TI', b'0', NULL);
INSERT INTO `documentos` VALUES (143, 'Hoja de servicios', 5, 11, 'Hoja de servicios', b'0', NULL);
INSERT INTO `documentos` VALUES (144, 'Formato de permisos empleados', 5, 12, 'Formato de permisos empleados', b'0', NULL);
INSERT INTO `documentos` VALUES (145, 'Solicitud de viaticos', 5, 12, 'SA-FF03-PL-GV-001 Solicitud de viaticos', b'0', NULL);
INSERT INTO `documentos` VALUES (146, 'Comprobacion de viaticos', 5, 12, 'SA-FF03-PLGV-002 Comprobación de viáticos', b'0', NULL);
INSERT INTO `documentos` VALUES (147, 'Requisicion de personal', 5, 12, 'SA-FF03-PRRS-001 Requisición de personal', b'0', NULL);
INSERT INTO `documentos` VALUES (148, 'Evaluacion del candidato', 5, 12, 'SA-FF03-PRRS-003 Evaluación del candidato', b'0', NULL);
INSERT INTO `documentos` VALUES (149, 'Formato de alta de proveedores', 5, 13, 'Formato de alta de proveedores', b'0', NULL);
INSERT INTO `documentos` VALUES (150, 'Formato solicitud de adquisiciones de vehiculos', 5, 14, 'SA-FF02-001 Formato de adquisición de vehículos', b'0', NULL);
INSERT INTO `documentos` VALUES (151, 'Solicitud para contratos de suministro,instalacion y prestaciones de servicios', 5, 15, 'SA-FF05-PLCO-001 Solicitus para contratos de suministros, instalación y prestación de servicios', b'0', NULL);
INSERT INTO `documentos` VALUES (152, 'Solicitud para elaboracion de contrato para el area inmobiliaria', 5, 15, 'SA-FF05-PLCO-002Solicitud para elaboración de contrato para el area inmobiliaria', b'0', NULL);
INSERT INTO `documentos` VALUES (153, 'Solicitud de contrato para servicios de resguardo en marina', 5, 15, 'SA-FF05-PLCO-003 Solicitud de contrato para servicios de resguardo en marina', b'0', NULL);
INSERT INTO `documentos` VALUES (154, 'Orden de trabajo', 5, 15, ' SA-FF05-PLCO-004 Orden de trabajo', b'0', NULL);
INSERT INTO `documentos` VALUES (155, 'Presupuesto centro de costo', 5, 16, 'SA-FF11-PREP-001 Presupuesto', b'0', NULL);
INSERT INTO `documentos` VALUES (156, 'Asesor de construccion e ingenieria economica y financiera', 1, 7, 'Manual de funciones del asesor de construccion e ingenieria economica y financiera', b'0', 'M.F.%20Canteras%20Asesor%20de%20Construccion%20e%20Ingenieria.pdf');
INSERT INTO `documentos` VALUES (157, 'Gerencia de construccion', 1, 7, 'Manual de funciones de la gerencia de constraccion', b'0', 'M.F.%20Canteras%20Gcia%20de%20Construccion.pdf');
INSERT INTO `documentos` VALUES (158, 'Gerencia de costos', 1, 7, 'Manual de las funciones del personal de la gerencia de ingenieria de costos', b'0', 'M.F.%20Canteras%20Gcia%20de%20Ing%20de%20Costos.pdf');

-- ----------------------------
-- Table structure for emails
-- ----------------------------
DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails`  (
  `email` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(240) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dominio` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emails
-- ----------------------------
INSERT INTO `emails` VALUES ('5llantas.merida@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('aclares@praimer.com.mx', 'Adrian Clares', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('admon.ventas@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('alineaciones@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('almacen.cancun@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('almacen.merida@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('asesor01@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('asesor03@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('asesor05@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('asesor06@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('avargueza@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('aventascancun@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('btun@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('buzon@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('buzonfiscal@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('cmedina@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('contacto@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('contadorgral@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('cyc.cancun@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('cyc.merida@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('ddzul@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('demo@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('diana.mendez@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('dolores.garcia@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('ecocom@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('erick.chi@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('escaner@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('facdig@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('facturista.campeche@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('facturista.circuito@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('facturista.industrial@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('facturista.matriz@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('fiscal@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('gperezd@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('gpraimer@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('gventas@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('incon@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('jaime.alonzo@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('jatar.atala@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('jcanche@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('jcastillo@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('jesus.hernandez@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('jorge.espadas@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('jpachecop@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('jucan@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('lourdes.pool@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('luis.luna@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('magaly.lopez@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('mcasares@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('mespinosa@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('mnahuat@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('pserviciocancun1@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('pserviciocanek@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('pservicioindustrial@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('pserviciomatriz@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('pserviciooriente@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('pservicioplaya1@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('pservicioprogreso@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('pzapata@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('rcabrerac@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('resguardoxml@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('rmanrique@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('scabrerau@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('sitioweb@praimer.com.mx', '', 'praimer.com.mx', 1);
INSERT INTO `emails` VALUES ('tomas.soberanis@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('ventas.aceites@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('ventascun001@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('ventascun002@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('ventascun003@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('ventascun004@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('ventascun005@llantica.com', '', 'llantica.com', 1);
INSERT INTO `emails` VALUES ('ventascun006@llantica.com', '', 'llantica.com', 1);

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados`  (
  `id_emp` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ext` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `depto` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `comentarios` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_emp`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES (2, 'Linda Perez', '101', 'Direccion', 'Corporativo');
INSERT INTO `empleados` VALUES (4, 'Abel Paredes', '103', 'Direccion', 'Corporativo');
INSERT INTO `empleados` VALUES (6, 'Yazmine Coronado', '117', 'Compras', 'Corporativo');
INSERT INTO `empleados` VALUES (8, 'Jose Gongora', '119', 'Compras', 'Corporativo');
INSERT INTO `empleados` VALUES (9, 'Olegario Blanco', '120', 'Compras', 'Corporativo');
INSERT INTO `empleados` VALUES (10, 'Jerohan MC', '138', 'TI', 'Gerencias');
INSERT INTO `empleados` VALUES (14, 'Esteban Ku', '131', 'TI', 'Sistemas');
INSERT INTO `empleados` VALUES (17, 'Geovani Canche', '137', 'TI', 'Redes Y Servidores');
INSERT INTO `empleados` VALUES (18, 'Nancy Couoh', '151', 'RH', 'Corporativo');
INSERT INTO `empleados` VALUES (20, 'Recursos Humanos', '158', 'RH', 'Corporativo');
INSERT INTO `empleados` VALUES (21, 'Ilse Chable', '152', 'RH', 'Procesos');
INSERT INTO `empleados` VALUES (22, 'Reclutamiento', '157', 'RH', 'RH');
INSERT INTO `empleados` VALUES (23, 'Jorge Dominguez', '154', 'RH', 'Servicios Generales');
INSERT INTO `empleados` VALUES (24, 'David Huchim', '155', 'RH', 'RH');
INSERT INTO `empleados` VALUES (27, 'Contabilidad', '187', 'Contabilidad', 'Corporativo');
INSERT INTO `empleados` VALUES (28, 'Cristina Alpuche', '188', 'Contabilidad', 'Corporativo');
INSERT INTO `empleados` VALUES (30, 'Maria Cuy', '201', 'Contraloria', 'Corporativo');
INSERT INTO `empleados` VALUES (31, 'Mario Caamal', '202', 'Contraloria', 'Gerencias');
INSERT INTO `empleados` VALUES (33, 'Diana Mendez', '300', 'Finanza Patrimonial', 'Corporativo');
INSERT INTO `empleados` VALUES (34, 'CP Magaly Lopez', '301', 'Finanza Patrimonial', 'Corporativo');
INSERT INTO `empleados` VALUES (36, 'Ileana Chim', '217', 'Inmobiliaria', 'Admon Inmob');
INSERT INTO `empleados` VALUES (37, '', '218', 'Inmobiliaria', 'Admon Inmob');
INSERT INTO `empleados` VALUES (40, 'Pendiente Legal', '231', 'Legal', 'Corporativo');
INSERT INTO `empleados` VALUES (41, 'Andres Saury', '232', 'Legal', 'Corporativo');
INSERT INTO `empleados` VALUES (42, 'Edgar Kantun', '233', 'Legal', 'Corporativo');
INSERT INTO `empleados` VALUES (45, 'Nomina02', '171', 'Nomina', 'Corporativo');
INSERT INTO `empleados` VALUES (46, 'Gustavo Dzib', '172', 'Nomina', 'Corporativo');
INSERT INTO `empleados` VALUES (47, 'Nomina', '173', 'Nomina', 'Corporativo');
INSERT INTO `empleados` VALUES (48, 'Mercy Manrique', '246', 'Concursos', 'Corporativo');
INSERT INTO `empleados` VALUES (49, 'Arianna Castaneda', '247', 'Concursos', 'Corporativo');
INSERT INTO `empleados` VALUES (51, 'Eduardo Cetina', '249', 'Control de Obra', 'Control de Obra');
INSERT INTO `empleados` VALUES (52, 'Avelino Baas', '250', 'Concursos', 'Control Costos');
INSERT INTO `empleados` VALUES (53, 'Maria Pech', '316', 'Finanzas', 'CxP');
INSERT INTO `empleados` VALUES (55, 'Maria Jose Calderon', '318', 'Finanzas', 'CxC');
INSERT INTO `empleados` VALUES (56, 'Juani Esquivel', '319', 'Finanzas', 'Finanzas');
INSERT INTO `empleados` VALUES (58, 'Reyna Borges', '321', 'Finanzas', 'Finanzas');
INSERT INTO `empleados` VALUES (59, 'Ingrid Gomez', '322', 'Finanzas', 'CXC');
INSERT INTO `empleados` VALUES (60, 'Angelica Araujo', '323', 'Finanzas', 'Gerencias');
INSERT INTO `empleados` VALUES (63, 'Recepcion Hotel', '810', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (64, 'Sala de Juntas', '800', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (67, 'Marina', '805', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (68, 'Mercadito', '806', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (69, 'Site Marina', '809', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (70, 'Compras', '811', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (71, 'Ingresos(Caja General)', '804', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (72, 'Sistemas GrandMarina', '807', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (73, 'Restaurant', '812', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (74, 'Recusros Humanos', '808', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (75, 'Carlos Parra', '511', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (76, 'Xtepen Admin', '501', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (77, 'Xtepen Prod', '502', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (78, 'Hacienda Trimex', '503', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (79, 'Ernesto Robles', '504', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (80, 'Sala de Juntas', '505', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (81, 'Felipe Santana', '506', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (82, 'Antonio Che', '507', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (83, 'Vigilancia', '508', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (84, 'Xtepen Prod L2', '509', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (85, 'Ventas Xtepen', '500', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (86, 'Almacen Xtepen', '510', 'Trimex', 'Trimex');
INSERT INTO `empleados` VALUES (87, 'Gerencia Administracion', '803', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (88, 'Cristopher Pech', '220', 'Inmobiliaria', 'Inmobiliaria');
INSERT INTO `empleados` VALUES (89, 'Rafael Orta', '221', 'Inmobiliaria', 'Inmobiliaria');
INSERT INTO `empleados` VALUES (91, 'Sala de Capacitacion', '159', 'RH', 'RH');
INSERT INTO `empleados` VALUES (93, 'Juan Gonzales', '530', 'MFS', 'MFS');
INSERT INTO `empleados` VALUES (94, 'Yunari Barcelo', '531', 'MFS', 'MFS');
INSERT INTO `empleados` VALUES (95, 'Jildardo Guillen', '190', 'Contabilidad', 'Contabilidad');
INSERT INTO `empleados` VALUES (97, 'Auxiliar Administrativo', '813', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (98, 'Ariadne Peche', '186', 'Contabilidad', 'Contabilidad');
INSERT INTO `empleados` VALUES (99, 'Auxiliar Financiero', '814', 'Kinuh', 'Kinuh');
INSERT INTO `empleados` VALUES (100, 'Samuel Pamplona', '134', 'TI', 'SopTec');
INSERT INTO `empleados` VALUES (103, 'Diego Medina', '248', 'Concursos', 'Concursos');
INSERT INTO `empleados` VALUES (104, 'Leonardo Cauich', '156', 'RH', 'RH');
INSERT INTO `empleados` VALUES (105, 'Angel Aban', '121', 'Compras', 'Compras');
INSERT INTO `empleados` VALUES (106, 'Polvorin Merida', '9991090022', 'MFS', 'Linea Celular');
INSERT INTO `empleados` VALUES (107, 'Polvorin Cancun', '9981958717', 'MFS', 'Linea Celular');
INSERT INTO `empleados` VALUES (108, 'MFS Cancun', '9981958717', 'MFS', 'Linea Celular');
INSERT INTO `empleados` VALUES (109, 'Fernando Perez', '118', 'Compras', 'Compras');
INSERT INTO `empleados` VALUES (110, 'Soporte Tecnico', '135', 'TI', 'SopTec');

-- ----------------------------
-- Table structure for etiquetas_documentos
-- ----------------------------
DROP TABLE IF EXISTS `etiquetas_documentos`;
CREATE TABLE `etiquetas_documentos`  (
  `id_etiquetas` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id_etiquetas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of etiquetas_documentos
-- ----------------------------

-- ----------------------------
-- Table structure for ips
-- ----------------------------
DROP TABLE IF EXISTS `ips`;
CREATE TABLE `ips`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Grupo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Ip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Descripcion` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TeamViewer` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Persona` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Email` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Email2` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `Id_UNIQUE`(`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ips
-- ----------------------------
INSERT INTO `ips` VALUES (1, 'IT', '192.168.1.209', 'Coorporativo', NULL, 'Jerohan', 'jmukul@gpocanteras.com.mx', NULL);
INSERT INTO `ips` VALUES (2, 'SITE', '192.168.1.254', 'Fortinet', NULL, 'TI', 'NA', 'NA');
INSERT INTO `ips` VALUES (3, 'SITE', '192.168.1.242', 'Pbx', NULL, 'TI', 'NA', 'NA');

-- ----------------------------
-- Table structure for rel_etiquetas_documentos
-- ----------------------------
DROP TABLE IF EXISTS `rel_etiquetas_documentos`;
CREATE TABLE `rel_etiquetas_documentos`  (
  `id_rel_etiquetas_docuementos` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_etiquetas` int(3) UNSIGNED NOT NULL,
  `id_documentos` int(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_rel_etiquetas_docuementos`) USING BTREE,
  INDEX `fk_rel_etiquetas_documentos`(`id_etiquetas`) USING BTREE,
  INDEX `fk_rel_documentos_etiquetas`(`id_documentos`) USING BTREE,
  CONSTRAINT `fk_rel_documentos_etiquetas` FOREIGN KEY (`id_documentos`) REFERENCES `documentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rel_etiquetas_documentos` FOREIGN KEY (`id_etiquetas`) REFERENCES `etiquetas_documentos` (`id_etiquetas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rel_etiquetas_documentos
-- ----------------------------

-- ----------------------------
-- Table structure for subgrupo_documentos
-- ----------------------------
DROP TABLE IF EXISTS `subgrupo_documentos`;
CREATE TABLE `subgrupo_documentos`  (
  `id_subgrupo` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_subgrupo` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id_subgrupo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subgrupo_documentos
-- ----------------------------
INSERT INTO `subgrupo_documentos` VALUES (1, 'Coorporativo');
INSERT INTO `subgrupo_documentos` VALUES (2, 'Urbanizadora PyC');
INSERT INTO `subgrupo_documentos` VALUES (3, 'Mafusa');
INSERT INTO `subgrupo_documentos` VALUES (4, 'Perforaciones de la Peninsula');
INSERT INTO `subgrupo_documentos` VALUES (5, 'Trimex');
INSERT INTO `subgrupo_documentos` VALUES (6, 'Primer y Struture');
INSERT INTO `subgrupo_documentos` VALUES (7, 'Direccion de construccion');
INSERT INTO `subgrupo_documentos` VALUES (8, 'Enkontrol V9');
INSERT INTO `subgrupo_documentos` VALUES (9, 'Guias Rapidas Enkontrol V9');
INSERT INTO `subgrupo_documentos` VALUES (10, 'Otros');
INSERT INTO `subgrupo_documentos` VALUES (11, 'Tecnologia de la Informacion');
INSERT INTO `subgrupo_documentos` VALUES (12, 'Recursos Humanos');
INSERT INTO `subgrupo_documentos` VALUES (13, 'Cuentas por pagar');
INSERT INTO `subgrupo_documentos` VALUES (14, 'Compras');
INSERT INTO `subgrupo_documentos` VALUES (15, 'Juridico');
INSERT INTO `subgrupo_documentos` VALUES (16, 'Controlatoria');
INSERT INTO `subgrupo_documentos` VALUES (17, 'Procedimientos');
INSERT INTO `subgrupo_documentos` VALUES (18, 'Politicas');

-- ----------------------------
-- Table structure for tipo_documentos
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documentos`;
CREATE TABLE `tipo_documentos`  (
  `id_tipo` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id_tipo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipo_documentos
-- ----------------------------
INSERT INTO `tipo_documentos` VALUES (1, 'Manuales Administrativos');
INSERT INTO `tipo_documentos` VALUES (2, 'Procedimientos');
INSERT INTO `tipo_documentos` VALUES (3, 'Manuales TI');
INSERT INTO `tipo_documentos` VALUES (4, 'Politicas');
INSERT INTO `tipo_documentos` VALUES (5, 'Formatos');

SET FOREIGN_KEY_CHECKS = 1;
