DROP DATABASE IF EXISTS `ecommerce`;
CREATE DATABASE IF NOT EXISTS `ecommerce` 
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;









USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` BIGINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `identify_document` VARCHAR(15) NOT NULL UNIQUE,
  `email` VARCHAR(45) NOT NULL,
  `phone` INT(15) NOT NULL,
  `address` VARCHAR(65) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `zip_code` INT NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `registration_date` DATE NOT NULL,
  `payment_info` VARCHAR(45) NOT NULL,
  `account_status` VARCHAR(20) NOT NULL,
  `username` VARCHAR(45) NOT NULL UNIQUE,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_customer`))
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplier` (
  `id_supplier` BIGINT NOT NULL AUTO_INCREMENT,
  `supplier_name` VARCHAR(45) NULL,
  `contact_person` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone` INT(15) NULL,
  `additional_notes` VARCHAR(45) NULL,
  `bank_info` VARCHAR(45) NULL,
  PRIMARY KEY (`id_supplier`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product` (
  `id_product` BIGINT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `stock_quantity` INT NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `creation_date` DATE NOT NULL ,
  `update_date` DATE NULL,
  `discount` DECIMAL(5,2) NOT NULL,
  `taxes` DECIMAL(5,2) NOT NULL,
  `product_image` VARCHAR(255) NOT NULL,
  `availability` BOOLEAN NOT NULL,
  `technical_specifications` TEXT NULL,
  `supplier_id_supplier` BIGINT NOT NULL,
  PRIMARY KEY (`id_product`, `supplier_id_supplier`),
  CONSTRAINT `fk_product_supplier1`
    FOREIGN KEY (`supplier_id_supplier`)
    REFERENCES `supplier` (`id_supplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `purchase_order` (
  `id_order` BIGINT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `order_status` VARCHAR(45) NOT NULL,
  `payment_method` VARCHAR(45) NOT NULL,
  `total_order_amount` DECIMAL(10,2) NOT NULL,
  `customer_notes` VARCHAR(45) NOT NULL,
  `estimated_delivery_date` DATE NOT NULL,
  `shipping_date` DATE NOT NULL,
  `purchase_id_customer` BIGINT NOT NULL,
  PRIMARY KEY (`id_order`, `purchase_id_customer`),
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`purchase_id_customer`)
    REFERENCES `customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DeliveryNote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delivery_note` (
  `id_deliverynote` BIGINT NOT NULL AUTO_INCREMENT,
  `dispatch_date` DATE NULL,
  `shipping_details` VARCHAR(45) NULL,
  `receiver_signature` VARCHAR(45) NULL,
  `delivery_status` VARCHAR(45) NULL,
  `delivery_notes` VARCHAR(45) NULL,
  `purchase_order_id_order` BIGINT NOT NULL,
  PRIMARY KEY (`id_deliverynote`, `purchase_order_id_order`),
  CONSTRAINT `fk_deliverynote_order1`
	  FOREIGN KEY (`purchase_order_id_order`)
	  REFERENCES `purchase_order` (`id_order`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoice` (
  `id_invoice` BIGINT NOT NULL AUTO_INCREMENT,
  `invoice_date` DATE NULL,
  `due_date` DATE NULL,
  `shipping_details` VARCHAR(45) NULL,
  `subtotal` DECIMAL(10,2) NULL,
  `taxes` DECIMAL(10,2) NULL,
  `discounts` DECIMAL(10,2) NULL,
  `total_invoice_amount` DECIMAL(10,2) NULL,
  `payment_status` VARCHAR(45) NULL,
  `invoice_notes` VARCHAR(45) NULL,
  `purchase_order_id_order` BIGINT NOT NULL,
  PRIMARY KEY (`id_invoice`, `purchase_order_id_order`),
  CONSTRAINT `fk_invoice_order1`
	  FOREIGN KEY (`purchase_order_id_order`)
	  REFERENCES `purchase_order` (`id_order`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION)

ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product_has_Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_has_order` (
  `id_product_has_order` BIGINT AUTO_INCREMENT,
  `product_id_product` BIGINT NOT NULL,
  `purchase_order_id_order` BIGINT NOT NULL,
  PRIMARY KEY (`id_product_has_order`),
  CONSTRAINT `fk_product_has_order_product`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_order_order`
    FOREIGN KEY (`purchase_order_id_order`)
    REFERENCES `purchase_order` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- DATOS EJEMPLO:

-- Insertar datos de ejemplo en la tabla Customer
INSERT INTO customer (id_customer, first_name, last_name, identify_document, email, phone, address, city, province, zip_code, country, registration_date, payment_info, account_status, username, password)
VALUES
(1, 'Sergi', 'Gavin','11223344K', 'sergi.gs@hotmail.es', '123456789', 'Carrer Batllevell 80', 'Sabadell', 'Barcelona', 08208, 'España', '2023-01-01', 'Credit Card', 'Active', 'Sergi', 'Sergi123'),
(2, 'David', 'Mouriz','22334455L', 'davidmou@gmail.com', '987654321', 'Calle Perales 2', 'León', 'León', 24007, 'España', '2023-01-02', 'Credit Card', 'Active', 'David', 'David123'),
(3, 'Rubén', 'Rodriguez','66778899S', 'ruben@gmail.com', '555666777', 'Calle Alcantara 27', 'Valladolid', 'Valladolid', 47011, 'España', '2023-01-03', 'Credit Card', 'Active', 'Ruben', 'Ruben123');

-- Insertar datos de ejemplo en la tabla Supplier
INSERT INTO supplier (id_supplier, supplier_name, contact_person, email, phone, additional_notes, bank_info)
VALUES
(1, 'ComponentesPC S.L', 'Pedro', 'componentespc@gmail.com', '111222333', 'Contacto con Pedro', 'ES21 1465 0100 72 2030876293'),
(2, 'GamingParaTi S.L', 'Marta', 'marta@gamingparati.com', '444555666', 'Contacto con Maria', 'ES21 1465 0100 72 2031235741'),
(3, 'TelevisoresTV', 'Marcos', 'marcos@televisorestv.com', '777888999', 'Contacto con Marcos', 'ES21 1465 0100 72 1098736320');


-- Insertar datos de ejemplo en la tabla Product
INSERT INTO product (id_product, product_name, description, price, stock_quantity, category, creation_date, update_date, discount, taxes, product_image, availability, technical_specifications, supplier_id_supplier)
VALUES
(1, 'NVIDIA GeForce RTX 4090', 'La NVIDIA® GeForce RTX™ 4090 es la GPU GeForce definitiva. Ofrece un enorme salto en rendimiento, eficiencia y gráficos impulsados por IA con DLSS 3. Experimente juegos de rendimiento ultraalto, mundos virtuales increíblemente detallados con trazado de rayos, productividad sin precedentes y nuevas formas de crear. Está impulsado por la arquitectura NVIDIA Ada Lovelace y viene con 24 GB de memoria G6X para brindar la mejor experiencia a jugadores y creadores.', 1899.99, 100, 'Tarjeta Gráfica', '2023-01-01', NULL, 0.10, 0.21, 'https://img.pccomponentes.com/articles/1079/10792156/1155-msi-geforce-rtx-4090-gaming-x-slim-24gb-gddr6x-dlss3.jpg', TRUE, 'Unidad de procesamiento de gráficos NVIDIA® GeForce RTX™ 4090
Interfaz PCI Express® Gen 4
Relojes centrales
Rendimiento extremo: 2610 MHz (MSI Centro)
Aumento: 2595 MHz (modo JUEGO Y SILENCIO)
NÚCLEO CUDA® 16384 Unidades
Velocidad de memoria 21 Gbps
Memoria 24GB GDDR6X
Bus de memoria de 384 bits
Producción
DisplayPort x 2 (v1.4a)
HDMI™ x 2 (admite 4K@120Hz HDR y 8K@60Hz HDR y frecuencia de actualización variable (VRR) como se especifica en HDMI 2.1a)
Soporte HDCP Sí
Consumo de energía 450 W
Conectores de alimentación de 16 pines x 1
Fuente de alimentación recomendada 850 W
Dimensiones de la tarjeta (mm) 322 x 136 x 62 mm
Peso (Tarjeta/Paquete) 1777 g / 2652 g
Compatibilidad con la versión DirectX 12 Ultimate
Soporte de versión OpenGL 4.6
Pantallas máximas 4
Tecnología G-SYNC® Sí
Resolución máxima digital 7680 x 4320', 1),
(2, 'LG 43UR73006LA 43" LED UltraHD 4K HDR10 Pro"', 'El LG UHD TV Serie 73 con HDR10 Pro cuenta con unos niveles de brillo optimizados para que los colores sean más intensos y los detalles más notables.', 339.01, 50, 'TV', '2023-01-02', NULL, 0.02, 0.21, 'https://img.pccomponentes.com/articles/1073/10735859/1304-lg-43ur73006la-43-led-ultrahd-4k-hdr10-pro.jpg', FALSE, 'Exhibición:
Diagonal de la pantalla: 109,2 cm (43")
Tipo HD: 4K Ultra HD
Escaneado progresivo: Si
Tecnología de visualización: LED
Forma de la pantalla: Plana
Relación de aspecto nativa: 16:9
Formato de pantalla, ajustes: 4:3, Acercar, 16:9
Frecuencia nativa de refresco: 50 Hz
Resolución de la pantalla: 3840 x 2160 Pixeles
Diagonal de pantalla: 109,22 cm
Sintonizador de la TV
Tipo de sintonizador: Digital
Señal analógica: No compatible
Formato de señal digital: DVB-T2, DVB-S2
Número de sintonizadores: 1 sintonizador(es)
Autobusqueda de canal: Si
Smart TV
Smart TV: Si
TV por Internet: Si
Sistema operativo instalado: Web OS
Versión de sistema operativo: webOS 23
Grabación diferida (timeshift): No
Duplicación de pantalla: Si
Vídeo a la carta de apoyo (VOD): Si
Compatible con Apple AirPlay 2: Si
HbbTV: Si
Modos inteligentes: Cine, Modo director, Juego, Deportes, Estándar
Aplicaciones de vídeo: DAZN, Disney+, Amazon Prime Video, YouTube, Apple TV, RaiPlay, Rakuten TV, NOW TV, Netflix
Aplicaciones de música: Spotify
Aplicaciones de deportes: DAZN, Sports Alerts
Aplicaciones de estilo de vida: Sedition Art
Audio:
Número de altavoces: 2
Potencia estimada RMS: 20 W
Subwoofer incorporado: No
Subwoofer inalámbrico: No
Decodificadores incorporados: Dolby Digital
Modos de sonido: AI Sound
Nivelador automático de volumen: Si
Sonido adaptativo: Si
Sonido de seguimiento de objetos+ (OTS+, Object Tracking Sound+): No
Multiroom: No
Enhanced Audio Return Channel (eARC) (Canal de retorno de audio mejorado): Si
Control de sonido adaptativo (ASC, Adaptive Sound Control): Si
Conexión:
Wifi: Si
Ethernet: Si
Wi-Fi estándares: 802.11a, Wi-Fi 5 (802.11ac), 802.11b, 802.11g, Wi-Fi 4 (802.11n)
Wi-Fi Direct: No
Bluetooth: Si
Versión de Bluetooth: 5.0
Bluetooth de baja energía (BLE, Bluetooth Low Energy): Si
Miracast: No
Navegación: Si
Navegador web: Si', 2),
(3, 'Tempest K11 Ogre Teclado Mecánico Gaming RGB Negro', 'Un teclado con tecnología de cable reforzado mallado USB que destaca por su diseño y ergonomía desde su primer uso. Su supresión de teclado numérico lateral te proporciona una libertad de movimiento más amplia con el objetivo de que tu tiempo de reacción y respuesta, se reduzcan considerablemente, ya que te evitará el efecto choque entre ratón y teclado.', 25.99, 75, 'Teclado', '2023-01-03', NULL, 0.03, 0.21, 'https://img.pccomponentes.com/articles/43/433512/1815-tempest-k11-ogre-teclado-mecanico-gaming-rgb-negro-especificaciones.jpg', TRUE, 'Número de teclas: 87 teclas
Mecanico: Si
Switch: Azul OUTEMU
Teclas de doble inyección
Teclas de combinación FN para funciones multimedia
Cubierta superior de plástico
Cubierta inferior de ABS
Medidas: 360mm*135mm*37mm 
Peso: 670gr', 3),
(4,'HP Victus 16-r0019ns ','El portátil HP Victus se ha diseñado para jugar con la máxima calidad. Este elegante dispositivo cuenta con un procesador Intel® Core™ de 13.ª generación y una tarjeta gráfica NVIDIA® moderna. Este portátil también dispone de nuevas características de optimización para ofrecer un rendimiento todavía mejor , un diseño térmico mejorado y un teclado perfeccionado.', 1499.95,20,'Portatil','2023-01-07', NULL, 0.05, 0.21,'https://img.pccomponentes.com/articles/1073/10733300/1385-hp-victus-16-r0019ns-intel-core-i7-13700h-32gb-1tb-ssd-rtx-4060-161.jpg',TRUE,
 'Procesador Intel® Core™ i7-13700H (hasta 5,0 GHz con tecnología Intel® Turbo Boost, 24 MB de caché L3, 14 núcleos, 20 subprocesos)
Memoria RAM RAM DDR5-5200 MHz 32 GB (2 x 16 GB)
Almacenamiento SSD M.2 1 TB PCIe® Gen4 NVMe™ TLC
Unidad óptica No dispone
Display 40,9 cm (16,1") en diagonal, FHD (1920 x 1080), 144 Hz, IPS, microborde, antirreflectante, 250 nits, 45 % NTSC
Controlador gráfico NVIDIA® GeForce RTX™ 4060 (GDDR6 de 8 GB dedicada)
Conectividad
LAN 10/100/1000 GbE integrada
Tarjeta inalámbrica Intel® Wi-Fi 6E AX211 (2x2) y Bluetooth® 5.3 (soporta velocidad de datos Gigabit)
Webcam Cámara FHD HP True Vision 1080p con reducción temporal de ruidos y micrófonos digitales de matriz doble integrados
Audio Audio de B&O; Altavoces duales; HP Audio Boost
Teclado Teclado de tamaño completo, retroiluminación RGB en 1 zona, de color gris ceniza con teclado numérico
Batería Polímero de ion-litio 4 celdas, 70 Wh
Conexiones
1 USB Type-A con velocidad de señal de 5 Gbps (HP Sleep and Charge);
1 USB Type-C® con velocidad de señal de 5 Gbps (suministro de energía a través de USB, DisplayPort™ 1.4, HP Sleep and Charge); 2 USB Type-A con velocidad de señal de 5 Gbps;
1 HDMI 2.1;
1 RJ-45;
1 pin inteligente de CA;
1 combo de auriculares/micrófono
Sistema operativo
SIN SISTEMA OPERATIVO
Dimensiones (Ancho x Profundidad x Altura) 36,9 x 25,94 x 2,29 (frontal) – 2,39 (posterior) cm;
Peso 2,33 kg;
Color Plata mica, logotipo cromado oscuro',1),
(5,'Apple iPhone 15 Plus 128GB Rosa Libre','Apple iPhone 15. La Dynamic Island a la cabeza de todo. Nueva cámara de 48 Mpx. Fotos de altísima resolución. Teleobjetivo x2. Diseño superduro con aluminio y vidrio tintado en masa. El USB C llega a puerto.', 990.95, 60,'Smartphone','2023-12-10',NULL, 0.20, 0.21,'https://img.pccomponentes.com/articles/1077/10777794/1158-apple-iphone-15-plus-128gb-rosa-libre.jpg', true,
'Acabado
Diseño de aluminio
Parte delantera con Ceramic Shield
Parte trasera de vidrio tintado en masa
Capacidad
128GB
Dimensiones y Peso
Ancho: 7,78 cm
Alto: 16,09 cm
Grosor: 0,78 cm
Peso: 201 g
Pantalla
Pantalla Super Retina XDR
Pantalla OLED de 6,7 pulgadas (17 cm) en diagonal
Resolución de 2.796 por 1.290 píxeles a 460 p/p
Dynamic Island
Pantalla HDR
True Tone
Gama cromática amplia (P3)
Respuesta háptica
Contraste de 2.000.000:1 (típico)
Brillo máximo de 1.000 nits (típico), pico de brillo de 1.600 nits (HDR) y pico de brillo de 2.000 nits (en exteriores)
Cubierta oleófuga antihuellas
Compatible con la presentación simultánea de múltiples idiomas y grupos de caracteres
Resistencia a las salpicaduras, el agua y el polvo3
Calificación IP68 según la norma IEC 60529 (hasta 6 metros de profundidad durante un máximo de 30 minutos)
Chip
Chip A16 Bionic CPU de 6 núcleos (2 de rendimiento y 4 de eficiencia) GPU de 5 núcleos / Neural Engine de 16 núcleos
Cámara
Principal de 48 Mpx: 26 mm, apertura de ƒ/1,6, estabili­zación óptica de imagen por desplazamiento del sensor, 100 % Focus Pixels y compati­bilidad con fotos de altísima resolución (24 y 48 Mpx)
Ultra gran angular de 12 Mpx: 13 mm, apertura de ƒ/2,4 y campo de visión de 120°
Teleobjetivo x2 de 12 Mpx (gracias al sensor Quad Pixel): 52 mm, apertura de ƒ/1,6, estabili­zación óptica de imagen por desplazamiento del sensor y 100 % Focus Pixels
Zoom óptico de acercamiento x2, zoom óptico de alejamiento x2 y rango de zoom óptico x4
Zoom digital hasta x10
Cubierta de la lente de cristal de zafiro
Flash True Tone
Photonic Engine
Deep Fusion
HDR Inteligente 5
Retratos de última generación con Control de Profundidad y Enfoque
Iluminación de Retratos con seis efectos
Modo Noche
Fotos panorámicas (hasta 63 Mpx)
Estilos Fotográficos
Gama cromática amplia para fotos y Live Photos
Corrección del objetivo (ultra gran angular)
Corrección avanzada de ojos rojos
Estabilización automática de imagen
Modo ráfaga
Geoetiquetado de fotos
Captura de imagen en formato HEIF y JPEG',2),
(6,'Nintendo Switch Edición Mario OLED Roja','Nintendo Switch (modelo OLED) incluye una pantalla de 7 pulgadas con un marco más fino. Los colores intensos y el alto contraste de la pantalla proporcionan una experiencia de juego portátil y de sobremesa enriquecedora, y aportan mucha vida a los juegos, tanto si compites a gran velocidad sobre el asfalto como si te ves las caras con enemigos temibles.',349.99, 50, 'Gaming','2024-01-08', null, 0.02, 0.21,'https://img.pccomponentes.com/articles/1077/10770738/1229-nintendo-switch-edicion-mario-oled-roja.jpg',FALSE,
'Desempeño
Plataforma: Nintendo Switch
Modelo del procesador: NVIDIA Custom Tegra
Acelerómetro: Si
Sensor de luz ambiental: Si
Giroscopio: Si
Diseño
Color del producto: Rojo
Tecnología de control para juegos: Analógico/Digital
Botones de función control para gaming: Botón de inicio, Botón de encendido
Joystick analógico: Si
Control de volumen: Botones
Exhibición
Diagonal de la pantalla: 17,8 cm (7")
Pantalla: OLED
Pantalla táctil: Si
Resolución de la pantalla: 1280 x 720 Pixeles
Tecnología táctil: Multi-touch
Tipo de pantalla táctil: Capacitiva
Medios de almacenaje
Capacidad de memoria interna: 64 GB
Tarjeta de lectura integrada: Si
Tarjetas de memoria compatibles: MicroSD (TransFlash), MicroSDHC, MicroSDXC
Tamaño máximo de tarjeta de memoria: 2000 GB
Conexión
Wifi: Si
Bluetooth: Si
Wi-Fi estándares: 802.11a,802.11b,802.11g,Wi-Fi 4 (802.11n),Wi-Fi 5 (802.11ac)
Versión de Bluetooth: 4.1
Puertos e Interfaces
HDMI: Si
Puerto USB: Si
Conector USB: USB Tipo C
Auriculares: 3,5 mm
Combo de salida de auriculares / micrófono del puerto: Si
Multimedia
Cámara incorporada: No
Número de altavoces incorporados: 2
Control de energía
Tecnología de batería: Ión de litio
Capacidad de batería: 4310 mAh
Autonomía: 9 h
Tiempo de carga: 3 h
Condiciones ambientales
Intervalo de temperatura operativa: 5 - 35 °C
Intervalo de humedad relativa para funcionamiento: 20 - 80%
Peso y dimensiones
Ancho: 242 mm
Profundidad: 13,9 mm
Altura: 102 mm
Peso: 320 g
Contenido del embalaje
Juego de video incluido: No
Cargador de baterias: Si
Manual de usuario: Si',3),
(7,'Gigabyte GeForce RTX 4060','Las GPU NVIDIA® GeForce RTX® serie 40 son más que rápidas para jugadores y creadores. Cuentan con la tecnología de la arquitectura ultra eficiente NVIDIA Ada Lovelace, que ofrece un salto espectacular tanto en rendimiento como en gráficos con tecnología de IA. Disfruta de mundos virtuales realistas con trazado de rayos y juegos con FPS ultra altos y la latencia más baja. Descubre nuevas y revolucionarias formas de crear contenido y una aceleración de flujo de trabajo sin precedentes',349.99,50,'Tarjeta Gráfica','2024-01-20',null,0.05,0.21,'https://img.pccomponentes.com/articles/1073/10739332/4378-gigabyte-geforce-rtx-4060-eagle-oc-8gb-gddr6-dlss3-especificaciones.jpg',true,
'Procesamiento de gráficos GeForce RTX™ 4060
Reloj de núcleo 2505 MHz (Reference card: 2460 MHz)
Núcleos CUDA® 3072
Reloj de la memoria 17 Gb/s
Tamaño de la memoria 8 GB
Tipo de memoria GDDR6
Bus de memoria 128 bits
Tarjeta de autobús PCI-E 4.0
Resolución máxima digital 7680x4320
Vista múltiple 4
Tamaño de la tarjeta L=272 W=115 H=40 mm
Forma de placa de circuito impreso ATX
DirectX 12 último
OpenGL 4.6
Fuente de alimentación recomendada 450W
Conectores de alimentación 8 pines * 1
Producción
DisplayPort 1.4a*2
HDMI2.1a*2
Accesorios Guía rápida',1),
(8,'Samsung TQ85QN800CTXXC 85" Neo QLED UltraHD 8K','Explora las posibilidades del 8K con Neo QLED 8K.  Observa hasta el último detalle. Verás cada detalle hasta en las escenas más oscuras con un control de iluminación más preciso gracias a miles de Mini LED, que mejoran el nivel de negro y el contraste.',3789.01,70,'TV','2024-02-14', null,0.03,0.21,'https://img.pccomponentes.com/articles/1073/10733916/1156-samsung-tq85qn800ctxxc-85-neo-qled-ultrahd-8k-quantum-hdr-8k-plus.jpg', true,'QLED
Serie 8
Pantalla Tamaño de pantalla 85"
Tasa de Refresco 100Hz
Resolución 7,680 x 4,320
Antirreflejos Sí
Vídeo
Motor de Imagen Neural Quantum Processor 8K
Mil millones de colores Sí
HDR Neo Quantum HDR 8K Plus
HDR 10+ Sí (ADAPTIVE/ GAMING)
AI Upscale Sí
HLG Sí
Contraste Quantum Matrix Technology Pro
Color 100% Colour Volume with Quantum Dot
Ángulo de visualización Ángulo Ultra Visión
Micro Dimming Ultimate 8K Dimming Pro
Contrast Enhancer Real Depth Enhancer Pro
Modo cine Sí
Motion Technology Motion Xcelerator Turbo+
Claridad de imagen Sí
Calibración Expert N/A
Calibración Smart Basic/Professional
Modo Director de Cine Sí
AI HDR Remastering Auto HDR Remastering
Audio
Dolby Atmos Sí
Amplificador Active Voice Sí
Sonido Adaptive Adaptive Sound Pro
Object Tracking Sound OTS+
Q-Symphony Sí
Descriptor de preselección de audio Sí
Salida de sonido (RMS) 70W
Tipo de altavoz 4.2.2CH
Woofer Sí
Multiroom Link Sí
Audio Bluetooth Sí
Compatible Dual Audio (Bluetooth) Sí
Buds Auto Switch Sí',2),
(9,'MSI Clutch GM50 Ratón Gaming 7200 DPI','El ratón Clutch GM50 Gaming está diseñado para el gaming con su forma sólida y funciones únicas. Con un preciso sensor óptico PMW-3330 podrás configurar la resolución desde los 400 ppi hasta los 7200 ppi.',55.95,90,'Ratones','2023-12-10', null,0.10,0.21,'https://img.pccomponentes.com/articles/18/183440/6.jpg',true,
'Sensor de juego óptico PMW-3330
Diseño ergonómico ligero
Elija entre millones de colores con Gaming Center
Ajusta la configuración detallada con Gaming Center
Conmutadores especiales OMRON clasificados por 20 millones de clics
Dispositivo de entrada
Interfaz del dispositivo : USB
Cantidad de botones : 6
Tecnología de detección de movimientos : Óptico
Resolución de movimiento : 7200 DPI
Funciones de los botones : Interruptor DPI
Ergonomía
Longitud de cable : 2 m
Requisitos del sistema
Sistema operativo Windows soportado : Si
Sistema operativo MAC soportado : Si
Peso y dimensiones
Ancho : 67 mm
Profundidad : 120 mm
Altura : 42 mm
Peso del ratón : 87 g',2),
(10,'AMD Ryzen 7 7800X3D 4.2 GHz/5 GHz','El procesador para juegos que domina el mundo de la mano de la tecnología AMD 3D V-Cache™, para ganar aún más rendimiento de juego. Sin importar la configuración ni la resolución que uses, lleva a tu equipo a la victoria con este maravilloso procesador para juegos. Disfruta, además, las ventajas de AMD 3D V-Cache™, la tecnología de punta que es sinónimo de latencia baja y mucho rendimiento de juego.',389.95, 70,'Procesador','2023-07-30',null,0.09,0.21,'https://img.pccomponentes.com/articles/1066/10665103/1575-amd-ryzen-7-7800x3d-42-ghz-5-ghz.jpg', true,'Procesador
Fabricante de procesador: AMD
Modelo del procesador: 7800X3D
Frecuencia base del procesador: 4,2 GHz
Familia de procesador: AMD Ryzen™ 7
Número de núcleos de procesador: 8
Socket de procesador: Zócalo AM5
Litografía del procesador: 5 nm
Número de hilos de ejecución: 16
Frecuencia del procesador turbo: 5 GHz
Caché del procesador: 96 MB
Tipo de cache en procesador: L3
Potencia de diseño térmico (TDP): 120 W
Caja: Si
Refrigerador incluido: No
Memoria
Tipos de memoria que admite el procesador: DDR5-SDRAM
Velocidad de reloj de memoria que admite el procesador: 3600,5200 MHz
Canales de memoria: Doble canal
Gráficos
Adaptador gráfico incorporado: Si
Adaptador de gráficos discreto: No
Modelo de adaptador gráfico incorporado: AMD Radeon Graphics
Frecuencia base de gráficos incorporada: 2200 MHz
Modelo de adaptador de gráficos discretos: No disponible
Características
Segmento de mercado: Escritorio
Versión de entradas de PCI Express: 5.0
Sistemas operativos compatibles: Windows 11/10 x64, RHEL x86 64-bit, Ubuntu x86 64-bit',1),
(11,'MSI PRO Z790-A MAX WIFI', 'PRO Z790-A MAX WIFI ofrece un diseño simple con una armoniosa combinación de colores plateados que combina perfectamente con las PC blancas y negras. Está diseñado con muchas características exclusivas de MSI, una conveniente solución Wi-Fi 7 y optimización DDR5 para procesadores Intel® Core™ de 14.ª y 13.ª generación.', 279.99, 50, 'Placa base','2024-02-10', null, 0.04, 0.21, 'https://img.pccomponentes.com/articles/1079/10798709/1130-msi-pro-z790-a-max-wifi.jpg', true, 'Procesador
Fabricante de procesador: Intel
Socket de procesador: LGA 1700
Procesador compatible: Intel® Celeron®, Intel® Pentium®, Intel® Pentium® Gold
Sockets de procesador soportados: LGA 1700
Memoria
tipos de memoria compatibles: DDR5-SDRAM
Número de ranuras de memoria: 4
Canales de memoria: Doble canal
No ECC: Si
Velocidades de reloj de memoria soportadas: 4800,5000,5200,5400,5600,5800,6000,6200,6400,6600,6800,7000 MHz
Velocidad del reloj de memoria máxima admitida: 7200 MHz
Memoria interna máxima: 128 GB
Memoria sin buffer: Si
Reguladores del almacenaje
Tipos de unidades de almacenamiento admitidas: HDD & SSD
Interfaces de disco de almacenamiento soportados: M.2, PCI Express
Número de unidades de almacenamiento compatibles: 10
Niveles RAID: 0, 1, 5, 10
Interno I/O
USB 2.0, conectores: 4
Conectores USB 3.2 Gen 1 (3.1 Gen 1): 2
Conectores USB 3.2 Gen 2 (3.1 Gen 2): 1
Número de conectores SATA III: 6
Conector de audio en panel frontal: Si
Conector de panel delantero: Si
Conector de ventilador CPU: Si
Conector de instrusión a chasis: Si
Conector TPM: Si
Conector para tiras LED RGB: Si',1),
(12,'WD BLACK SN770 1TB SSD PCIe Gen4 NVMe','Entra en acción al instante con el WD_BLACK™ SN770 NVMe™ SSD. Este disco se ha diseñado específicamente para jugar y cuenta con la interfaz PCIe® Gen4, que ofrece una velocidad impresionante de hasta 5150 MB/s (en los modelos de 1 TB y 2 TB).', 81.98, 60, 'SSD', '2024-01-15', null, 0.04, 0.21, 'https://img.pccomponentes.com/articles/1006/10060346/1242-wd-black-sn770-1tb-nvme-ssd.jpg',true, 'NTERFAZ: PCIe® Gen4 16GT/s, hasta 4 carriles
DIMENSIONES:
LONGITUD: 80 ± 0,15 mm
ANCHO: 22 ± 0,15 mm
ALTURA: 2,38 mm
PESO: 5,5g ± 0,5g
RESISTENCIA (TBW): 1TB: 600
ESPECIFICACIONES DE FUNCIONAMIENTO:
Temperatura de funcionamiento: 32ºF a 185ºF (0ºC a 85ºC)
Temperatura no operativa: -40ºF a 185ºF (-40ºC a 85ºC)
COMPATIBILIDAD DEL SISTEMA: Compatible con versiones anteriores de
PCIe® Gen3 x4, PCIe® Gen3 x2,
PCIe® Gen3 x1, PCIe® Gen2 x4,
PCIe® Gen2 x2 y PCIe® Gen2 x1
Windows® 8.1, 10
GARANTÍA LIMITADA: 5 años
RENDIMIENTO:
Lectura secuencial (hasta)3: 1 TB: 5150 MB/s
Escritura secuencial (hasta)3: 1 TB: 4900 MB/s
Lectura aleatoria: 1TB: 740K IOPS
Escritura aleatoria: 1TB: 800K IOPS',1),
(13,'Corsair Vengeance 6000MHz PC5-48000 32GB','La memoria CORSAIR VENGEANCE RGB DDR5 ofrece rendimiento DDR5, frecuencias más altas y mayores capacidades optimizadas para placas base Intel®, mientras ilumina su PC con iluminación RGB de diez zonas dinámica y direccionable individualmente. Los chips de memoria de alta frecuencia cuidadosamente seleccionados permiten un procesamiento, renderizado y almacenamiento en búfer más rápidos que nunca, con regulación de voltaje integrada para un overclocking fácil y finamente controlado.',128.99, 30,'RAM','2023-12-15',null,0.08,0.21,'https://img.pccomponentes.com/articles/1071/10711396/1323-corsair-vengeance-rgb-ddr5-6000mhz-pc5-48000-32gb-2x16gb-cl36-negro.jpg', true,'Densidad: 32 GB (2 x 16 GB)
Velocidad: DDR5 6000 MHz
Latencia probada: 36-44-44-96
Voltaje: 1,4 V
Formato: DIMM
LED: RGB
PMIC: Overclocking PMIC
Control de software: Corsair iCUE
Salida de pines: 288
Intel XMP 3.0
Disipador de calor: Aluminio
Compatibilidad: Intel Serie 600 y Serie 700
Dimensiones del módulo (L x An x Al): 138 x 7 x 45 mm
Peso: 0,048 kg
Dimensiones con embalaje: 131 x 11 x 162 mm
Peso embalado: 0,15 kg',1 );

-- id_product, product_name, description, price, stock_quantity, category, creation_date, update_date, discount, taxes, product_image, availability, technical_specifications, supplier_id_supplier

-- Insertar datos de ejemplo en la tabla Order
INSERT INTO purchase_order (id_order, order_date, order_status, payment_method, total_order_amount, customer_notes, estimated_delivery_date, shipping_date, purchase_id_customer)
VALUES
(1, '2023-02-01', 'Processing', 'Credit Card', 149.95, 'Special instructions for Order 1', '2023-02-10', '2023-02-05', 1),
(2, '2023-02-02', 'Shipped', 'PayPal', 79.98, 'Special instructions for Order 2', '2023-02-15', '2023-02-08', 2),
(3, '2023-02-03', 'Processing', 'Bank Transfer', 129.99, 'Special instructions for Order 3', '2023-02-12', '2023-02-06', 3),
(4, '2023-02-03', 'Processing', 'Bank Transfer', 129.99, 'Special instructions for Order 3', '2023-02-12', '2023-02-06', 1);

-- Insertar datos de ejemplo en la tabla DeliveryNote
INSERT INTO delivery_note (id_deliverynote, dispatch_date, shipping_details, receiver_signature, delivery_status, delivery_notes, Purchase_order_id_order)
VALUES
(1, '2023-02-05', 'Shipped via Express Shipping', 'John Doe', 'Delivered', 'Delivery notes for Order 1', 1),
(2, '2023-02-08', 'Shipped via Standard Shipping', 'Jane Smith', 'In Transit', 'Delivery notes for Order 2', 2),
(3, '2023-02-10', 'Shipped via Priority Shipping', 'Alice Johnson', 'In Transit', 'Delivery notes for Order 3', 3);


-- Insertar datos de ejemplo en la tabla Invoice
INSERT INTO invoice (id_invoice, invoice_date, due_date, shipping_details, subtotal, taxes, discounts, total_invoice_amount, payment_status, invoice_notes, purchase_order_id_order)
VALUES
(1, '2023-02-05', '2023-02-15', 'Shipped via Express Shipping', '149.95', '15.00', '7.50', '157.45', 'Paid', 'Invoice notes for Order 1', 1),
(2, '2023-02-08', '2023-02-18', 'Shipped via Standard Shipping', '79.98', '8.00', '4.00', '83.98', 'Pending', 'Invoice notes for Order 2', 2),
(3, '2023-02-10', '2023-02-20', 'Shipped via Priority Shipping', '129.99', '13.00', '6.50', '136.49', 'Pending', 'Invoice notes for Order 3', 3);

-- Insertar datos de ejemplo en la tabla Product_has_Order
INSERT INTO product_has_order (id_product_has_order,product_id_product, purchase_order_id_order)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 3, 3);



SELECT * FROM purchase_order;
SELECT * FROM customer;
SELECT * FROM supplier;
SELECT * FROM product;