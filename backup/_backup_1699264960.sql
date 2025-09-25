

CREATE TABLE `branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(15) NOT NULL,
  `division_address` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO branch VALUES("1","8","E-Engineering","","");
INSERT INTO branch VALUES("2","0","PEAM","","");
INSERT INTO branch VALUES("3","11","Maxon Power","","");
INSERT INTO branch VALUES("4","11","Generator Sales","","");
INSERT INTO branch VALUES("5","7","Corporate","","");
INSERT INTO branch VALUES("6","7","Battery","","");
INSERT INTO branch VALUES("7","10","Renewable Energy","","");
INSERT INTO branch VALUES("8","11","Sub Station","","");
INSERT INTO branch VALUES("9","8","Equipment","","");
INSERT INTO branch VALUES("10","11","Spare Parts","","");
INSERT INTO branch VALUES("11","0","Service And Energy Business","","");
INSERT INTO branch VALUES("12","0","SPOT","","");
INSERT INTO branch VALUES("13","0","CTED-Dhaka","","");
INSERT INTO branch VALUES("14","0","CTED-CTG","","");
INSERT INTO branch VALUES("16","19","88 Innovations Engineering Ltd","88i","Khawaja Tower, 7th Floor,95\r\nBir Uttam A. K. Khandokar Road,Mohakhali C/A, Dhaka - 1212");



CREATE TABLE `buildings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` varchar(100) NOT NULL,
  `building_type` varchar(100) NOT NULL,
  `package_id` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `chart_data_column` (
  `month` varchar(10) NOT NULL,
  `sale` int(3) NOT NULL,
  `profit` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `company_address` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO companies VALUES("7","Saif Powertec Ltd.","95, Mohakhali");
INSERT INTO companies VALUES("8","E-Engineering Ltd.","");
INSERT INTO companies VALUES("9","Saif Port Holdings Ltd.","");
INSERT INTO companies VALUES("10","Saif Electrical Manufacturing Ltd.","");
INSERT INTO companies VALUES("11","Maxon Power Ltd.","");
INSERT INTO companies VALUES("12","Saif Plastic & Polymer Industries Ltd.","");
INSERT INTO companies VALUES("14","Blueline Communications Ltd.","");
INSERT INTO companies VALUES("15","Saif Sporting Club Ltd.","");
INSERT INTO companies VALUES("16","Grihayan Ltd.","");
INSERT INTO companies VALUES("19","88 Innovations Engineering Ltd","Khawaja Tower, 7th Floor,95\r\nBir Uttam A. K. Khandokar Road,Mohakhali C/A, Dhaka - 1212");



CREATE TABLE `complain_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complain_type` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `branch_name` varchar(350) NOT NULL COMMENT 'temprary purpose',
  `name` varchar(650) NOT NULL,
  `short_name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO department VALUES("1","8","1","E-Engineering","Management","MAN");
INSERT INTO department VALUES("2","8","1","E-Engineering","Market Development","");
INSERT INTO department VALUES("3","0","1","E-Engineering","Finance And Accounts","");
INSERT INTO department VALUES("4","0","1","E-Engineering","Administration","");
INSERT INTO department VALUES("5","0","1","E-Engineering","Dredging","");
INSERT INTO department VALUES("6","0","1","E-Engineering","Engineering","");
INSERT INTO department VALUES("7","0","1","E-Engineering","Project ENG","");
INSERT INTO department VALUES("8","0","1","E-Engineering","Operation","");
INSERT INTO department VALUES("9","0","1","E-Engineering","Maintenance","");
INSERT INTO department VALUES("10","0","1","E-Engineering","QMS","");
INSERT INTO department VALUES("11","0","1","E-Engineering","Mechanical","");
INSERT INTO department VALUES("12","0","1","E-Engineering","Civil","");
INSERT INTO department VALUES("13","0","1","E-Engineering","Commercial","");
INSERT INTO department VALUES("14","0","1","E-Engineering","Store","");
INSERT INTO department VALUES("15","0","2","PEAM","Engineering","");
INSERT INTO department VALUES("16","0","2","PEAM","Civil","");
INSERT INTO department VALUES("17","0","3","Maxon Power","Management","");
INSERT INTO department VALUES("18","0","3","Maxon Power","Administration","");
INSERT INTO department VALUES("19","0","3","Maxon Power","Project","");
INSERT INTO department VALUES("20","0","3","Maxon Power","Finance And Accounts","");
INSERT INTO department VALUES("21","0","4","Generator Sales","Sales And Marketing","");
INSERT INTO department VALUES("22","0","4","Generator Sales","Service","");
INSERT INTO department VALUES("23","0","4","Generator Sales","Project","");
INSERT INTO department VALUES("24","0","4","Generator Sales","Administration","");
INSERT INTO department VALUES("25","0","4","Generator Sales","Finance And Accounts","");
INSERT INTO department VALUES("26","0","5","Corporate","Management","");
INSERT INTO department VALUES("27","0","5","Corporate","Finance And Accounts","");
INSERT INTO department VALUES("28","0","5","Corporate","QMS","");
INSERT INTO department VALUES("29","0","5","Corporate","Human Resource Management","");
INSERT INTO department VALUES("30","0","5","Corporate","Purchase And Procurement","");
INSERT INTO department VALUES("31","0","5","Corporate","Legal","");
INSERT INTO department VALUES("32","0","5","Corporate","Administration","");
INSERT INTO department VALUES("33","0","5","Corporate","IT","");
INSERT INTO department VALUES("34","0","5","Corporate","Commercial","");
INSERT INTO department VALUES("35","0","5","Corporate","Project","");
INSERT INTO department VALUES("36","0","5","Corporate","Business Development","");
INSERT INTO department VALUES("37","0","5","Corporate","Brand Communication","");
INSERT INTO department VALUES("38","0","5","Corporate","Share Market","");
INSERT INTO department VALUES("39","0","5","Corporate","Enterprise Resource Planning","");
INSERT INTO department VALUES("40","0","5","Corporate","Operation","");
INSERT INTO department VALUES("41","0","5","Corporate","Service And WSS","");
INSERT INTO department VALUES("42","0","6","Battery","Management","");
INSERT INTO department VALUES("43","0","6","Battery","Commercial","");
INSERT INTO department VALUES("44","0","6","Battery","Project Development And Implemantaion","");
INSERT INTO department VALUES("45","0","6","Battery","RAndD","");
INSERT INTO department VALUES("46","0","6","Battery","Factory Operation","");
INSERT INTO department VALUES("47","0","6","Battery","Administration","");
INSERT INTO department VALUES("48","0","6","Battery","Finance And Accounts","");
INSERT INTO department VALUES("49","0","6","Battery","Plate Preparation","");
INSERT INTO department VALUES("50","0","6","Battery","Charging","");
INSERT INTO department VALUES("51","0","6","Battery","Quality Assurance","");
INSERT INTO department VALUES("52","0","6","Battery","Maintenance","");
INSERT INTO department VALUES("53","0","6","Battery","Warehouse And Logistics","");
INSERT INTO department VALUES("54","0","6","Battery","Assembly","");
INSERT INTO department VALUES("55","0","6","Battery","CMP","");
INSERT INTO department VALUES("56","0","6","Battery","Service And WSS","");
INSERT INTO department VALUES("57","0","6","Battery","QMS","");
INSERT INTO department VALUES("58","0","6","Battery","Sales And Marketing","");
INSERT INTO department VALUES("59","0","6","Battery","IT","");
INSERT INTO department VALUES("60","0","6","Battery","Marketing And Sales- Export And Corporate","");
INSERT INTO department VALUES("61","0","6","Battery","MC","");
INSERT INTO department VALUES("62","0","6","Battery","Sales Operation","");
INSERT INTO department VALUES("63","0","6","Battery","Planning And Coordination","");
INSERT INTO department VALUES("64","0","6","Battery","Store","");
INSERT INTO department VALUES("65","0","6","Battery","Gel And VRLA","");
INSERT INTO department VALUES("66","0","6","Battery","Purchase And Procurement","");
INSERT INTO department VALUES("67","0","7","Renewable Energy","Management","");
INSERT INTO department VALUES("68","0","7","Renewable Energy","Operation","");
INSERT INTO department VALUES("69","0","7","Renewable Energy","Finance And Accounts","");
INSERT INTO department VALUES("70","0","7","Renewable Energy","Administration","");
INSERT INTO department VALUES("71","0","7","Renewable Energy","Service And Maintanance","");
INSERT INTO department VALUES("72","0","7","Renewable Energy","Sales And Marketing","");
INSERT INTO department VALUES("73","0","7","Renewable Energy","Store","");
INSERT INTO department VALUES("74","0","8","Sub Station","Project","");
INSERT INTO department VALUES("75","0","8","Sub Station","Switch Gear","");
INSERT INTO department VALUES("76","0","8","Sub Station","Operation","");
INSERT INTO department VALUES("77","0","8","Sub Station","Administration","");
INSERT INTO department VALUES("78","0","9","Equipment","Sales And Marketing","");
INSERT INTO department VALUES("79","0","10","Spare Parts","Service","");
INSERT INTO department VALUES("80","0","11","Service And Energy Business","Finance And Accounts","");
INSERT INTO department VALUES("81","0","11","Service And Energy Business","Service","");
INSERT INTO department VALUES("82","0","11","Service And Energy Business","Operation","");
INSERT INTO department VALUES("83","0","11","Service And Energy Business","Sales And Marketing","");
INSERT INTO department VALUES("84","0","11","Service And Energy Business","Administration","");
INSERT INTO department VALUES("85","0","11","Service And Energy Business","Pre Sales","");
INSERT INTO department VALUES("86","0","11","Service And Energy Business","Maintenance","");
INSERT INTO department VALUES("87","0","11","Service And Energy Business","Group Customer Care","");
INSERT INTO department VALUES("88","0","11","Service And Energy Business","Marine","");
INSERT INTO department VALUES("89","0","12","SPOT","Documentation","");
INSERT INTO department VALUES("90","0","12","SPOT","Billing","");
INSERT INTO department VALUES("91","0","12","SPOT","Operation","");
INSERT INTO department VALUES("92","0","12","SPOT","Administration","");
INSERT INTO department VALUES("93","0","12","SPOT","Store","");
INSERT INTO department VALUES("94","0","12","SPOT","Finance And Accounts","");
INSERT INTO department VALUES("95","0","12","SPOT","Purchase And Procurement","");
INSERT INTO department VALUES("96","0","12","SPOT","CTMS","");
INSERT INTO department VALUES("97","0","12","SPOT","SC","");
INSERT INTO department VALUES("98","0","12","SPOT","Ship Planning","");
INSERT INTO department VALUES("99","0","12","SPOT","Terminal Operation","");
INSERT INTO department VALUES("100","0","12","SPOT","RMG","");
INSERT INTO department VALUES("101","0","12","SPOT","RTG","");
INSERT INTO department VALUES("102","0","12","SPOT","Winch","");
INSERT INTO department VALUES("103","0","12","SPOT","CCT Yard","");
INSERT INTO department VALUES("104","0","12","SPOT","Strategic Planning And Terminal Operation","");
INSERT INTO department VALUES("105","0","12","SPOT","NCT Yard","");
INSERT INTO department VALUES("106","0","12","SPOT","CFS","");
INSERT INTO department VALUES("107","0","12","SPOT","FLT","");
INSERT INTO department VALUES("108","0","12","SPOT","Yard Planning And Documentation","");
INSERT INTO department VALUES("109","0","12","SPOT","CCT Lasher","");
INSERT INTO department VALUES("110","0","12","SPOT","ITV","");
INSERT INTO department VALUES("111","0","12","SPOT","QGC","");
INSERT INTO department VALUES("112","0","12","SPOT","Quay Yard Supervisor","");
INSERT INTO department VALUES("113","0","12","SPOT","Delivery","");
INSERT INTO department VALUES("114","0","12","SPOT","NCT Lasher","");
INSERT INTO department VALUES("115","0","13","CTED-Dhaka","Operation","");
INSERT INTO department VALUES("116","0","13","CTED-Dhaka","Service","");
INSERT INTO department VALUES("117","0","13","CTED-Dhaka","Maintenance","");
INSERT INTO department VALUES("118","0","13","CTED-Dhaka","Administration","");
INSERT INTO department VALUES("119","0","14","CTED-CTG","Maintenance","");
INSERT INTO department VALUES("120","0","14","CTED-CTG","QGC and RTG","");
INSERT INTO department VALUES("121","0","14","CTED-CTG","PM and FLT","");
INSERT INTO department VALUES("122","0","14","CTED-CTG","Purchase And Procurement","");
INSERT INTO department VALUES("123","0","14","CTED-CTG","Store","");
INSERT INTO department VALUES("124","0","14","CTED-CTG","Administration","");
INSERT INTO department VALUES("125","0","14","CTED-CTG","QGC Maintanence","");
INSERT INTO department VALUES("129","19","16","","Hardware","HARD");
INSERT INTO department VALUES("130","19","16","","Software","");
INSERT INTO department VALUES("131","19","16","","Management","");



CREATE TABLE `designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(650) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO designations VALUES("1","Executive");
INSERT INTO designations VALUES("2","Manager");
INSERT INTO designations VALUES("3","Senior Brand Promoter");
INSERT INTO designations VALUES("4","Video Editor");
INSERT INTO designations VALUES("5","Photographer");
INSERT INTO designations VALUES("6","Brand Promoter");
INSERT INTO designations VALUES("7","Graphic Designer");
INSERT INTO designations VALUES("8","Assistant Manager");
INSERT INTO designations VALUES("9","Driver");
INSERT INTO designations VALUES("10","Office Assistant");
INSERT INTO designations VALUES("11","3D Modeler");
INSERT INTO designations VALUES("12","Senior Online Video Editor");
INSERT INTO designations VALUES("13","Senior Graphic Designer");
INSERT INTO designations VALUES("14","Officer");
INSERT INTO designations VALUES("15","Chief Executive Officer");
INSERT INTO designations VALUES("16","Deputy General Manager");
INSERT INTO designations VALUES("17","Senior Officer");
INSERT INTO designations VALUES("18","Project Manager");
INSERT INTO designations VALUES("19","Dredging Master");
INSERT INTO designations VALUES("20","Project Co-Ordinator");
INSERT INTO designations VALUES("21","General Manager");
INSERT INTO designations VALUES("22","Electrician");
INSERT INTO designations VALUES("23","Assistant Engine Driver");
INSERT INTO designations VALUES("24","Engine Driver");
INSERT INTO designations VALUES("25","Work Boat Master");
INSERT INTO designations VALUES("26","Crew");
INSERT INTO designations VALUES("27","Lever Man");
INSERT INTO designations VALUES("28","Head Cook");
INSERT INTO designations VALUES("29","Director");
INSERT INTO designations VALUES("30","Assistant General Manager");
INSERT INTO designations VALUES("31","Supervisor");
INSERT INTO designations VALUES("32","Senior Technician");
INSERT INTO designations VALUES("33","Peon");
INSERT INTO designations VALUES("34","Assistant Cook");
INSERT INTO designations VALUES("35","Assistant");
INSERT INTO designations VALUES("36","Engineer");
INSERT INTO designations VALUES("37","Surveyor");
INSERT INTO designations VALUES("38","Operator");
INSERT INTO designations VALUES("39","Site Engineer");
INSERT INTO designations VALUES("40","Site Supervisor");
INSERT INTO designations VALUES("41","Ship Supervisor");
INSERT INTO designations VALUES("42","Deputy Manager");
INSERT INTO designations VALUES("43","Mechanic");
INSERT INTO designations VALUES("44","Assistant Site Supervisor");
INSERT INTO designations VALUES("45","Technician");
INSERT INTO designations VALUES("46","Pipe Fitter");
INSERT INTO designations VALUES("47","Sukani");
INSERT INTO designations VALUES("48","WINCH Operator");
INSERT INTO designations VALUES("49","Excavator Operator");
INSERT INTO designations VALUES("50","Senior Electrician");
INSERT INTO designations VALUES("51","Loskor");
INSERT INTO designations VALUES("52","Welder");
INSERT INTO designations VALUES("53","Storeman");
INSERT INTO designations VALUES("54","Assistant Engine Mechanic");
INSERT INTO designations VALUES("55","Chief Operating Officer");
INSERT INTO designations VALUES("56","Assistant Site Engineer");
INSERT INTO designations VALUES("57","Lab Techinacian");
INSERT INTO designations VALUES("58","Assistant Hydraulic Mechanic");
INSERT INTO designations VALUES("59","Assistant Supervisor");
INSERT INTO designations VALUES("60","Assistant Engineer");
INSERT INTO designations VALUES("61","Site Assistant");
INSERT INTO designations VALUES("62","Admin Assistant");
INSERT INTO designations VALUES("63","Bulldozer Operator");
INSERT INTO designations VALUES("64","Work Boat Engine Driver");
INSERT INTO designations VALUES("65","Batching Plant Operator");
INSERT INTO designations VALUES("66","Project Engineer");
INSERT INTO designations VALUES("67","Deputy Project Manager");
INSERT INTO designations VALUES("68","Wheel Loader Operator");
INSERT INTO designations VALUES("69","Cook Helper");
INSERT INTO designations VALUES("70","Dump Truck Driver");
INSERT INTO designations VALUES("71","Mixer Truck Driver");
INSERT INTO designations VALUES("72","Prime Mover Driver");
INSERT INTO designations VALUES("73","Harbour Crane Operator");
INSERT INTO designations VALUES("74","Helper");
INSERT INTO designations VALUES("75","Batching Plant Helper");
INSERT INTO designations VALUES("76","Crane Operator");
INSERT INTO designations VALUES("77","Dozzer Operator");
INSERT INTO designations VALUES("78","Concrete Pump Operator");
INSERT INTO designations VALUES("79","Assistant Rigger");
INSERT INTO designations VALUES("80","Transit Mixer Helper");
INSERT INTO designations VALUES("81","Block Machine Operator");
INSERT INTO designations VALUES("82","Fork Lift Operator");
INSERT INTO designations VALUES("83","Plant Engineer");
INSERT INTO designations VALUES("84","Diesel Hammer Operator");
INSERT INTO designations VALUES("85","Concrete Pump Pipe Fitter");
INSERT INTO designations VALUES("86","Long Boom Excavator Operator");
INSERT INTO designations VALUES("87","Mixture Truck Helper");
INSERT INTO designations VALUES("88","Low Bed Helper");
INSERT INTO designations VALUES("89","Mechanical Helper");
INSERT INTO designations VALUES("90","Low Bed Operator");
INSERT INTO designations VALUES("91","Junior Fitter");
INSERT INTO designations VALUES("92","Site Mechanical Engineer");
INSERT INTO designations VALUES("93","Quantity Surveyor Engineer");
INSERT INTO designations VALUES("94","Roller Operator");
INSERT INTO designations VALUES("95","Backhoe Operator");
INSERT INTO designations VALUES("96","Tractor Driver");
INSERT INTO designations VALUES("97","Store Keeper");
INSERT INTO designations VALUES("98","Assistant Lab Technician");
INSERT INTO designations VALUES("99","Senior Project Manager");
INSERT INTO designations VALUES("100","Trainee Officer");
INSERT INTO designations VALUES("101","Rigger");
INSERT INTO designations VALUES("102","Plant Operator");
INSERT INTO designations VALUES("103","Junior Officer");
INSERT INTO designations VALUES("104","Independent Director");
INSERT INTO designations VALUES("105","Head of Project");
INSERT INTO designations VALUES("106","Senior Manager");
INSERT INTO designations VALUES("107","Foreman");
INSERT INTO designations VALUES("108","Logistic Support Officer");
INSERT INTO designations VALUES("109","Executive Director");
INSERT INTO designations VALUES("110","Service Technician");
INSERT INTO designations VALUES("111","Junior Technician");
INSERT INTO designations VALUES("112","Managing Director");
INSERT INTO designations VALUES("113","Chairman");
INSERT INTO designations VALUES("114","Additional Managing Director");
INSERT INTO designations VALUES("115","Chief Finance Officer");
INSERT INTO designations VALUES("116","Head of QMS");
INSERT INTO designations VALUES("117","Company Secretary");
INSERT INTO designations VALUES("118","Accounts Assistant");
INSERT INTO designations VALUES("119","Customer Care");
INSERT INTO designations VALUES("120","Body Guard");
INSERT INTO designations VALUES("121","Assistant Security Supervisor");
INSERT INTO designations VALUES("122","Security Guard");
INSERT INTO designations VALUES("123","Security Inspector");
INSERT INTO designations VALUES("124","Front Desk Officer");
INSERT INTO designations VALUES("125","Head of IT");
INSERT INTO designations VALUES("126","Canteen Boy");
INSERT INTO designations VALUES("127","Liason Officer");
INSERT INTO designations VALUES("128","Incharge Billing And Doc.");
INSERT INTO designations VALUES("129","Protocol Officer");
INSERT INTO designations VALUES("130","Junior Engineer");
INSERT INTO designations VALUES("131","Yard Checker");
INSERT INTO designations VALUES("132","Sales ADM And Application Engg.");
INSERT INTO designations VALUES("133","Head Technician");
INSERT INTO designations VALUES("134","Head of Finance And Accounts");
INSERT INTO designations VALUES("135","Terminal Superintendent");
INSERT INTO designations VALUES("136","Area Manager");
INSERT INTO designations VALUES("137","Share Officer");
INSERT INTO designations VALUES("138","Store Officer");
INSERT INTO designations VALUES("139","Security Supervisor");
INSERT INTO designations VALUES("140","Security Officer");
INSERT INTO designations VALUES("141","Painter");
INSERT INTO designations VALUES("142","RST Operator");
INSERT INTO designations VALUES("143","Assistant Yard Supervisor");
INSERT INTO designations VALUES("144","Trailer Operator");
INSERT INTO designations VALUES("145","Trainee Technician");
INSERT INTO designations VALUES("146","Welder Project");
INSERT INTO designations VALUES("147","Tyre Feeder");
INSERT INTO designations VALUES("148","Trainee Engineer");
INSERT INTO designations VALUES("149","Cleaner");
INSERT INTO designations VALUES("150","Caretaker");
INSERT INTO designations VALUES("151","Assistant Protocol Officer");
INSERT INTO designations VALUES("152","In-Charge");
INSERT INTO designations VALUES("153","Technical Helper");
INSERT INTO designations VALUES("154","Loader");
INSERT INTO designations VALUES("155","Advisor");
INSERT INTO designations VALUES("156","Consultant");
INSERT INTO designations VALUES("157","Estate Officer");
INSERT INTO designations VALUES("158","Assistant Officer");
INSERT INTO designations VALUES("159","Trainee Yard Checker");
INSERT INTO designations VALUES("160","Door Closer");
INSERT INTO designations VALUES("161","Yard Supervisor");
INSERT INTO designations VALUES("162","Lasher");
INSERT INTO designations VALUES("163","Additional Chief Engineer");
INSERT INTO designations VALUES("164","Senior Engineer");
INSERT INTO designations VALUES("165","Senior Mechanic");
INSERT INTO designations VALUES("166","Vulcanizer");
INSERT INTO designations VALUES("167","Semi Mechanic");
INSERT INTO designations VALUES("168","Lathe Man");
INSERT INTO designations VALUES("169","Head of CTMS");
INSERT INTO designations VALUES("170","Service Engineer");
INSERT INTO designations VALUES("171","SC Operator");
INSERT INTO designations VALUES("172","Senior Equipment Controller");
INSERT INTO designations VALUES("173","Co-Ordinator");
INSERT INTO designations VALUES("174","Assistant Equipment Co-Ordinator");
INSERT INTO designations VALUES("175","Documentation Staff Trainee");
INSERT INTO designations VALUES("176","Regional Manager");
INSERT INTO designations VALUES("177","Terminal Manager");
INSERT INTO designations VALUES("178","CFS Shed Incharge");
INSERT INTO designations VALUES("179","Photo copier");
INSERT INTO designations VALUES("180","Office Boy");
INSERT INTO designations VALUES("181","RTG SC Controller");
INSERT INTO designations VALUES("182","Assistant Welfare Officer");
INSERT INTO designations VALUES("183","Radio And HHT Keeper");
INSERT INTO designations VALUES("184","Documentation Staff");
INSERT INTO designations VALUES("185","RTG Checker");
INSERT INTO designations VALUES("186","Keep Down Checker");
INSERT INTO designations VALUES("187","Handover Clerk");
INSERT INTO designations VALUES("188","Tally Clerk");
INSERT INTO designations VALUES("189","ICD Checker");
INSERT INTO designations VALUES("190","Carpenter");
INSERT INTO designations VALUES("191","Jetty Sareng");
INSERT INTO designations VALUES("192","Mark Man");
INSERT INTO designations VALUES("193","Assistant Ship Planner");
INSERT INTO designations VALUES("194","Senior Assistant Ship Supervisor");
INSERT INTO designations VALUES("195","Tracer");
INSERT INTO designations VALUES("196","Assistant Ship Supervisor");
INSERT INTO designations VALUES("197","Deck And Crane Checker");
INSERT INTO designations VALUES("198","Checker");
INSERT INTO designations VALUES("199","Empty Area Checker");
INSERT INTO designations VALUES("200","RTG Operator");
INSERT INTO designations VALUES("201","Trainee Tracer");
INSERT INTO designations VALUES("202","FLT Operator");
INSERT INTO designations VALUES("203","Lasher Foreman");
INSERT INTO designations VALUES("204","ITV Operator");
INSERT INTO designations VALUES("205","ITV Supervisor");
INSERT INTO designations VALUES("206","QGC Operator");
INSERT INTO designations VALUES("207","Ship And Yard Planner");
INSERT INTO designations VALUES("208","Import And Export Permission Clerk");
INSERT INTO designations VALUES("209","Senior Yard Supervisor");
INSERT INTO designations VALUES("210","Assistant Yard Superintendent");
INSERT INTO designations VALUES("211","Senior Keep Down Checker");
INSERT INTO designations VALUES("212","Trainee RTG Operator");
INSERT INTO designations VALUES("213","Escort Officer");
INSERT INTO designations VALUES("214","Supervisor In-Charge");
INSERT INTO designations VALUES("215","Medical Assistant");
INSERT INTO designations VALUES("216","Labour In-Charge");
INSERT INTO designations VALUES("217","Delivery Supervisor");
INSERT INTO designations VALUES("218","Billing Assistant");
INSERT INTO designations VALUES("219","Labour Supervisor");
INSERT INTO designations VALUES("220","Assistant Terminal Suprintendent");
INSERT INTO designations VALUES("221","Assistant Billing Coordinator");
INSERT INTO designations VALUES("222","Application Engineer");
INSERT INTO designations VALUES("223","Marine Leader");
INSERT INTO designations VALUES("224","IT Assistant");
INSERT INTO designations VALUES("225","Head of Product and Service");
INSERT INTO designations VALUES("226","Web Designer");
INSERT INTO designations VALUES("227","Delivery Checker");
INSERT INTO designations VALUES("228","Chief Marketing Officer");
INSERT INTO designations VALUES("229","Assistant Mechanic");
INSERT INTO designations VALUES("230","Assistant Carpenter");
INSERT INTO designations VALUES("231","Operation Engineer");
INSERT INTO designations VALUES("232","Assistant Foreman");
INSERT INTO designations VALUES("233","Factory Manager");
INSERT INTO designations VALUES("234","Assistant Operator");
INSERT INTO designations VALUES("235","Store Assistant");
INSERT INTO designations VALUES("236","Junior Operator");
INSERT INTO designations VALUES("237","Quality Control Inspector");



CREATE TABLE `equipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_id` varchar(10) NOT NULL,
  `equipment_no` varchar(25) NOT NULL,
  `type_id` varchar(15) NOT NULL,
  `project_id` varchar(15) NOT NULL,
  `created_at` date NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO equipments VALUES("2","CTED-001","QGC-01","46","1","0000-00-00","");
INSERT INTO equipments VALUES("3","CTED-002","QGC-02","46","1","0000-00-00","");
INSERT INTO equipments VALUES("4","CTED-003","QGC-03","46","1","0000-00-00","");
INSERT INTO equipments VALUES("5","CTED-004","QGC-04","46","1","0000-00-00","");
INSERT INTO equipments VALUES("6","CTED-005","QGC-05","46","1","0000-00-00","");
INSERT INTO equipments VALUES("7","CTED-006","QGC-06","46","1","0000-00-00","");
INSERT INTO equipments VALUES("8","CTED-007","QGC-07","46","1","0000-00-00","");
INSERT INTO equipments VALUES("9","CTED-008","QGC-08","46","1","0000-00-00","");
INSERT INTO equipments VALUES("10","CTED-009","QGC-09","46","1","0000-00-00","");
INSERT INTO equipments VALUES("11","CTED-010","QGC-10","46","1","0000-00-00","");
INSERT INTO equipments VALUES("12","CTED-011","QGC-11","46","1","0000-00-00","");
INSERT INTO equipments VALUES("13","CTED-012","QGC-12","46","1","0000-00-00","");
INSERT INTO equipments VALUES("14","CTED-013","QGC-13","46","1","0000-00-00","");
INSERT INTO equipments VALUES("15","CTED-014","QGC-14","46","1","0000-00-00","");
INSERT INTO equipments VALUES("16","CTED-015","RTG-07","47","1","0000-00-00","");
INSERT INTO equipments VALUES("17","CTED-016","RTG-08","47","1","0000-00-00","");
INSERT INTO equipments VALUES("19","CTED-018","RTG-09","47","1","0000-00-00","");
INSERT INTO equipments VALUES("20","CTED-019","RTG-10","47","1","0000-00-00","");
INSERT INTO equipments VALUES("21","CTED-020","RTG-11","47","1","0000-00-00","");
INSERT INTO equipments VALUES("22","CTED-021","RTG-12","47","1","0000-00-00","");
INSERT INTO equipments VALUES("23","CTED-022","RTG-13","47","1","0000-00-00","");
INSERT INTO equipments VALUES("24","CTED-023","RTG-14","47","1","0000-00-00","");
INSERT INTO equipments VALUES("25","CTED-024","RTG-15","47","1","0000-00-00","");
INSERT INTO equipments VALUES("27","CTED-026","RTG-16","47","1","0000-00-00","");
INSERT INTO equipments VALUES("28","CTED-027","RTG-17","47","1","0000-00-00","");
INSERT INTO equipments VALUES("29","CTED-028","RTG-18","47","1","0000-00-00","");
INSERT INTO equipments VALUES("30","CTED-029","RTG-19","47","1","0000-00-00","");
INSERT INTO equipments VALUES("31","CTED-030","RTG-20","47","1","0000-00-00","");
INSERT INTO equipments VALUES("32","CTED-031","RTG-21","47","1","0000-00-00","");
INSERT INTO equipments VALUES("33","CTED-032","RTG-22","47","1","0000-00-00","");
INSERT INTO equipments VALUES("34","CTED-033","RTG-23","47","1","0000-00-00","");
INSERT INTO equipments VALUES("36","CTED-035","RTG-24","47","1","0000-00-00","");
INSERT INTO equipments VALUES("37","CTED-036","RTG-25","47","1","0000-00-00","");
INSERT INTO equipments VALUES("38","CTED-037","RTG-26","47","1","0000-00-00","");
INSERT INTO equipments VALUES("39","CTED-038","RTG-27","47","1","0000-00-00","");
INSERT INTO equipments VALUES("40","CTED-039","RTG-28","47","1","0000-00-00","");
INSERT INTO equipments VALUES("41","CTED-040","RTG-31","47","1","0000-00-00","");
INSERT INTO equipments VALUES("42","CTED-041","RTG-32","47","1","0000-00-00","");
INSERT INTO equipments VALUES("43","CTED-042","RTG-33","47","1","0000-00-00","");
INSERT INTO equipments VALUES("44","CTED-043","RTG-34","47","1","0000-00-00","");
INSERT INTO equipments VALUES("45","CTED-044","RTG-35","47","1","0000-00-00","");
INSERT INTO equipments VALUES("46","CTED-045","RTG-36","47","1","0000-00-00","");
INSERT INTO equipments VALUES("47","CTED-046","RTG-37","47","1","0000-00-00","");
INSERT INTO equipments VALUES("48","CTED-047","RTG-38","47","1","0000-00-00","");
INSERT INTO equipments VALUES("49","CTED-048","SP-08","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("50","CTED-049","SP-09","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("51","CTED-050","SP-10","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("52","CTED-051","SP-11","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("53","CTED-052","SP-12","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("54","CTED-053","SP-13","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("55","CTED-054","SP-14","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("56","CTED-055","SP-15","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("57","CTED-056","SP-16","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("58","CTED-057","SP-17","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("59","CTED-058","SP-19","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("60","CTED-059","SP-22","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("61","CTED-060","SP-23","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("62","CTED-061","SP-24","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("63","CTED-062","SP-25","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("64","CTED-063","SP-26","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("65","CTED-064","SP-27","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("66","CTED-065","SP-28","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("67","CTED-066","SP-30","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("68","CTED-067","SP-31","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("69","CTED-068","SP-32","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("70","CTED-069","SP-33","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("71","CTED-070","SP-35","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("72","CTED-071","SP-36","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("73","CTED-072","SP-37","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("74","CTED-073","SP-39","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("75","CTED-074","SP-40","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("76","CTED-075","SP-41","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("77","CTED-076","SP-42","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("78","CTED-077","SP-43","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("79","CTED-078","SP-44","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("80","CTED-079","SP-45","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("81","CTED-080","SP-46","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("82","CTED-081","SP-47","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("83","CTED-082","SP-48","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("84","CTED-083","SP-49","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("85","CTED-084","SP-50","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("86","CTED-085","SP-51","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("87","CTED-086","SP-52","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("88","CTED-087","SP-53","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("89","CTED-088","SP-54","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("90","CTED-089","SP-55","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("91","CTED-090","SP-56","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("92","CTED-091","SP-57","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("93","CTED-092","SP-58","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("94","CTED-093","SP-59","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("95","CTED-094","SP-60","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("96","CTED-095","SP-61","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("97","CTED-096","SP-62","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("98","CTED-097","SP-63","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("99","CTED-098","SP-64","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("100","CTED-099","SP-65","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("101","CTED-100","SP-66","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("102","CTED-101","SP-67","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("103","CTED-102","SP-68","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("104","CTED-103","SP-69","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("105","CTED-104","SP-70","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("106","CTED-105","SP-71","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("107","CTED-106","SP-72","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("108","CTED-107","SP-73","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("109","CTED-108","SP-74","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("110","CTED-109","SP-75","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("111","CTED-110","SP-76","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("112","CTED-111","SP-77","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("113","CTED-112","SP-78","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("114","CTED-113","SP-79","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("115","CTED-114","SP-80","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("116","CTED-115","SP-81","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("117","CTED-116","SP-82","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("118","CTED-117","SP-83","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("119","CTED-118","SP-84","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("120","CTED-119","SP-85","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("121","CTED-120","SP-86","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("122","CTED-121","SP-87","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("123","CTED-122","SP-88","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("124","CTED-123","SP-89","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("125","CTED-124","SP-90","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("126","CTED-125","SP-91","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("127","CTED-126","SP-92","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("128","CTED-127","SP-93","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("129","CTED-128","SP-94","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("130","CTED-129","SP-95","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("131","CTED-130","SP-96","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("132","CTED-131","SP-97","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("133","CTED-132","SP-98","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("134","CTED-133","SP-99","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("135","CTED-134","SP-100","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("136","CTED-135","SP-101","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("137","CTED-136","SP-102","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("138","CTED-137","SP-103","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("139","CTED-138","SP-104","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("140","CTED-139","SP-139","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("141","CTED-140","FLT-04","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("142","CTED-141","FLT-06","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("143","CTED-142","FLT-07","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("144","CTED-143","FLT-08","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("145","CTED-144","FLT-11","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("146","CTED-145","FLT-12","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("147","CTED-146","FLT-13","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("148","CTED-147","FLT-15","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("149","CTED-148","RST-17","48","1","0000-00-00","1");
INSERT INTO equipments VALUES("150","CTED-149","FLT-18","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("151","CTED-150","FLT-19","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("152","CTED-151","FLT-20","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("153","CTED-152","FLT-21","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("154","CTED-153","FLT-22","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("155","CTED-154","FLT-23","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("156","CTED-155","FLT-24","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("157","CTED-156","FLT-25","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("158","CTED-157","FLT-26","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("159","CTED-158","FLT-27","49","1","0000-00-00","1");
INSERT INTO equipments VALUES("160","CTED-159","RST-28","48","1","0000-00-00","1");
INSERT INTO equipments VALUES("161","CTED-160","SP-105","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("162","CTED-161","SP-106","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("163","CTED-162","SP-107","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("164","CTED-163","SP-108","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("165","CTED-164","SP-109","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("166","CTED-165","SP-110","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("167","CTED-166","SP-111","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("168","CTED-167","SP-112","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("169","CTED-168","SP-113","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("170","CTED-169","SP-114","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("171","CTED-170","SP-115","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("172","CTED-171","SP-116","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("173","CTED-172","SP-117","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("174","CTED-173","SP-118","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("175","CTED-174","SP-119","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("176","CTED-175","SP-120","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("177","CTED-176","SP-121","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("178","CTED-177","SP-122","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("179","CTED-178","SP-123","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("180","CTED-179","SP-124","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("181","CTED-180","SP-125","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("182","CTED-181","SP-126","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("183","CTED-182","SP-127","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("184","CTED-183","SP-128","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("185","CTED-184","SP-129","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("186","CTED-185","SP-130","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("187","CTED-186","SP-131","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("188","CTED-187","SP-132","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("189","CTED-188","SP-133","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("190","CTED-189","SP-134","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("191","CTED-190","SP-135","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("192","CTED-191","SP-136","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("193","CTED-192","SP-137","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("194","CTED-193","SP-138","51","1","0000-00-00","1");
INSERT INTO equipments VALUES("201","CTED-197","SP-01","51","1","0000-00-00","");
INSERT INTO equipments VALUES("202","CTED-198","SP-02","51","1","0000-00-00","");
INSERT INTO equipments VALUES("203","CTED-199","SP-20","51","1","0000-00-00","");
INSERT INTO equipments VALUES("204","CTED-200","SP-21","51","1","0000-00-00","");
INSERT INTO equipments VALUES("205","CTED-201","MHC-01","50","1","0000-00-00","");
INSERT INTO equipments VALUES("206","CTED-202","MHC-04","50","1","0000-00-00","");
INSERT INTO equipments VALUES("207","CTED-203","MHC-05","50","1","0000-00-00","");
INSERT INTO equipments VALUES("208","CTED-204","SC-161","56","1","0000-00-00","");
INSERT INTO equipments VALUES("209","CTED-205","SC-162","56","1","0000-00-00","");
INSERT INTO equipments VALUES("210","CTED-206","SC-163","56","1","0000-00-00","");
INSERT INTO equipments VALUES("211","CTED-201","TS-01","58","1","0000-00-00","");
INSERT INTO equipments VALUES("212","CTED-202","TS-02","58","1","0000-00-00","");
INSERT INTO equipments VALUES("213","CTED-203","TS-03","58","1","0000-00-00","");
INSERT INTO equipments VALUES("214","CTED-204","TS-04","58","1","0000-00-00","");
INSERT INTO equipments VALUES("215","CTED-205","TS-05","58","1","0000-00-00","");
INSERT INTO equipments VALUES("216","CTED-206","TS-06","58","1","0000-00-00","");
INSERT INTO equipments VALUES("217","CTED-207","RST-29","48","1","0000-00-00","");
INSERT INTO equipments VALUES("218","CTED-208","CH-01","51","1","0000-00-00","");
INSERT INTO equipments VALUES("219","CTED-209","CH-02","51","1","0000-00-00","");
INSERT INTO equipments VALUES("220","CTED-210","CH-03","51","1","0000-00-00","");
INSERT INTO equipments VALUES("221","CTED-211","CH-04","51","1","0000-00-00","");
INSERT INTO equipments VALUES("222","CTED-212","CH-05","51","1","0000-00-00","");
INSERT INTO equipments VALUES("223","CTED-213","CH-06","51","1","0000-00-00","");
INSERT INTO equipments VALUES("224","CTED-214","CH-07","51","1","0000-00-00","");
INSERT INTO equipments VALUES("225","CTED-215","CH-08","51","1","0000-00-00","");
INSERT INTO equipments VALUES("226","CTED-216","CH-07","51","1","0000-00-00","");
INSERT INTO equipments VALUES("227","CTED-217","CH-06","51","1","0000-00-00","");
INSERT INTO equipments VALUES("228","CTED-218","CH-09","51","1","0000-00-00","");
INSERT INTO equipments VALUES("229","CTED-219","CH-42","51","1","0000-00-00","");
INSERT INTO equipments VALUES("230","CTED-220","CH-56","51","1","0000-00-00","");
INSERT INTO equipments VALUES("231","CTED-221","RTG-42","47","1","0000-00-00","");
INSERT INTO equipments VALUES("232","CTED-222","RTG-43","47","1","0000-00-00","");
INSERT INTO equipments VALUES("233","CTED-223","RTG-44","47","1","0000-00-00","");
INSERT INTO equipments VALUES("234","CTED-224","QGC-15","46","1","0000-00-00","");
INSERT INTO equipments VALUES("235","CTED-225","QGC-16","46","1","0000-00-00","");
INSERT INTO equipments VALUES("236","CTED-226","RTG-45","47","1","0000-00-00","");
INSERT INTO equipments VALUES("237","CTED-227","RTG-46","47","1","0000-00-00","");
INSERT INTO equipments VALUES("238","CTED-228","RTG-47","47","1","0000-00-00","");
INSERT INTO equipments VALUES("239","CTED-229","QGC-17","46","1","0000-00-00","");
INSERT INTO equipments VALUES("240","CTED-230","QGC-18","46","1","0000-00-00","");
INSERT INTO equipments VALUES("241","CTED-231","TS 07","59","1","0000-00-00","");
INSERT INTO equipments VALUES("242","CTED-232","TS 08","59","1","0000-00-00","");
INSERT INTO equipments VALUES("243","CTED-233","TS 09","59","1","0000-00-00","");
INSERT INTO equipments VALUES("244","CTED-234","TS 10","59","1","0000-00-00","");
INSERT INTO equipments VALUES("245","CTED-235","TS 11","59","1","0000-00-00","");
INSERT INTO equipments VALUES("246","CTED-236","TS 12","59","1","0000-00-00","");
INSERT INTO equipments VALUES("247","CTED-237","TS 13","59","1","0000-00-00","");
INSERT INTO equipments VALUES("248","CTED-238","TS 14","59","1","0000-00-00","");
INSERT INTO equipments VALUES("249","CTED-239","TS 15","59","1","0000-00-00","");
INSERT INTO equipments VALUES("250","CTED-240","TS 16","59","1","0000-00-00","");
INSERT INTO equipments VALUES("251","CTED-241","TS 17","59","1","0000-00-00","");
INSERT INTO equipments VALUES("252","CTED-242","TS 18","59","1","0000-00-00","");



CREATE TABLE `history` (
  `id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `class` varchar(191) DEFAULT NULL,
  `text` varchar(191) NOT NULL,
  `assets` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `history_types` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `inv_challan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challan_no` varchar(100) NOT NULL,
  `challan_date` varchar(100) NOT NULL,
  `csn` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complain_id` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `vehicle_reg_no` varchar(100) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `chasis_no` varchar(100) NOT NULL,
  `brand_model` varchar(100) NOT NULL,
  `engine_no` varchar(100) NOT NULL,
  `owner_phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `driver_phone` varchar(100) NOT NULL,
  `milege` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_complaindetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complain_id` varchar(100) NOT NULL,
  `complain_details` varchar(5000) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `des_id` varchar(100) NOT NULL,
  `designation` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `grade` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `division` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `join_date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `sex` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_ga_listunit` (
  `id` int(11) NOT NULL,
  `lunit_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lunit_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `inv_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `invoice_date` varchar(100) NOT NULL,
  `job_card_no` varchar(100) NOT NULL,
  `total_qty` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `total_service` varchar(100) NOT NULL,
  `grand_total` varchar(100) NOT NULL,
  `debit` varchar(100) NOT NULL,
  `credit` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `material_id` varchar(100) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `unit_price` varchar(100) NOT NULL,
  `part_no` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` varchar(25) NOT NULL,
  `issue_date` date NOT NULL,
  `received_by` varchar(100) NOT NULL,
  `receiver_phone` varchar(100) NOT NULL,
  `use_in` varchar(30) NOT NULL,
  `no_of_material` int(11) NOT NULL,
  `total_amount` float NOT NULL,
  `remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `issued_by` varchar(100) NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `approved_by` varchar(100) NOT NULL,
  `approved_at` datetime DEFAULT NULL,
  `approval_remarks` longtext NOT NULL,
  `issue_image` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_issue VALUES("1","IS-CW-001","2023-09-05","","","CH-01","0","15500","Okay","1","1","1","0","","","","");
INSERT INTO inv_issue VALUES("2","IS-CW-002","2023-09-05","","","FLT-04","0","15500","Okay","1","1","1","0","","","","");



CREATE TABLE `inv_issuedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `issue_date` date NOT NULL,
  `material_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `issue_qty` float NOT NULL,
  `issue_price` float NOT NULL,
  `part_no` varchar(200) NOT NULL,
  `use_in` varchar(50) NOT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `package_id` varchar(100) NOT NULL,
  `building_id` varchar(100) NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_manual_code_edit` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'for checking manual code update',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_issuedetail VALUES("1","IS-CW-001","2023-09-05","02-01","1","20","1","4500","920871.0163","CH-01","1","1","","","0","0");
INSERT INTO inv_issuedetail VALUES("2","IS-CW-001","2023-09-05","02-02","2","20","2","5500","923829.1401","CH-01","1","1","","","0","0");
INSERT INTO inv_issuedetail VALUES("3","IS-CW-002","2023-09-05","02-01","1","20","1","4500","920871.0163","FLT-04","1","1","","","0","0");
INSERT INTO inv_issuedetail VALUES("4","IS-CW-002","2023-09-05","02-02","2","20","2","5500","923829.1401","FLT-04","1","1","","","0","0");



CREATE TABLE `inv_item_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_item_unit VALUES("20","Pcs");
INSERT INTO inv_item_unit VALUES("21","Ltr");
INSERT INTO inv_item_unit VALUES("22","Kg");
INSERT INTO inv_item_unit VALUES("23","Sets");
INSERT INTO inv_item_unit VALUES("27","Set");
INSERT INTO inv_item_unit VALUES("28","Coil");
INSERT INTO inv_item_unit VALUES("29","Meters");
INSERT INTO inv_item_unit VALUES("30","Feet");



CREATE TABLE `inv_job_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_card_no` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `complain_id` varchar(100) NOT NULL,
  `milege` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL,
  `inv_status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_job_card_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_card_no` varchar(100) NOT NULL,
  `task_details` varchar(100) NOT NULL,
  `assign_to` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id_code` varchar(100) DEFAULT NULL,
  `material_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_sub_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_level3_id` int(11) DEFAULT NULL,
  `material_level4_id` int(11) DEFAULT NULL,
  `material_description` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `spec` varchar(100) NOT NULL,
  `location` varchar(30) NOT NULL,
  `type` varchar(100) NOT NULL,
  `material_min_stock` int(11) DEFAULT NULL,
  `avg_con_sump` int(11) DEFAULT NULL,
  `lead_time` int(11) DEFAULT NULL,
  `re_order_level` int(11) NOT NULL,
  `qty_unit` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `op_balance_qty` int(11) NOT NULL,
  `op_balance_val` int(11) NOT NULL,
  `chk_print` int(11) DEFAULT NULL,
  `cur_qty` int(11) DEFAULT NULL,
  `cur_price` int(11) DEFAULT NULL,
  `cur_value` int(11) DEFAULT NULL,
  `last_issue` date DEFAULT NULL,
  `last_receive` date DEFAULT NULL,
  `part_no` varchar(100) NOT NULL,
  `current_balance` float NOT NULL,
  `is_manual_code_edit` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'for checking manual code update ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_material VALUES("1","02-01","2","0","0","0","ENGINE","-","","","1","","","0","20","0","0","","","","","","","920871.0163","8","0");
INSERT INTO inv_material VALUES("2","02-02","2","0","0","0","FILTER HOUSING","-","-","","1","","","0","20","0","0","","","","","","","923829.1401","16","0");
INSERT INTO inv_material VALUES("3","01-01","1","0","0","0","xcv","xcv","","","3","","","0","30","0","0","","","","","","","xcv","0","0");
INSERT INTO inv_material VALUES("4","03-01","14","0","0","0","sfsd","sdfs","sdfs","","3","","","0","30","0","0","","","","","","","sdfds","0","0");



CREATE TABLE `inv_material_level3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_level3_code` varchar(15) NOT NULL,
  `category_id` varchar(15) NOT NULL,
  `category_sub_id` varchar(15) NOT NULL,
  `material_level3_description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_material_level4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_level4_code` varchar(15) NOT NULL,
  `category_id` varchar(15) NOT NULL,
  `category_sub_id` varchar(15) NOT NULL,
  `level3_id` varchar(15) NOT NULL,
  `material_level4_description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_material_partno_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inv_material_id` int(11) DEFAULT NULL,
  `material_id_code` varchar(255) DEFAULT NULL,
  `part_no` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO inv_material_partno_detail VALUES("1","1","01-01","vbn","1","1","1","2023-09-05 00:00:00","2023-09-05 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("2","1","02-01","920871.0163","1","1","1","2023-09-05 00:00:00","2023-09-05 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("3","2","02-02","923829.1401","1","1","1","2023-09-05 00:00:00","2023-09-05 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("4","3","01-01","xcv","1","1","1","2023-09-05 00:00:00","2023-09-05 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("5","4","03-01","sdfds","1","1","1","2023-09-05 00:00:00","2023-09-05 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("6","0","02-01","920871.0163","1","1","1","2023-09-07 00:00:00","2023-09-07 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("7","0","02-01","920871.0163","1","1","1","2023-09-19 00:00:00","2023-09-19 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("8","0","02-01","920871.0163","1","1","1","2023-09-19 00:00:00","2023-09-19 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("9","0","02-01","920871.0163","1","1","1","2023-09-19 00:00:00","2023-09-19 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("10","0","02-01","920871.0163","1","1","1","2023-09-19 00:00:00","2023-09-19 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("11","0","02-01","920871.0163","1","1","1","2023-09-19 00:00:00","2023-09-19 00:00:00");



CREATE TABLE `inv_materialbalance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_ref_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_materialid` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_date` date NOT NULL,
  `mbin_qty` float NOT NULL,
  `mbin_val` float NOT NULL,
  `mbout_qty` float NOT NULL,
  `mbout_val` float NOT NULL,
  `mbprice` float NOT NULL,
  `mbtype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mbserial` float NOT NULL,
  `mbserial_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mbunit_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jvno` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `package_id` varchar(100) NOT NULL,
  `building_id` varchar(100) NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_manual_code_edit` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'for checking manual code update	',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_materialbalance VALUES("1","MRR-0001","02-01","2023-09-05","10","45000","0","0","4500","Receive","1.1","1","20","MRR-0001","920871.0163","1","1","","","0","0");
INSERT INTO inv_materialbalance VALUES("2","MRR-0001","02-02","2023-09-05","20","110000","0","0","5500","Receive","1.1","1","20","MRR-0001","923829.1401","1","1","","","0","0");
INSERT INTO inv_materialbalance VALUES("3","IS-CW-001","02-01","2023-09-05","0","0","1","4500","4500","Issue","1.1","1","20","IS-CW-001","920871.0163","1","1","","","0","0");
INSERT INTO inv_materialbalance VALUES("4","IS-CW-001","02-02","2023-09-05","0","0","2","11000","5500","Issue","1.1","1","20","IS-CW-001","923829.1401","1","1","","","0","0");
INSERT INTO inv_materialbalance VALUES("5","IS-CW-002","02-01","2023-09-05","0","0","1","4500","4500","Issue","1.1","1","20","IS-CW-002","920871.0163","1","1","","","0","0");
INSERT INTO inv_materialbalance VALUES("6","IS-CW-002","02-02","2023-09-05","0","0","2","11000","5500","Issue","1.1","1","20","IS-CW-002","923829.1401","1","1","","","0","0");



CREATE TABLE `inv_materialcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_sub_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_sub_description` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `inv_materialcategorysub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `_order` float NOT NULL,
  `category_description` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stock_acct_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chk_sbalance` int(11) DEFAULT NULL,
  `consumption_ac` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `same_level` tinyint(4) NOT NULL,
  `has_child` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_materialcategorysub VALUES("1","01-00","0","1","RST","","","","0","1");
INSERT INTO inv_materialcategorysub VALUES("2","02-00","1","2","KALMAR","","","","0","1");
INSERT INTO inv_materialcategorysub VALUES("3","03-00","1","3","LIEBHERR","","","","0","1");
INSERT INTO inv_materialcategorysub VALUES("19","04-00","3","4","rtr","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("20","05-00","0","6","ghjgg","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("21","06-00","0","7","dfsdfsd","","","","0","1");
INSERT INTO inv_materialcategorysub VALUES("22","07-00","0","8","hjhj","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("23","08-00","21","0","okokok","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("24","09-00","0","5","fgfg","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("25","10-00","0","5","sfgf","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("26","11-00","2","6","fgfg","","","","0","0");



CREATE TABLE `inv_particulars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `particulars_id` varchar(100) NOT NULL,
  `type_id` varchar(100) NOT NULL,
  `particulars` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_particulars_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_product_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mrr_no` varchar(20) NOT NULL,
  `material_id` varchar(20) NOT NULL,
  `receive_details_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `part_no` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `cerated_by` varchar(15) NOT NULL,
  `updated_at` date NOT NULL,
  `updated_by` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO inv_product_price VALUES("1","MRR-0001","02-01","1","8","4500","920871.0163","1","2023-09-05","","0000-00-00","");
INSERT INTO inv_product_price VALUES("2","MRR-0001","02-02","2","16","5500","923829.1401","1","2023-09-05","","0000-00-00","");



CREATE TABLE `inv_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `purchase_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receive_acct_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supplier_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postedtogl` int(11) DEFAULT NULL,
  `remarks` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `purchase_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `purchase_ware_hosue_id` int(11) DEFAULT NULL,
  `purchase_unit_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chk_year_end` int(11) DEFAULT NULL,
  `receive_total` float DEFAULT NULL,
  `no_of_material` float DEFAULT NULL,
  `challanno` varchar(500) DEFAULT NULL,
  `jv_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  `requisitionno` varchar(500) DEFAULT NULL,
  `requisition_date` datetime DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `inv_purchasedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `purchase_qty` float NOT NULL,
  `unit_price` float NOT NULL,
  `sl_no` int(11) NOT NULL,
  `total_purchase` float NOT NULL,
  `rd_serial_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `inv_receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mrr_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mrr_date` date DEFAULT NULL,
  `purchase_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receive_acct_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supplier_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postedtogl` int(11) DEFAULT NULL,
  `vat_challan_no` varchar(100) NOT NULL,
  `remarks` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receive_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) DEFAULT NULL,
  `receive_unit_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chk_year_end` int(11) DEFAULT NULL,
  `receive_total` float DEFAULT NULL,
  `no_of_material` float DEFAULT NULL,
  `challanno` varchar(500) DEFAULT NULL,
  `challan_date` date NOT NULL,
  `jv_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  `requisitionno` varchar(500) DEFAULT NULL,
  `requisition_date` datetime DEFAULT NULL,
  `received_by` varchar(100) NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `approved_by` varchar(100) NOT NULL,
  `approved_at` datetime DEFAULT NULL,
  `approval_remarks` longtext NOT NULL,
  `mrr_image` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_receive VALUES("1","MRR-0001","2023-09-05","PR-0001","6-14-010","SID-001","0","","Okay","Credit","1","1","1","","155000","30","CH-0001","2023-09-05","","923829.1401","RLP-0001","2023-09-05 00:00:00","1","0","","0000-00-00 00:00:00","","");



CREATE TABLE `inv_receivedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mrr_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `receive_qty` float NOT NULL,
  `unit_price` float NOT NULL,
  `sl_no` int(11) NOT NULL,
  `total_receive` float NOT NULL,
  `rd_serial_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(1000) NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_manual_code_edit` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'for checking manual code update',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_receivedetail VALUES("1","MRR-0001","02-01","1","20","10","4500","1","45000","","920871.0163","1","1","0","0");
INSERT INTO inv_receivedetail VALUES("2","MRR-0001","02-02","2","20","20","5500","1","110000","","923829.1401","1","1","0","0");



CREATE TABLE `inv_requisition` (
  `id` int(11) NOT NULL,
  `requisition_id` varchar(25) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `requisition_date` datetime NOT NULL,
  `remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `no_of_material` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `inv_requisition_details` (
  `id` int(11) NOT NULL,
  `requisition_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_id` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requisition_qty` float NOT NULL,
  `sl_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `inv_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` varchar(25) NOT NULL,
  `return_date` date NOT NULL,
  `remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `package_id` varchar(100) NOT NULL,
  `building_id` varchar(100) NOT NULL,
  `approval_status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `inv_returndetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `return_date` date NOT NULL,
  `material_id` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `return_qty` float NOT NULL,
  `return_price` float NOT NULL,
  `part_no` varchar(200) NOT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `inv_serviceinvoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `job_card_no` varchar(100) NOT NULL,
  `service_name` varchar(2000) NOT NULL,
  `amount` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_company` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_person` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sposition` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_op_balance` float NOT NULL,
  `supplier_type` varchar(100) NOT NULL,
  `material_type` varchar(100) NOT NULL,
  `cc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `inv_supplierbalance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sb_ref_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `sb_date` date NOT NULL,
  `sb_supplier_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sb_dr_amount` float NOT NULL,
  `sb_cr_amount` float NOT NULL,
  `sb_remark` varchar(175) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sb_partac_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_supplierbalance VALUES("1","MRR-0001","1","2023-09-05","SID-001","0","155000","Okay","MRR-0001","0");



CREATE TABLE `inv_technicianinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `department` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `address` varchar(5000) NOT NULL,
  `district` varchar(100) NOT NULL,
  `postcode` varchar(100) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `emg_contact` varchar(100) NOT NULL,
  `emg_rel` varchar(100) NOT NULL,
  `emg_tel` varchar(100) NOT NULL,
  `emg_mob` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_tranferdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` varchar(100) NOT NULL,
  `material_id` varchar(100) NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `transfer_qty` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `inwarehouse` varchar(100) NOT NULL,
  `outwarehouse` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_transfermaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` varchar(100) NOT NULL,
  `transfer_date` varchar(100) NOT NULL,
  `from_warehouse` varchar(100) NOT NULL,
  `to_warehouse` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` varchar(100) NOT NULL,
  `voucher_date` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_voucher_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` varchar(100) NOT NULL,
  `voucher_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_voucherdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` varchar(100) NOT NULL,
  `voucher_cat` varchar(100) NOT NULL,
  `voucher_type` varchar(100) NOT NULL,
  `voucher_details` varchar(5000) NOT NULL,
  `amount` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `inv_warehosueinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` varchar(100) NOT NULL,
  `name` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `short_name` varchar(100) NOT NULL,
  `project_id` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_warehosueinfo VALUES("1","WH-001","Port Warehouse","CTW","1","Chattogram Port, Chattogram","","0","2020-12-14 10:49:26","","");



CREATE TABLE `item_details` (
  `id` int(11) NOT NULL,
  `parent_item_id` int(11) NOT NULL,
  `sub_item_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `item_code` varchar(400) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(400) DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `materialbalance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_ref_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_materialid` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_date` date NOT NULL,
  `mbin_qty` float NOT NULL,
  `mbin_val` float NOT NULL,
  `mbout_qty` float NOT NULL,
  `mbout_val` float NOT NULL,
  `mbprice` float NOT NULL,
  `mbtype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mbserial` float NOT NULL,
  `mbserial_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mbunit_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jvno` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL,
  `type` enum('backend','frontend') NOT NULL,
  `name` varchar(191) NOT NULL,
  `items` text DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL,
  `view_permission_id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL COMMENT 'view_route',
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `notesheet_access_chain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chain_type` varchar(150) NOT NULL DEFAULT 'default',
  `division_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `notesheet_type` int(11) DEFAULT NULL,
  `users` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO notesheet_access_chain VALUES("24","default","16","129","21","0","{\"3374\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}","1","2023-09-21 07:55:41","","");
INSERT INTO notesheet_access_chain VALUES("25","default","16","130","21","0","{\"3377\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}","1","2023-09-21 08:01:03","","");



CREATE TABLE `notesheet_roles_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `details` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO notesheet_roles_group VALUES("1","member","[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\"]");
INSERT INTO notesheet_roles_group VALUES("2","acknowledgers","[\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\",\"g16\"]");
INSERT INTO notesheet_roles_group VALUES("3","approval","[\"g17\",\"g18\",\"g19\",\"g20\"]");



CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL,
  `message` varchar(191) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 - Dashboard , 2 - Email , 3 - Both',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` varchar(100) NOT NULL,
  `project_id` int(11) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(191) NOT NULL,
  `page_slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `cannonical_link` varchar(191) DEFAULT NULL,
  `seo_title` varchar(191) DEFAULT NULL,
  `seo_keyword` varchar(191) DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `parent_category` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `parent_code` varchar(400) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permission_role VALUES("116","56","14");
INSERT INTO permission_role VALUES("117","55","14");
INSERT INTO permission_role VALUES("118","54","14");
INSERT INTO permission_role VALUES("119","53","14");
INSERT INTO permission_role VALUES("120","52","14");
INSERT INTO permission_role VALUES("121","51","14");
INSERT INTO permission_role VALUES("122","50","14");
INSERT INTO permission_role VALUES("123","49","14");
INSERT INTO permission_role VALUES("124","48","14");
INSERT INTO permission_role VALUES("125","47","14");
INSERT INTO permission_role VALUES("126","46","14");
INSERT INTO permission_role VALUES("127","45","14");
INSERT INTO permission_role VALUES("128","44","14");
INSERT INTO permission_role VALUES("129","43","14");
INSERT INTO permission_role VALUES("131","41","14");
INSERT INTO permission_role VALUES("132","40","14");
INSERT INTO permission_role VALUES("133","39","14");
INSERT INTO permission_role VALUES("134","38","14");
INSERT INTO permission_role VALUES("135","37","14");
INSERT INTO permission_role VALUES("136","36","14");
INSERT INTO permission_role VALUES("137","35","14");
INSERT INTO permission_role VALUES("138","34","14");
INSERT INTO permission_role VALUES("140","32","14");
INSERT INTO permission_role VALUES("141","31","14");
INSERT INTO permission_role VALUES("142","30","14");
INSERT INTO permission_role VALUES("143","27","14");
INSERT INTO permission_role VALUES("144","26","14");
INSERT INTO permission_role VALUES("145","25","14");
INSERT INTO permission_role VALUES("146","24","14");
INSERT INTO permission_role VALUES("147","23","14");
INSERT INTO permission_role VALUES("148","22","14");
INSERT INTO permission_role VALUES("149","21","14");
INSERT INTO permission_role VALUES("150","20","14");
INSERT INTO permission_role VALUES("151","19","14");
INSERT INTO permission_role VALUES("152","18","14");
INSERT INTO permission_role VALUES("153","17","14");
INSERT INTO permission_role VALUES("154","16","14");
INSERT INTO permission_role VALUES("155","15","14");
INSERT INTO permission_role VALUES("156","14","14");
INSERT INTO permission_role VALUES("157","13","14");
INSERT INTO permission_role VALUES("158","12","14");
INSERT INTO permission_role VALUES("159","11","14");
INSERT INTO permission_role VALUES("160","10","14");
INSERT INTO permission_role VALUES("161","9","14");
INSERT INTO permission_role VALUES("162","8","14");
INSERT INTO permission_role VALUES("163","7","14");
INSERT INTO permission_role VALUES("164","6","14");
INSERT INTO permission_role VALUES("165","5","14");
INSERT INTO permission_role VALUES("166","4","14");
INSERT INTO permission_role VALUES("168","2","14");
INSERT INTO permission_role VALUES("170","29","14");
INSERT INTO permission_role VALUES("171","28","14");
INSERT INTO permission_role VALUES("173","55","15");
INSERT INTO permission_role VALUES("174","54","15");
INSERT INTO permission_role VALUES("175","53","15");
INSERT INTO permission_role VALUES("176","52","15");
INSERT INTO permission_role VALUES("177","51","15");
INSERT INTO permission_role VALUES("178","50","15");
INSERT INTO permission_role VALUES("179","49","15");
INSERT INTO permission_role VALUES("180","48","15");
INSERT INTO permission_role VALUES("181","47","15");
INSERT INTO permission_role VALUES("182","46","15");
INSERT INTO permission_role VALUES("184","44","15");
INSERT INTO permission_role VALUES("187","31","15");
INSERT INTO permission_role VALUES("188","27","15");
INSERT INTO permission_role VALUES("197","3","14");
INSERT INTO permission_role VALUES("198","1","14");
INSERT INTO permission_role VALUES("199","42","14");
INSERT INTO permission_role VALUES("201","32","15");
INSERT INTO permission_role VALUES("203","28","15");
INSERT INTO permission_role VALUES("204","56","15");
INSERT INTO permission_role VALUES("205","45","15");
INSERT INTO permission_role VALUES("207","59","14");
INSERT INTO permission_role VALUES("208","1","16");
INSERT INTO permission_role VALUES("209","58","16");
INSERT INTO permission_role VALUES("210","27","16");
INSERT INTO permission_role VALUES("211","57","16");
INSERT INTO permission_role VALUES("212","31","16");
INSERT INTO permission_role VALUES("213","56","16");
INSERT INTO permission_role VALUES("214","55","16");
INSERT INTO permission_role VALUES("215","54","16");
INSERT INTO permission_role VALUES("216","53","16");
INSERT INTO permission_role VALUES("217","52","16");
INSERT INTO permission_role VALUES("218","51","16");
INSERT INTO permission_role VALUES("219","50","16");
INSERT INTO permission_role VALUES("220","49","16");
INSERT INTO permission_role VALUES("221","48","16");
INSERT INTO permission_role VALUES("222","47","16");
INSERT INTO permission_role VALUES("223","46","16");
INSERT INTO permission_role VALUES("224","45","16");
INSERT INTO permission_role VALUES("225","44","16");
INSERT INTO permission_role VALUES("226","40","16");
INSERT INTO permission_role VALUES("227","35","16");
INSERT INTO permission_role VALUES("228","21","16");
INSERT INTO permission_role VALUES("229","17","16");
INSERT INTO permission_role VALUES("230","13","16");
INSERT INTO permission_role VALUES("231","9","16");
INSERT INTO permission_role VALUES("232","6","16");
INSERT INTO permission_role VALUES("235","60","14");
INSERT INTO permission_role VALUES("237","33","14");
INSERT INTO permission_role VALUES("240","43","16");
INSERT INTO permission_role VALUES("241","42","16");
INSERT INTO permission_role VALUES("242","41","16");



CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) NOT NULL,
  `permission_category` varchar(60) NOT NULL,
  `sort` smallint(5) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("1","material-list","Material List","Material","0","1","","","","","");
INSERT INTO permissions VALUES("2","material-add","Material Entry","Material","0","1","","","","","");
INSERT INTO permissions VALUES("3","material-edit","Material Update","Material","0","1","","","","","");
INSERT INTO permissions VALUES("4","material-delete","Material Delete","Material","0","1","","","","","");
INSERT INTO permissions VALUES("5","part-no-update","Part No Update","Material","0","1","","","","","");
INSERT INTO permissions VALUES("6","category-list","Category List","Material Category","0","1","","","","","");
INSERT INTO permissions VALUES("7","category-add","Category Entry","Material Category","0","1","","","","","");
INSERT INTO permissions VALUES("8","category-delete","Category Delete","Material Category","0","1","","","","","");
INSERT INTO permissions VALUES("9","unit-list","Unit List","Material Unit","0","1","","","","","");
INSERT INTO permissions VALUES("10","unit-add","Unit Entry","Material Unit","0","1","","","","","");
INSERT INTO permissions VALUES("11","unit-edit","Unit Update","Material Unit","0","1","","","","","");
INSERT INTO permissions VALUES("12","unit-delete","Unit Delete","Material Unit","0","1","","","","","");
INSERT INTO permissions VALUES("13","project-list","Project List","Projects","0","1","","","","","");
INSERT INTO permissions VALUES("14","project-add","Project Entry","Projects","0","1","","","","","");
INSERT INTO permissions VALUES("15","project-edit","Project Update","Projects","0","1","","","","","");
INSERT INTO permissions VALUES("16","project-delete","Project Delete","Projects","0","1","","","","","");
INSERT INTO permissions VALUES("17","warehouse-list","Warehouse List","Warehouse","0","1","","","","","");
INSERT INTO permissions VALUES("18","warehouse-add","Warehouse Entry","Warehouse","0","1","","","","","");
INSERT INTO permissions VALUES("19","warehouse-edit","Warehouse Update","Warehouse","0","1","","","","","");
INSERT INTO permissions VALUES("20","warehouse-delete","Warehouse Delete","Warehouse","0","1","","","","","");
INSERT INTO permissions VALUES("21","equipment-list","Equipment List","Equipment","0","1","","","","","");
INSERT INTO permissions VALUES("22","equipment-add","Equipment Entry","Equipment","0","1","","","","","");
INSERT INTO permissions VALUES("23","equipment-edit","Equipment Update","Equipment","0","1","","","","","");
INSERT INTO permissions VALUES("24","equipment-delete","Equipment Delete","Equipment","0","1","","","","","");
INSERT INTO permissions VALUES("25","opening-stock-list","Opening Stock List","Opening Stock","0","1","","","","","");
INSERT INTO permissions VALUES("26","opening-stock-edit","Opening Stock Update","Opening Stock","0","1","","","","","");
INSERT INTO permissions VALUES("27","material-receive-list","Material Receive List","Material Receive","0","1","","","","","");
INSERT INTO permissions VALUES("28","material-receive-add","Material Receive Entry","Material Receive","0","1","","","","","");
INSERT INTO permissions VALUES("29","material-receive-edit","Material Receive Update","Material Receive","0","1","","","","","");
INSERT INTO permissions VALUES("30","material-receive-delete","Material Receive Delete","Material Receive","0","1","","","","","");
INSERT INTO permissions VALUES("31","material-issue-list","Material Issue List","Material Issue","0","1","","","","","");
INSERT INTO permissions VALUES("32","material-issue-add","Material Issue Entry","Material Issue","0","1","","","","","");
INSERT INTO permissions VALUES("33","material-issue-edit","Material Issue Update","Material Issue","0","1","","","","","");
INSERT INTO permissions VALUES("34","material-issue-delete","Material Issue Delete","Material Issue","0","1","","","","","");
INSERT INTO permissions VALUES("35","user-list","User List","User","0","1","","","","","");
INSERT INTO permissions VALUES("36","user-add","User Entry","User","0","1","","","","","");
INSERT INTO permissions VALUES("37","user-edit","User Update","User","0","1","","","","","");
INSERT INTO permissions VALUES("38","user-profile-update","User Profile Update","User","0","1","","","","","");
INSERT INTO permissions VALUES("39","user-delete","User Delete","User","0","1","","","","","");
INSERT INTO permissions VALUES("40","role-list","Role List","Role","0","1","","","","","");
INSERT INTO permissions VALUES("41","role-add","Role Entry","Role","0","1","","","","","");
INSERT INTO permissions VALUES("42","role-edit","Role Update","Role","0","1","","","","","");
INSERT INTO permissions VALUES("43","role-delete","Role Delete","Role","0","1","","","","","");
INSERT INTO permissions VALUES("44","category-wise-material-list","Categorywise Material List","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("45","material-stock-report","Material Stock Report","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("46","material-wise-stock-report","Materialwise Stock Report","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("47","category-wise-material-stock-report","Categorywise material Stock Report","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("48","material-movement-report","Material Movement Report","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("49","equipment-history","Equipment History","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("50","material-history","Material History","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("51","material-receive-history","Material Receive History","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("52","material-issue-history","Material Issue History","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("53","material-receive-details","Material Receive Details","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("54","categorywise-material-receive-details","Categorywise Material Receive Details","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("55","material-issue-details","Material Issue Details","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("56","categorywise-material-issue-details","Categorywise Material Issue Details","Material Stock Report","0","1","","","","","");
INSERT INTO permissions VALUES("57","material-issue-approve","Material Issue Approve","Material Issue","0","1","","","","","");
INSERT INTO permissions VALUES("58","material-receive-approve","Material Receive Approve","Material Receive","0","1","","","","","");
INSERT INTO permissions VALUES("59","data-backup","Data Backup","Material","0","1","","","","","");
INSERT INTO permissions VALUES("60","log-history","Log History","Report Part","0","1","","","","","");



CREATE TABLE `plant_and_equipment` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `equipment_type` int(11) DEFAULT NULL,
  `date_form` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `name` varchar(700) DEFAULT NULL,
  `eel_code` varchar(300) DEFAULT NULL,
  `country_of_origin` varchar(400) DEFAULT NULL,
  `capacity` varchar(300) DEFAULT NULL,
  `make_by` varchar(300) DEFAULT NULL,
  `model` varchar(300) DEFAULT NULL,
  `year_of_manufac` int(11) DEFAULT NULL,
  `present_location` varchar(300) DEFAULT NULL,
  `present_condition` varchar(400) DEFAULT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `present_condition` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `priority_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `color_code` varchar(350) NOT NULL,
  `show_order` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO priority_details VALUES("1","Urgent","danger","1");
INSERT INTO priority_details VALUES("2","High","info","2");
INSERT INTO priority_details VALUES("3","Medium","warning","3");
INSERT INTO priority_details VALUES("4","Normal","success","4");



CREATE TABLE `product_movement` (
  `id` int(11) NOT NULL,
  `movement_no` varchar(500) DEFAULT NULL,
  `entry_date` datetime NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `project_form` int(11) DEFAULT NULL,
  `project_to` int(11) DEFAULT NULL,
  `total_quantity` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `movement_type` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `product_movement_details` (
  `id` int(11) NOT NULL,
  `movement_no` varchar(500) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `name` varchar(400) DEFAULT NULL,
  `unit_name` varchar(100) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `project_type` (
  `id` int(11) NOT NULL,
  `name` varchar(600) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `incharge` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO projects VALUES("1","PR-001","CTED, Chattogram","Lt Commander M Tafsir Uddin Ahmed(Retd)","Chattogram Port, Chattogram","","","2020-12-14 10:48:32","","");



CREATE TABLE `rlp_access_chain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chain_type` varchar(150) NOT NULL DEFAULT 'default',
  `division_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `rlp_type` int(11) DEFAULT NULL,
  `users` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO rlp_access_chain VALUES("64","default","16","130","21","0","{\"3374\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}","1","2023-09-20 11:48:22","","");
INSERT INTO rlp_access_chain VALUES("67","default","5","32","21","0","{\"3374\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}","1","2023-09-21 09:37:05","","");



CREATE TABLE `rlp_acknowledgement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rlp_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ack_order` int(11) NOT NULL COMMENT 'acknowledge order to show the RLP',
  `ack_status` tinyint(4) NOT NULL DEFAULT 0,
  `ack_request_date` datetime NOT NULL,
  `ack_updated_date` datetime DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=not visible; 1= visible',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rlp_info_id` (`rlp_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1335 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO rlp_acknowledgement VALUES("1332","1","3374","1","0","2023-09-21 11:03:55","","1","1","");
INSERT INTO rlp_acknowledgement VALUES("1333","1","3373","2","0","2023-09-21 11:03:54","","0","1","");
INSERT INTO rlp_acknowledgement VALUES("1334","1","3372","3","0","2023-09-21 11:03:55","","0","1","");



CREATE TABLE `rlp_delete_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rlp_info_id` int(11) NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rlp_info_id` (`rlp_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `rlp_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rlp_info_id` int(11) NOT NULL,
  `item_des` longtext DEFAULT NULL,
  `purpose` longtext DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `unit` varchar(11) NOT NULL,
  `unit_price` float NOT NULL,
  `amount` float NOT NULL,
  `estimated_price` float DEFAULT NULL,
  `supplier` text DEFAULT NULL,
  `details_remarks` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rlp_info_id` (`rlp_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1503 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO rlp_details VALUES("1","1","Pendrive","office","1","PCS","800","800","","","");
INSERT INTO rlp_details VALUES("2","1","SSD","office","1","PCS","4000","4000","","","");



CREATE TABLE `rlp_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rlp_no` varchar(100) NOT NULL,
  `rlp_user_id` int(11) unsigned NOT NULL,
  `rlp_user_office_id` varchar(500) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `request_date` datetime NOT NULL,
  `request_division` int(11) DEFAULT NULL,
  `request_department` int(11) NOT NULL,
  `request_project` int(11) NOT NULL,
  `request_person` varchar(650) DEFAULT NULL,
  `designation` varchar(500) DEFAULT NULL,
  `email` varchar(500) NOT NULL,
  `contact_number` varchar(100) DEFAULT NULL,
  `user_remarks` text DEFAULT NULL,
  `totalamount` float NOT NULL,
  `rlp_status` tinyint(1) NOT NULL DEFAULT 5,
  `is_viewd` tinyint(1) NOT NULL DEFAULT 0,
  `is_ns` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rlp_user_id` (`rlp_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO rlp_info VALUES("1","RLP---2023-09-001","1","","2","2023-09-21 12:00:00","5","32","21","Atiqur Rahman Bhuiyan","","","","Okay","0","5","0","0","1","2023-09-21 11:03:54","","0000-00-00 00:00:00","0");



CREATE TABLE `rlp_remarks_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rlp_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `remarks` longtext NOT NULL,
  `remarks_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rlp_info_id` (`rlp_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=782 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO roles VALUES("1","member","sa","1");
INSERT INTO roles VALUES("2","acknowledgers","ak","0");
INSERT INTO roles VALUES("3","approval","ap","0");
INSERT INTO roles VALUES("4","team88","88","0");
INSERT INTO roles VALUES("5","superadmin","sa","0");
INSERT INTO roles VALUES("6","admin","ad","0");
INSERT INTO roles VALUES("7","rlp_admin","g3","0");
INSERT INTO roles VALUES("8","Grade-06","g6","0");
INSERT INTO roles VALUES("9","Grade-05","g5","0");
INSERT INTO roles VALUES("10","Grade-17","g17","0");
INSERT INTO roles VALUES("11","Grade-13","g13","0");
INSERT INTO roles VALUES("12","Grade-04","g4","0");
INSERT INTO roles VALUES("13","Grade-14","g14","0");
INSERT INTO roles VALUES("14","Grade-12","g12","0");
INSERT INTO roles VALUES("15","Grade-09","g9","0");
INSERT INTO roles VALUES("16","Grade-18","g18","0");
INSERT INTO roles VALUES("17","Grade-15","g15","0");
INSERT INTO roles VALUES("18","Grade-11","g11","0");
INSERT INTO roles VALUES("19","Grade-16","g16","0");
INSERT INTO roles VALUES("20","Grade-19","g19","0");
INSERT INTO roles VALUES("21","Grade-20","g20","0");
INSERT INTO roles VALUES("22","Grade-17S","g17s","0");
INSERT INTO roles VALUES("23","Grade-07","g7","0");
INSERT INTO roles VALUES("24","Grade-08","g8","0");
INSERT INTO roles VALUES("25","Grade-10","g10","0");
INSERT INTO roles VALUES("26","rlp_admin","g3","0");



CREATE TABLE `roles_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `details` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO roles_group VALUES("1","member","[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\"]");
INSERT INTO roles_group VALUES("2","acknowledgers","[\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\"]");
INSERT INTO roles_group VALUES("3","approval","[\"g16\",\"g17\",\"g18\",\"g19\",\"g20\"]");
INSERT INTO roles_group VALUES("4","team88","[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\",\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\"]");
INSERT INTO roles_group VALUES("5","admin","[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\",\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\",\"g16\",\"g17\",\"g18\",\"g19\",\"g20\"]");
INSERT INTO roles_group VALUES("6","superadmin","[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\",\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\",\"g16\",\"g17\",\"g18\",\"g19\",\"g20\"]");



CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(600) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `seo_title` varchar(191) DEFAULT NULL,
  `seo_keyword` text DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `company_contact` varchar(191) DEFAULT NULL,
  `company_address` text DEFAULT NULL,
  `from_name` varchar(191) DEFAULT NULL,
  `from_email` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `google` varchar(191) DEFAULT NULL,
  `copyright_text` varchar(191) DEFAULT NULL,
  `footer_text` varchar(191) DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `disclaimer` text DEFAULT NULL,
  `google_analytics` text DEFAULT NULL,
  `home_video1` varchar(191) DEFAULT NULL,
  `home_video2` varchar(191) DEFAULT NULL,
  `home_video3` varchar(191) DEFAULT NULL,
  `home_video4` varchar(191) DEFAULT NULL,
  `explanation1` varchar(191) DEFAULT NULL,
  `explanation2` varchar(191) DEFAULT NULL,
  `explanation3` varchar(191) DEFAULT NULL,
  `explanation4` varchar(191) DEFAULT NULL,
  `values` text DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `post_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `social_logins` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(32) NOT NULL,
  `provider_id` varchar(191) NOT NULL,
  `token` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `status_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(350) NOT NULL,
  `bg_color` varchar(450) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO status_details VALUES("1","Approved","#C3FDB8");
INSERT INTO status_details VALUES("2","Processing","#31708f");
INSERT INTO status_details VALUES("3","Reject","#a94442");
INSERT INTO status_details VALUES("4","On Held","#8a6d3b");
INSERT INTO status_details VALUES("5","Pending","#FFDB58");
INSERT INTO status_details VALUES("6","Recommended","#00ACD6");
INSERT INTO status_details VALUES("7","Draft","#e57817");



CREATE TABLE `sttable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleno` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `registrationno` varchar(150) NOT NULL,
  `tax_issdt` date NOT NULL,
  `tax_expdt` date NOT NULL,
  `fit_issdt` date NOT NULL,
  `fit_expdt` date NOT NULL,
  `ins_issdt` date NOT NULL,
  `ins_expdt` date NOT NULL,
  `rou_issdt` date NOT NULL,
  `rou_expdt` date NOT NULL,
  `engineno` varchar(55) NOT NULL,
  `chasisno` varchar(50) NOT NULL,
  `regdate` date NOT NULL,
  `serialno` varchar(50) NOT NULL,
  `modelno` varchar(50) NOT NULL,
  `ccno` varchar(50) NOT NULL,
  `netvalue` int(11) NOT NULL,
  `sno` int(11) NOT NULL,
  `myear` varchar(50) NOT NULL,
  `office` varchar(75) NOT NULL,
  `division` varchar(79) NOT NULL,
  `location` varchar(80) NOT NULL,
  `photo` varchar(1000) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `sub_code` varchar(400) NOT NULL,
  `name` varchar(600) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `supplier_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherid` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `voucherdate` date NOT NULL,
  `supplierid` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `paymenttype` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` double NOT NULL,
  `remarks` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sp_photo` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(5000) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `supplier_phone` varchar(100) NOT NULL,
  `supplier_op_balance` varchar(100) NOT NULL,
  `supplier_type` varchar(100) NOT NULL,
  `material_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO suppliers VALUES("1","SID-001","Saif Powertec Ltd","-","-","-","-","cash","47");



CREATE TABLE `tb_billpayment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mr_no` varchar(100) NOT NULL,
  `mr_date` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `accheadname` varchar(100) NOT NULL,
  `debitamount` varchar(100) NOT NULL,
  `creditamount` varchar(100) NOT NULL,
  `mode` varchar(100) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `check_no` text NOT NULL,
  `check_date` varchar(100) NOT NULL,
  `job_card_no` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `tb_ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `tran_date` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL,
  `debit` varchar(100) NOT NULL,
  `credit` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `tbl_customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(250) NOT NULL,
  `Address` text NOT NULL,
  `City` varchar(250) NOT NULL,
  `PostalCode` varchar(30) NOT NULL,
  `Country` varchar(100) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `temp_product_receive_data` (
  `id` int(11) NOT NULL,
  `receive_no` varchar(500) NOT NULL,
  `receive_date` datetime NOT NULL,
  `product_id` int(11) NOT NULL,
  `part_no` varchar(500) NOT NULL,
  `supplier_id` varchar(250) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` float NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL,
  `project_to_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `userIp` varbinary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO userlog VALUES("4","1","Admin CTED","14","","203.82.207.81","2023-06-12 14:55:23");
INSERT INTO userlog VALUES("5","7","User Zilani","15","","203.82.207.81","2023-06-12 14:55:38");
INSERT INTO userlog VALUES("6","1","Admin CTED","14","","203.82.207.81","2023-06-12 15:12:44");
INSERT INTO userlog VALUES("7","8","User Mamun","15","","203.82.207.81","2023-06-12 15:20:35");
INSERT INTO userlog VALUES("8","1","Admin CTED","14","","203.82.207.81","2023-06-12 15:20:52");
INSERT INTO userlog VALUES("9","8","User Mamun","15","","203.82.207.81","2023-06-12 15:21:11");
INSERT INTO userlog VALUES("10","1","Admin CTED","14","","203.82.207.81","2023-06-12 15:28:12");
INSERT INTO userlog VALUES("11","1","Admin CTED","14","","203.82.207.81","2023-06-12 16:18:09");
INSERT INTO userlog VALUES("12","1","Admin CTED","14","","203.82.207.81","2023-06-12 16:22:30");
INSERT INTO userlog VALUES("13","1","Admin CTED","14","","203.82.207.81","2023-06-12 17:01:54");
INSERT INTO userlog VALUES("14","1","Admin CTED","14","","203.82.207.81","2023-06-12 17:02:38");
INSERT INTO userlog VALUES("15","1","Admin CTED","14","","203.82.207.81","2023-06-12 17:12:48");
INSERT INTO userlog VALUES("16","1","Admin CTED","14","","203.82.207.81","2023-06-12 17:43:34");
INSERT INTO userlog VALUES("17","1","Admin CTED","14","","203.82.207.81","2023-06-12 17:56:33");
INSERT INTO userlog VALUES("18","1","Admin CTED","14","","203.82.207.81","2023-06-12 19:13:23");
INSERT INTO userlog VALUES("19","1","Admin CTED","14","","203.82.207.81","2023-06-13 09:30:54");
INSERT INTO userlog VALUES("20","4","Super Admin","14","","203.82.207.81","2023-06-13 09:35:43");
INSERT INTO userlog VALUES("21","4","Super Admin","14","","203.82.207.81","2023-06-13 09:35:44");
INSERT INTO userlog VALUES("22","1","Admin CTED","14","","203.82.207.81","2023-06-13 12:59:48");
INSERT INTO userlog VALUES("23","8","User Mamun","15","","203.82.207.81","2023-06-13 13:05:11");
INSERT INTO userlog VALUES("24","1","Admin CTED","14","","203.82.207.81","2023-06-13 15:28:19");
INSERT INTO userlog VALUES("25","4","Super Admin","14","","203.82.207.81","2023-06-13 15:30:51");
INSERT INTO userlog VALUES("26","1","Admin CTED","14","","203.82.207.81","2023-06-13 15:32:16");
INSERT INTO userlog VALUES("27","1","Admin CTED","14","","203.82.207.81","2023-06-13 15:50:40");
INSERT INTO userlog VALUES("28","1","Admin CTED","14","","203.82.207.81","2023-06-13 18:17:29");
INSERT INTO userlog VALUES("29","1","Admin CTED","14","","203.82.207.81","2023-06-14 08:59:02");
INSERT INTO userlog VALUES("30","1","Admin CTED","14","","203.82.207.81","2023-06-14 09:32:02");
INSERT INTO userlog VALUES("31","1","Admin CTED","14","","203.82.207.81","2023-06-14 10:00:56");
INSERT INTO userlog VALUES("32","1","Admin CTED","14","","203.82.207.81","2023-06-14 11:27:55");
INSERT INTO userlog VALUES("33","1","Admin CTED","14","","203.82.207.81","2023-06-14 12:59:54");
INSERT INTO userlog VALUES("34","1","Admin CTED","14","","203.82.207.81","2023-06-14 13:00:06");
INSERT INTO userlog VALUES("35","1","Admin CTED","14","","203.82.207.81","2023-06-14 14:45:41");
INSERT INTO userlog VALUES("36","1","Admin CTED","14","","203.82.207.81","2023-06-14 15:44:50");
INSERT INTO userlog VALUES("37","1","Admin CTED","14","","203.82.207.81","2023-06-14 15:50:23");
INSERT INTO userlog VALUES("38","8","User Mamun","15","","203.82.207.81","2023-06-14 15:53:51");
INSERT INTO userlog VALUES("39","1","Admin CTED","14","","203.82.207.81","2023-06-14 15:54:57");
INSERT INTO userlog VALUES("40","7","User Zilani","15","","203.82.207.81","2023-06-14 15:55:51");
INSERT INTO userlog VALUES("41","1","Admin CTED","14","","203.82.207.81","2023-06-14 15:56:32");
INSERT INTO userlog VALUES("42","1","Admin CTED","14","","203.82.207.81","2023-06-14 15:56:37");
INSERT INTO userlog VALUES("43","1","Admin CTED","14","","203.82.207.81","2023-06-14 15:57:40");
INSERT INTO userlog VALUES("44","1","Admin CTED","14","","203.82.207.81","2023-06-14 16:00:02");
INSERT INTO userlog VALUES("45","1","Admin CTED","14","","203.82.207.81","2023-06-14 16:21:32");
INSERT INTO userlog VALUES("46","8","User Mamun","15","","203.82.207.81","2023-06-14 16:22:57");
INSERT INTO userlog VALUES("47","1","Admin CTED","14","","203.82.207.81","2023-06-14 16:45:36");
INSERT INTO userlog VALUES("48","7","User Zilani","15","","203.82.207.81","2023-06-14 16:46:36");
INSERT INTO userlog VALUES("49","1","Admin CTED","14","","203.82.207.81","2023-06-14 16:47:07");
INSERT INTO userlog VALUES("50","8","User Mamun","15","","203.82.207.81","2023-06-15 10:06:06");
INSERT INTO userlog VALUES("51","7","User Zilani","15","","203.82.207.81","2023-06-15 11:44:41");
INSERT INTO userlog VALUES("52","1","Admin CTED","14","","203.82.207.81","2023-06-15 14:12:29");
INSERT INTO userlog VALUES("53","7","User Zilani","15","","203.82.207.81","2023-06-15 14:16:10");
INSERT INTO userlog VALUES("54","1","Admin CTED","14","","203.82.207.81","2023-06-15 14:44:56");
INSERT INTO userlog VALUES("55","1","Admin CTED","14","","203.82.207.81","2023-06-15 14:44:57");
INSERT INTO userlog VALUES("56","1","Admin CTED","14","","203.82.207.81","2023-06-15 14:44:59");
INSERT INTO userlog VALUES("57","4","Super Admin","14","","203.82.207.81","2023-06-15 14:45:43");
INSERT INTO userlog VALUES("58","4","Super Admin","14","","203.82.207.81","2023-06-15 14:48:02");
INSERT INTO userlog VALUES("59","4","Super Admin","14","","203.82.207.81","2023-06-15 14:49:14");
INSERT INTO userlog VALUES("60","4","Super Admin","14","","203.82.207.81","2023-06-15 14:50:17");
INSERT INTO userlog VALUES("61","4","Super Admin","14","","203.82.207.81","2023-06-15 14:51:09");
INSERT INTO userlog VALUES("62","7","User Zilani","15","","203.82.207.81","2023-06-15 14:52:50");
INSERT INTO userlog VALUES("63","4","Super Admin","14","","203.82.207.81","2023-06-15 14:53:13");
INSERT INTO userlog VALUES("64","4","Super Admin","14","","203.82.207.81","2023-06-15 14:54:04");
INSERT INTO userlog VALUES("65","1","Admin CTED","14","","203.82.207.81","2023-06-15 15:00:34");
INSERT INTO userlog VALUES("66","4","Super Admin","16","","203.82.207.81","2023-06-15 15:09:39");
INSERT INTO userlog VALUES("67","8","User Mamun","15","","203.82.207.81","2023-06-17 08:25:23");
INSERT INTO userlog VALUES("68","1","Admin CTED","14","","203.82.207.81","2023-06-17 08:50:45");
INSERT INTO userlog VALUES("69","1","Admin CTED","14","","203.82.207.81","2023-06-17 19:41:53");
INSERT INTO userlog VALUES("70","8","User Mamun","15","","203.82.207.81","2023-06-18 09:23:47");
INSERT INTO userlog VALUES("71","4","Super Admin","16","","203.82.207.81","2023-06-18 12:29:17");
INSERT INTO userlog VALUES("72","8","User Mamun","15","","203.82.207.81","2023-06-18 16:31:13");
INSERT INTO userlog VALUES("73","1","Admin CTED","14","","203.82.207.81","2023-06-19 11:55:16");
INSERT INTO userlog VALUES("74","4","Super Admin","16","","203.82.207.81","2023-06-19 12:01:34");
INSERT INTO userlog VALUES("75","1","Admin CTED","14","","203.82.207.81","2023-06-19 12:01:57");
INSERT INTO userlog VALUES("76","1","Admin CTED","14","","203.82.207.81","2023-06-19 12:04:38");
INSERT INTO userlog VALUES("77","1","Admin CTED","14","","203.82.207.81","2023-06-19 16:07:28");
INSERT INTO userlog VALUES("78","1","Admin CTED","14","","203.82.207.81","2023-06-19 16:10:52");
INSERT INTO userlog VALUES("79","8","User Mamun","15","","203.82.207.81","2023-06-19 16:44:11");
INSERT INTO userlog VALUES("80","4","Super Admin","16","","203.82.207.81","2023-06-20 10:10:14");
INSERT INTO userlog VALUES("81","8","User Mamun","15","","203.82.207.81","2023-06-20 10:19:15");
INSERT INTO userlog VALUES("82","1","Admin CTED","14","","203.82.207.81","2023-06-20 12:14:41");
INSERT INTO userlog VALUES("83","1","Admin CTED","14","","203.82.207.81","2023-06-20 14:04:47");
INSERT INTO userlog VALUES("84","1","Admin CTED","14","","203.82.207.81","2023-06-20 14:32:15");
INSERT INTO userlog VALUES("85","4","Super Admin","16","","203.82.207.81","2023-06-20 15:03:47");
INSERT INTO userlog VALUES("86","7","User Zilani","15","","203.82.207.81","2023-06-20 15:24:05");
INSERT INTO userlog VALUES("87","4","Super Admin","16","","203.82.207.81","2023-06-20 15:48:45");
INSERT INTO userlog VALUES("88","1","Admin CTED","14","","203.82.207.81","2023-06-20 16:13:50");
INSERT INTO userlog VALUES("89","7","User Zilani","15","","203.82.207.81","2023-06-20 16:21:45");
INSERT INTO userlog VALUES("90","4","Super Admin","16","","203.82.207.81","2023-06-20 17:36:05");
INSERT INTO userlog VALUES("91","1","Admin CTED","14","","203.82.207.81","2023-06-20 19:10:46");
INSERT INTO userlog VALUES("92","1","Admin CTED","14","","203.82.207.81","2023-06-20 19:16:11");
INSERT INTO userlog VALUES("93","8","User Mamun","15","","203.82.207.81","2023-06-21 09:26:06");
INSERT INTO userlog VALUES("94","4","Super Admin","16","","203.82.207.81","2023-06-21 09:45:07");
INSERT INTO userlog VALUES("95","1","Admin CTED","14","","203.82.207.81","2023-06-21 09:55:19");
INSERT INTO userlog VALUES("96","7","User Zilani","15","","203.82.207.81","2023-06-21 09:55:39");
INSERT INTO userlog VALUES("97","8","User Mamun","15","","203.82.207.81","2023-06-21 10:10:29");
INSERT INTO userlog VALUES("98","7","User Zilani","15","","203.82.207.81","2023-06-21 10:56:36");
INSERT INTO userlog VALUES("99","8","User Mamun","15","","203.82.207.81","2023-06-21 10:56:38");
INSERT INTO userlog VALUES("100","8","User Mamun","15","","203.82.207.81","2023-06-21 10:56:44");
INSERT INTO userlog VALUES("101","8","User Mamun","15","","203.82.207.81","2023-06-21 10:58:10");
INSERT INTO userlog VALUES("102","8","User Mamun","15","","203.82.207.81","2023-06-21 10:58:32");
INSERT INTO userlog VALUES("103","8","User Mamun","15","","203.82.207.81","2023-06-21 11:18:23");
INSERT INTO userlog VALUES("104","1","Admin CTED","14","","203.82.207.81","2023-06-21 14:34:26");
INSERT INTO userlog VALUES("105","1","Admin CTED","14","","203.82.207.81","2023-06-21 17:19:43");
INSERT INTO userlog VALUES("106","7","User Zilani","15","","203.82.207.81","2023-06-21 17:28:09");
INSERT INTO userlog VALUES("107","1","Admin CTED","14","","203.82.207.81","2023-06-21 17:36:05");
INSERT INTO userlog VALUES("108","8","User Mamun","15","","203.82.207.81","2023-06-21 17:36:56");
INSERT INTO userlog VALUES("109","1","Admin CTED","14","","203.82.207.81","2023-06-21 17:38:06");
INSERT INTO userlog VALUES("110","8","User Mamun","15","","203.82.207.81","2023-06-22 09:17:56");
INSERT INTO userlog VALUES("111","1","Admin CTED","14","","203.82.207.81","2023-06-22 09:32:42");
INSERT INTO userlog VALUES("112","1","Admin CTED","14","","203.82.207.81","2023-06-22 09:50:53");
INSERT INTO userlog VALUES("113","1","Admin CTED","14","","203.82.207.81","2023-06-22 11:09:38");
INSERT INTO userlog VALUES("114","1","Admin CTED","14","","203.82.207.81","2023-06-22 11:35:45");
INSERT INTO userlog VALUES("115","1","Admin CTED","14","","203.82.207.81","2023-06-22 11:36:03");
INSERT INTO userlog VALUES("116","1","Admin CTED","14","","203.82.207.81","2023-06-22 12:08:54");
INSERT INTO userlog VALUES("117","1","Admin CTED","14","","203.82.207.81","2023-06-22 15:28:15");
INSERT INTO userlog VALUES("118","8","User Mamun","15","","203.82.207.81","2023-06-22 18:32:15");
INSERT INTO userlog VALUES("119","1","Admin CTED","14","","203.82.207.81","2023-06-24 10:04:14");
INSERT INTO userlog VALUES("120","8","User Mamun","15","","203.82.207.81","2023-06-24 10:18:29");
INSERT INTO userlog VALUES("121","8","User Mamun","15","","203.82.207.81","2023-06-25 10:40:12");
INSERT INTO userlog VALUES("122","1","Admin CTED","14","","203.82.207.81","2023-06-25 15:46:57");
INSERT INTO userlog VALUES("123","8","User Mamun","15","","203.82.207.81","2023-06-26 08:34:42");
INSERT INTO userlog VALUES("124","8","User Mamun","15","","203.82.207.81","2023-06-27 09:46:02");
INSERT INTO userlog VALUES("125","8","User Mamun","15","","203.82.207.81","2023-06-27 18:00:31");
INSERT INTO userlog VALUES("126","8","User Mamun","15","","203.82.207.81","2023-06-28 10:03:22");
INSERT INTO userlog VALUES("127","8","User Mamun","15","","203.82.207.81","2023-07-01 10:13:18");
INSERT INTO userlog VALUES("128","8","User Mamun","15","","203.82.207.81","2023-07-02 09:11:06");
INSERT INTO userlog VALUES("129","8","User Mamun","15","","203.82.207.81","2023-07-02 16:46:39");
INSERT INTO userlog VALUES("130","1","Admin CTED","14","","203.82.207.81","2023-07-02 18:39:54");
INSERT INTO userlog VALUES("131","8","User Mamun","15","","203.82.207.81","2023-07-03 08:44:33");
INSERT INTO userlog VALUES("132","8","User Mamun","15","","203.82.207.81","2023-07-03 16:46:45");
INSERT INTO userlog VALUES("133","8","User Mamun","15","","203.82.207.81","2023-07-04 09:07:57");
INSERT INTO userlog VALUES("134","8","User Mamun","15","","203.82.207.81","2023-07-04 17:27:33");
INSERT INTO userlog VALUES("135","8","User Mamun","15","","203.82.207.81","2023-07-05 08:19:14");
INSERT INTO userlog VALUES("136","1","Admin CTED","14","","203.82.207.81","2023-07-05 12:17:13");
INSERT INTO userlog VALUES("137","8","User Mamun","15","","203.82.207.81","2023-07-06 10:11:08");
INSERT INTO userlog VALUES("138","8","User Mamun","15","","203.82.207.81","2023-07-06 13:59:37");
INSERT INTO userlog VALUES("139","7","User Zilani","15","","203.82.207.81","2023-07-06 17:32:10");
INSERT INTO userlog VALUES("140","8","User Mamun","15","","203.82.207.81","2023-07-08 10:19:28");
INSERT INTO userlog VALUES("141","8","User Mamun","15","","203.82.207.81","2023-07-08 14:32:18");
INSERT INTO userlog VALUES("142","8","User Mamun","15","","203.82.207.81","2023-07-09 09:12:09");
INSERT INTO userlog VALUES("143","8","User Mamun","15","","203.82.207.81","2023-07-09 18:04:25");
INSERT INTO userlog VALUES("144","8","User Mamun","15","","203.82.207.81","2023-07-10 09:08:45");
INSERT INTO userlog VALUES("145","1","Admin CTED","14","","203.82.207.81","2023-07-10 09:56:41");
INSERT INTO userlog VALUES("146","1","Admin CTED","14","","203.82.207.81","2023-07-10 16:09:37");
INSERT INTO userlog VALUES("147","8","User Mamun","15","","203.82.207.81","2023-07-11 09:56:12");
INSERT INTO userlog VALUES("148","8","User Mamun","15","","203.82.207.81","2023-07-12 09:36:41");
INSERT INTO userlog VALUES("149","8","User Mamun","15","","203.82.207.81","2023-07-12 18:05:09");
INSERT INTO userlog VALUES("150","8","User Mamun","15","","203.82.207.81","2023-07-13 09:08:21");
INSERT INTO userlog VALUES("151","7","User Zilani","15","","203.82.207.81","2023-07-13 11:05:07");
INSERT INTO userlog VALUES("152","1","Admin CTED","14","","203.82.207.81","2023-07-13 11:08:45");
INSERT INTO userlog VALUES("153","1","Admin CTED","14","","203.82.207.81","2023-07-13 11:08:49");
INSERT INTO userlog VALUES("154","1","Admin CTED","14","","203.82.207.81","2023-07-13 11:32:22");
INSERT INTO userlog VALUES("155","8","User Mamun","15","","203.82.207.81","2023-07-13 17:32:06");
INSERT INTO userlog VALUES("156","8","User Mamun","15","","203.82.207.81","2023-07-15 10:09:59");
INSERT INTO userlog VALUES("157","1","Admin CTED","14","","203.82.207.81","2023-07-15 17:18:48");
INSERT INTO userlog VALUES("158","1","Admin CTED","14","","203.82.207.81","2023-07-15 17:18:49");
INSERT INTO userlog VALUES("159","8","User Mamun","15","","203.82.207.81","2023-07-16 10:22:06");
INSERT INTO userlog VALUES("160","1","Admin CTED","14","","203.82.207.81","2023-07-16 18:06:21");
INSERT INTO userlog VALUES("161","8","User Mamun","15","","203.82.207.81","2023-07-17 09:54:04");
INSERT INTO userlog VALUES("162","8","User Mamun","15","","203.82.207.81","2023-07-17 17:47:37");
INSERT INTO userlog VALUES("163","8","User Mamun","15","","203.82.207.81","2023-07-19 09:25:54");
INSERT INTO userlog VALUES("164","8","User Mamun","15","","203.82.207.81","2023-07-20 09:17:01");
INSERT INTO userlog VALUES("165","1","Admin CTED","14","","203.82.207.81","2023-07-20 10:19:59");
INSERT INTO userlog VALUES("166","1","Admin CTED","14","","203.82.207.81","2023-07-20 15:27:03");
INSERT INTO userlog VALUES("167","1","Admin CTED","14","","203.82.207.81","2023-07-20 17:02:35");
INSERT INTO userlog VALUES("168","7","User Zilani","15","","203.82.207.81","2023-07-20 17:31:38");
INSERT INTO userlog VALUES("169","8","User Mamun","15","","203.82.207.81","2023-07-20 18:42:26");
INSERT INTO userlog VALUES("170","8","User Mamun","15","","203.82.207.81","2023-07-21 17:23:59");
INSERT INTO userlog VALUES("171","8","User Mamun","15","","203.82.207.81","2023-07-23 08:57:50");
INSERT INTO userlog VALUES("172","8","User Mamun","15","","203.82.207.81","2023-07-24 09:33:55");
INSERT INTO userlog VALUES("173","8","User Mamun","15","","203.82.207.81","2023-07-25 09:05:50");
INSERT INTO userlog VALUES("174","4","Super Admin","16","","203.82.207.81","2023-07-25 09:28:13");
INSERT INTO userlog VALUES("175","1","Admin CTED","14","","203.82.207.81","2023-07-25 10:20:52");
INSERT INTO userlog VALUES("176","8","User Mamun","15","","203.82.207.81","2023-07-25 16:07:49");
INSERT INTO userlog VALUES("177","8","User Mamun","15","","203.82.207.81","2023-07-26 09:04:21");
INSERT INTO userlog VALUES("178","1","Admin CTED","14","","203.82.207.81","2023-07-26 12:04:03");
INSERT INTO userlog VALUES("179","1","Admin CTED","14","","203.82.207.81","2023-07-26 12:31:07");
INSERT INTO userlog VALUES("180","1","Admin CTED","14","","203.82.207.81","2023-07-26 12:31:59");
INSERT INTO userlog VALUES("181","7","User Zilani","15","","203.82.207.81","2023-07-26 14:05:15");
INSERT INTO userlog VALUES("182","1","Admin CTED","14","","203.82.207.81","2023-07-26 17:17:59");
INSERT INTO userlog VALUES("183","8","User Mamun","15","","203.82.207.81","2023-07-29 15:19:03");
INSERT INTO userlog VALUES("184","8","User Mamun","15","","203.82.207.81","2023-07-30 16:02:25");
INSERT INTO userlog VALUES("185","8","User Mamun","15","","203.82.207.81","2023-07-31 09:49:05");
INSERT INTO userlog VALUES("186","8","User Mamun","15","","203.82.207.81","2023-07-31 17:33:54");
INSERT INTO userlog VALUES("187","8","User Mamun","15","","203.82.207.81","2023-08-01 10:28:28");
INSERT INTO userlog VALUES("188","8","User Mamun","15","","203.82.207.81","2023-08-01 17:26:16");
INSERT INTO userlog VALUES("189","1","Admin CTED","14","","203.82.207.81","2023-08-02 14:38:20");
INSERT INTO userlog VALUES("190","8","User Mamun","15","","203.82.207.81","2023-08-02 16:21:34");
INSERT INTO userlog VALUES("191","1","Admin CTED","14","","203.82.207.81","2023-08-03 11:40:55");
INSERT INTO userlog VALUES("192","8","User Mamun","15","","203.82.207.81","2023-08-03 16:23:21");
INSERT INTO userlog VALUES("193","8","User Mamun","15","","203.82.207.81","2023-08-03 17:52:55");
INSERT INTO userlog VALUES("194","8","User Mamun","15","","203.82.207.81","2023-08-05 09:36:00");
INSERT INTO userlog VALUES("195","8","User Mamun","15","","203.82.207.81","2023-08-08 10:20:27");
INSERT INTO userlog VALUES("196","8","User Mamun","15","","203.82.207.81","2023-08-08 11:53:11");
INSERT INTO userlog VALUES("197","8","User Mamun","15","","203.82.207.81","2023-08-09 09:13:07");
INSERT INTO userlog VALUES("198","8","User Mamun","15","","203.82.207.81","2023-08-09 18:22:49");
INSERT INTO userlog VALUES("199","8","User Mamun","15","","203.82.207.81","2023-08-10 09:46:10");
INSERT INTO userlog VALUES("200","8","User Mamun","15","","203.82.207.81","2023-08-12 17:44:55");
INSERT INTO userlog VALUES("201","8","User Mamun","15","","203.82.207.81","2023-08-14 17:58:18");
INSERT INTO userlog VALUES("202","8","User Mamun","15","","203.82.207.81","2023-08-15 09:19:46");
INSERT INTO userlog VALUES("203","8","User Mamun","15","","203.82.207.81","2023-08-15 17:40:43");
INSERT INTO userlog VALUES("204","8","User Mamun","15","","203.82.207.81","2023-08-16 09:22:55");
INSERT INTO userlog VALUES("205","7","User Zilani","15","","203.82.207.81","2023-08-16 11:57:16");
INSERT INTO userlog VALUES("206","8","User Mamun","15","","203.82.207.81","2023-08-17 10:33:14");
INSERT INTO userlog VALUES("207","1","Admin CTED","14","","203.82.207.81","2023-08-17 11:51:24");
INSERT INTO userlog VALUES("208","8","User Mamun","15","","203.82.207.81","2023-08-19 08:59:49");
INSERT INTO userlog VALUES("209","8","User Mamun","15","","203.82.207.81","2023-08-19 17:32:10");
INSERT INTO userlog VALUES("210","1","Admin CTED","14","","203.82.207.81","2023-08-20 14:19:27");
INSERT INTO userlog VALUES("211","8","User Mamun","15","","203.82.207.81","2023-08-20 17:47:01");
INSERT INTO userlog VALUES("212","1","Admin CTED","14","","203.82.207.81","2023-08-21 11:18:07");
INSERT INTO userlog VALUES("213","1","Admin CTED","14","","203.82.207.81","2023-08-22 12:47:28");
INSERT INTO userlog VALUES("214","1","Admin CTED","14","","203.82.207.81","2023-08-22 15:48:49");
INSERT INTO userlog VALUES("215","8","User Mamun","15","","203.82.207.81","2023-08-22 16:03:14");
INSERT INTO userlog VALUES("216","1","Admin CTED","14","","203.82.207.81","2023-08-22 16:35:12");
INSERT INTO userlog VALUES("217","8","User Mamun","15","","203.82.207.81","2023-08-23 09:07:30");
INSERT INTO userlog VALUES("218","8","User Mamun","15","","203.82.207.81","2023-08-24 09:44:34");
INSERT INTO userlog VALUES("219","7","User Zilani","15","","203.82.207.81","2023-08-24 12:30:04");
INSERT INTO userlog VALUES("220","8","User Mamun","15","","203.82.207.81","2023-08-24 18:40:03");
INSERT INTO userlog VALUES("221","8","User Mamun","15","","203.82.207.81","2023-08-26 08:47:56");
INSERT INTO userlog VALUES("222","1","Admin CTED","14","","203.82.207.81","2023-08-27 09:36:47");
INSERT INTO userlog VALUES("223","1","Admin CTED","14","","203.82.207.81","2023-08-27 09:53:10");
INSERT INTO userlog VALUES("224","7","User Zilani","15","","203.82.207.81","2023-08-27 10:02:48");
INSERT INTO userlog VALUES("225","8","User Mamun","15","","203.82.207.81","2023-08-27 10:42:35");
INSERT INTO userlog VALUES("226","7","User Zilani","15","","203.82.207.81","2023-08-27 12:57:12");
INSERT INTO userlog VALUES("227","1","Admin CTED","14","","203.82.207.81","2023-08-27 17:19:55");
INSERT INTO userlog VALUES("228","8","User Mamun","15","","203.82.207.81","2023-08-27 17:34:22");
INSERT INTO userlog VALUES("229","8","User Mamun","15","","203.82.207.81","2023-08-28 09:06:10");
INSERT INTO userlog VALUES("230","7","User Zilani","15","","203.82.207.81","2023-08-28 09:39:37");
INSERT INTO userlog VALUES("231","7","User Zilani","15","","::1","2023-08-28 16:52:24");
INSERT INTO userlog VALUES("232","7","User Zilani","15","","::1","2023-08-29 09:29:46");
INSERT INTO userlog VALUES("233","1","Admin CTED","14","","::1","2023-08-30 09:20:30");
INSERT INTO userlog VALUES("234","1","Admin CTED","14","","::1","2023-09-03 09:44:57");
INSERT INTO userlog VALUES("235","1","Admin INV","14","","::1","2023-09-03 09:56:53");
INSERT INTO userlog VALUES("236","1","Admin INV","14","","::1","2023-09-04 09:46:05");
INSERT INTO userlog VALUES("237","1","Admin INV","14","","::1","2023-09-05 09:38:18");
INSERT INTO userlog VALUES("238","1","Admin INV","14","","::1","2023-09-07 09:32:17");
INSERT INTO userlog VALUES("239","1","Admin INV","14","","::1","2023-09-19 10:56:14");
INSERT INTO userlog VALUES("240","1","Admin INV","14","","::1","2023-09-19 12:06:37");
INSERT INTO userlog VALUES("241","1","Admin INV","14","","::1","2023-09-20 09:31:05");
INSERT INTO userlog VALUES("242","1"," ","1","","::1","2023-09-20 09:41:06");
INSERT INTO userlog VALUES("243","1","88i Admin","1","","::1","2023-09-20 09:42:01");
INSERT INTO userlog VALUES("244","1","88i Admin","14","","::1","2023-09-20 09:42:53");
INSERT INTO userlog VALUES("245","1","88i Admin","14","","::1","2023-09-20 14:56:26");
INSERT INTO userlog VALUES("246","1","88i Admin","14","","::1","2023-09-21 09:51:52");
INSERT INTO userlog VALUES("247","1","88i Admin","14","","::1","2023-09-21 11:00:11");
INSERT INTO userlog VALUES("248","1","88i Admin","14","","::1","2023-09-21 14:32:10");
INSERT INTO userlog VALUES("249","1","88i Admin","14","","::1","2023-09-21 16:10:11");
INSERT INTO userlog VALUES("250","3374"," ","3","","::1","2023-09-21 17:03:33");
INSERT INTO userlog VALUES("251","1","88i Admin","14","","::1","2023-09-21 17:06:29");
INSERT INTO userlog VALUES("252","1","88i Admin","14","","::1","2023-09-24 10:10:45");
INSERT INTO userlog VALUES("253","1","88i Admin","14","","::1","2023-09-24 14:59:17");
INSERT INTO userlog VALUES("254","1","88i Admin","14","","::1","2023-09-26 09:33:08");
INSERT INTO userlog VALUES("255","1","88i Admin","14","","::1","2023-10-01 12:08:37");
INSERT INTO userlog VALUES("256","1","88i Admin","14","","::1","2023-10-01 12:25:22");
INSERT INTO userlog VALUES("257","1","88i Admin","14","","::1","2023-10-01 16:50:01");
INSERT INTO userlog VALUES("258","1","88i Admin","14","","::1","2023-10-04 17:27:49");
INSERT INTO userlog VALUES("259","1","88i Admin","14","","::1","2023-10-05 09:36:46");
INSERT INTO userlog VALUES("260","1","88i Admin","14","","::1","2023-10-12 12:09:51");



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `office_id` varchar(550) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `store_id` int(11) NOT NULL,
  `designation` varchar(650) DEFAULT NULL,
  `role_name` varchar(250) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(100) DEFAULT NULL,
  `profile_image` varchar(650) DEFAULT NULL,
  `signature_image` varchar(550) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_password_changed` tinyint(1) NOT NULL DEFAULT 0,
  `is_status` tinyint(1) NOT NULL DEFAULT 1,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","16","131","21","SA-000001","14","6","1","10","sa","88 IT Admin","admin@admin.com","","","16919031921667818730Nahid-Hasan-Sign1.png","e10adc3949ba59abbe56e057f20f883e","1","1","88i","Admin","admin","0","0","2020-03-16 15:03:06","1","2023-08-13 11:06:32");
INSERT INTO users VALUES("3372","16","131","21","IEL-000002","21","3","0","112","g20","Tarafder Md Ruhul Saif","s@gmail.com","","","","e10adc3949ba59abbe56e057f20f883e","0","1","","","","0","0","2023-07-30 10:56:08","","");
INSERT INTO users VALUES("3373","16","131","21","IEL-000005","13","2","0","15","g14","Md Jobaer Kabir","jk@gmail.com","","","","e10adc3949ba59abbe56e057f20f883e","0","1","","","","0","0","2023-07-30 10:56:41","","");
INSERT INTO users VALUES("3374","16","129","21","IEL-000020","3","2","0","2","g10","Md. Babul Farajee","bf@gmail.com","","","16919032131669633451Zakir-Hussain-handwritten-signature-500x340-removebg-preview.png","e10adc3949ba59abbe56e057f20f883e","1","1","","","","0","0","2023-07-30 10:57:40","1","2023-08-13 11:06:53");
INSERT INTO users VALUES("3375","16","130","21","IEL-000017","5","1","0","1","g8","Atiqur Rahman Bhuiyan","a@gmail.com","01729714503","","","e10adc3949ba59abbe56e057f20f883e","0","1","","","","0","0","2023-07-30 11:09:21","1","2023-08-01 01:39:06");
INSERT INTO users VALUES("3377","16","130","21","IEL-000016","18","2","0","2","g11","Muhammed Fakhrul Islam","fp@gmail.com","123456","","","e10adc3949ba59abbe56e057f20f883e","0","1","","","","0","0","2023-08-01 01:41:37","","");



CREATE TABLE `users2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id2` int(10) unsigned NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `confirmation_code` varchar(191) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `is_term_accept` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 0 = not accepted,1 = accepted',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users2 VALUES("1","1","Admin","INV","admin","1","1","14","admin@admin.com","e10adc3949ba59abbe56e057f20f883e","1","b1970adb3f301c8440c81e45b526060c","1","0","PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr","1","1","2019-01-14 06:17:02","2019-01-21 02:36:38","");
INSERT INTO users2 VALUES("4","4","Super","Admin","superAdmin","1","1","16","superadmin@admin.com","be05977add575832dc52655d4ad5c42e","1","b1970adb3f301c8440c81e45b526060c","1","0","PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr","4","4","","","");
INSERT INTO users2 VALUES("7","1","User","Zilani","whm","1","1","15","zilani@cted.com","dbe174b9745efb86baea199a90cb4a81","1","b1970adb3f301c8440c81e45b526060c","1","0","PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr","1","1","2019-01-14 06:17:02","2019-01-21 02:36:38","");
INSERT INTO users2 VALUES("8","1","User","Mamun","whm","1","1","15","mamun@cted.com","43406defbf583b87cb4eb008d0a7fc95","1","b1970adb3f301c8440c81e45b526060c","1","0","PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr","1","1","2019-01-14 06:17:02","2019-01-21 02:36:38","");

