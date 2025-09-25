

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
  `employeeid` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `company` varchar(100) NOT NULL,
  `division` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `group` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5922 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO inv_employee VALUES("1","BLC-000012","Khandokar Ibnul Hassan","Blueline Communications Ltd.","Blank","Administration","Executive","g9");
INSERT INTO inv_employee VALUES("2","BLC-000013","M Kawser","Blueline Communications Ltd.","Blank","Events And Creative","Manager","");
INSERT INTO inv_employee VALUES("3","BLC-000015","Emon Imtiaj","Blueline Communications Ltd.","Blank","Events And Creative","Executive","");
INSERT INTO inv_employee VALUES("4","BLC-000016","Md Nantu Mallik","Blueline Communications Ltd.","Blank","Events And Creative","Senior Brand Promoter","");
INSERT INTO inv_employee VALUES("5","BLC-000020","Md Sofiul Azam","Blueline Communications Ltd.","Blank","Events And Creative","Video Editor","");
INSERT INTO inv_employee VALUES("6","BLC-000022","Md Uzzal Chowdhury","Blueline Communications Ltd.","Blank","Events And Creative","Executive","");
INSERT INTO inv_employee VALUES("7","BLC-000028","Md Shafiqul Islam Khan","Blueline Communications Ltd.","Blank","Events And Creative","Executive","");
INSERT INTO inv_employee VALUES("8","BLC-000029","Maniruzzaman","Blueline Communications Ltd.","Blank","Events And Creative","Photographer","");
INSERT INTO inv_employee VALUES("9","BLC-000031","Md. Alamgir","Blueline Communications Ltd.","Blank","Administration","Brand Promoter","");
INSERT INTO inv_employee VALUES("10","BLC-000032","Shah Md. Fazla Rabbi","Blueline Communications Ltd.","Blank","Events And Creative","Graphic Designer","");
INSERT INTO inv_employee VALUES("11","BLC-000035","Hasibur Rahman Khan","Blueline Communications Ltd.","Blank","Digital Marketing","Executive","");
INSERT INTO inv_employee VALUES("12","BLC-000036","Md. Asadul Islam","Blueline Communications Ltd.","Blank","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("13","BLC-000038","Md. Riazul Islam","Blueline Communications Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("14","BLC-000040","Md Habebullah Khandakar","Blueline Communications Ltd.","Blank","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("15","BLC-000041","Md. Sumon Miah","Blueline Communications Ltd.","Blank","Administration","Brand Promoter","");
INSERT INTO inv_employee VALUES("16","BLC-000043","Md Monir Hossain","Blueline Communications Ltd.","Blank","Events And Creative","Assistant Manager","");
INSERT INTO inv_employee VALUES("17","BLC-000044","Shakil Jamal","Blueline Communications Ltd.","Blank","Events And Creative","3D Visualizer","");
INSERT INTO inv_employee VALUES("18","BLC-000045","Dipak Chandra Das","Blueline Communications Ltd.","Blank","Digital Marketing","Senior Online Video Editor","");
INSERT INTO inv_employee VALUES("19","BLC-000046","Fatema Binte Nazim","Blueline Communications Ltd.","Blank","Events And Creative","Senior Graphic Designer","");
INSERT INTO inv_employee VALUES("20","BLC-000047","Tahmina Akter","Blueline Communications Ltd.","Blank","Events And Creative","Graphic Designer","");
INSERT INTO inv_employee VALUES("21","BLC-000048","Kazi Md Tajul Islam","Blueline Communications Ltd.","Blank","Events And Creative","Officer","");
INSERT INTO inv_employee VALUES("22","BLC-000049","Sidratul Muntaha","Blueline Communications Ltd.","Blank","Events And Creative","3D Modeler","");
INSERT INTO inv_employee VALUES("23","BLC-000050","Tofayel Ahmed","Blueline Communications Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("24","BLC-000051","Md Munna Hasan","Blueline Communications Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("25","BLC-000052","Md Rezaul Karim","Blueline Communications Ltd.","Blank","Events And Creative","Technician","");
INSERT INTO inv_employee VALUES("26","BLC-000053","Santiranjan Das","Blueline Communications Ltd.","Blank","Events And Creative","Technician","");
INSERT INTO inv_employee VALUES("27","BLC-000054","Md Abu Bakkar Siddique Sagor","Blueline Communications Ltd.","Blank","Events And Creative","Assistant Cameraman","");
INSERT INTO inv_employee VALUES("28","BLC-000055","Shekh Boholul Shah","Blueline Communications Ltd.","Blank","Events And Creative","Assistant Cameraman","");
INSERT INTO inv_employee VALUES("29","BLC-000056","Emon Imtiaj","Blueline Communications Ltd.","Blank","Events And Creative","Executive","");
INSERT INTO inv_employee VALUES("30","BLC-000057","Md. Jahir Uddin","Blueline Communications Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("31","BLC-000058","Firoza","Blueline Communications Ltd.","Blank","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("32","BLC-000059","Md. Abdul Jalil","Blueline Communications Ltd.","Blank","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("33","BLC-000060","Md Harun Or Roshid Babul ","Blueline Communications Ltd.","Blank","Events And Creative","3D Visualizer","");
INSERT INTO inv_employee VALUES("34","BLC-000061","Sohel Rana ","Blueline Communications Ltd.","Blank","Digital Marketing","Executive","");
INSERT INTO inv_employee VALUES("35","ENG-000011","Mohammad Serajus Salekin","E-Engineering Ltd.","E-Engineering","Management","Chief Executive Officer","");
INSERT INTO inv_employee VALUES("36","ENG-000012","H.M. Abdus Sabur Masud","E-Engineering Ltd.","E-Engineering","Market Development","Deputy General Manager","");
INSERT INTO inv_employee VALUES("37","ENG-000013","Md. Nazmul Huq","E-Engineering Ltd.","E-Engineering","Market Development","Manager","");
INSERT INTO inv_employee VALUES("38","ENG-000014","A.T.M Abdul Maleque","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("39","ENG-000015","Md. Jahangir Alam","E-Engineering Ltd.","E-Engineering","Market Development","Senior Officer","");
INSERT INTO inv_employee VALUES("40","ENG-000016","Dilip Kumar Das","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("41","Eng-000017","Shaikh Shuja Uddin","E-Engineering Ltd.","E-Engineering","Market Development","Assistant Manager","");
INSERT INTO inv_employee VALUES("42","Eng-000019","Md. Saiful Islam","E-Engineering Ltd.","E-Engineering","Dredging","Project Manager","");
INSERT INTO inv_employee VALUES("43","Eng-000020","Md. Alam Miah","E-Engineering Ltd.","E-Engineering","Dredging","Dredging Master","");
INSERT INTO inv_employee VALUES("44","Eng-000021","Mohammad Rafiqul Islam","E-Engineering Ltd.","E-Engineering","Engineering","Project Co-Ordinator","");
INSERT INTO inv_employee VALUES("45","ENG-000026","Md. Mahabubur Rahman","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Assistant General Manager","");
INSERT INTO inv_employee VALUES("46","ENG-000028","Rifat Ahmed","E-Engineering Ltd.","E-Engineering","Market Development","Executive","");
INSERT INTO inv_employee VALUES("47","ENG-000029","Md. Younus ","E-Engineering Ltd.","E-Engineering","Business Development","Assistant Manager","");
INSERT INTO inv_employee VALUES("48","ENG-000030","Md. Shofiqul Islam","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("49","ENG-000032","Md. Moniruzzaman Howlader","E-Engineering Ltd.","E-Engineering","Engineering","Assistant Manager","");
INSERT INTO inv_employee VALUES("50","ENG-000033","Abul Kashem","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("51","ENG-000034","Md. Johrul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Executive","");
INSERT INTO inv_employee VALUES("52","ENG-000038","Pabitra Kumar Sarker","E-Engineering Ltd.","E-Engineering","Operation","General Manager","");
INSERT INTO inv_employee VALUES("53","ENG-000039","H.M Golam Kibria","E-Engineering Ltd.","E-Engineering","Operation","Manager","");
INSERT INTO inv_employee VALUES("54","ENG-000040","Saikot Hossain","E-Engineering Ltd.","E-Engineering","Engineering","Officer","");
INSERT INTO inv_employee VALUES("55","ENG-000041","Md Jasim Uddin","E-Engineering Ltd.","E-Engineering","Dredging","Senior Electrician","");
INSERT INTO inv_employee VALUES("56","ENG-000042","Md. Nur Al Amin Rubel","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("57","ENG-000043","Md. Atiqur Rahman","E-Engineering Ltd.","E-Engineering","Dredging","Engine Driver","");
INSERT INTO inv_employee VALUES("58","ENG-000044","Md. Lavlu Sheikh","E-Engineering Ltd.","E-Engineering","Dredging","Work Boat Master","");
INSERT INTO inv_employee VALUES("59","ENG-000045","Md. Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("60","ENG-000046","Amin Talukder","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("61","ENG-000047","Md. Mamun Sarder","E-Engineering Ltd.","E-Engineering","Dredging","WINCH Operator","");
INSERT INTO inv_employee VALUES("62","ENG-000048","Mohammad Abul Hossain Sikder","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("63","ENG-000049","Md. Saiful Islam","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("64","ENG-000050","Md. Eusuf Sikder","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("65","ENG-000051","Md. Saiful Islam","E-Engineering Ltd.","E-Engineering","Dredging","Lever Man","");
INSERT INTO inv_employee VALUES("66","ENG-000052","Md. Jakaria Hossain","E-Engineering Ltd.","E-Engineering","Dredging","Head Cook","");
INSERT INTO inv_employee VALUES("67","ENG-000053","Amir Hosan Shikder","E-Engineering Ltd.","E-Engineering","Dredging","Lever Man","");
INSERT INTO inv_employee VALUES("68","ENG-000056","Forhad Hossain Bhuiya","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Manager","");
INSERT INTO inv_employee VALUES("69","ENG-000057","Md Aminuzzaman","E-Engineering Ltd.","E-Engineering","Market Development","Director","");
INSERT INTO inv_employee VALUES("70","ENG-000058","Md Mahfuz Rahman Sarker","E-Engineering Ltd.","E-Engineering","Finance And Accounts","General Manager","");
INSERT INTO inv_employee VALUES("71","ENG-000059","Md. Hasibur Rahman","E-Engineering Ltd.","E-Engineering","Dredging","General Manager","");
INSERT INTO inv_employee VALUES("72","ENG-000060","Md Altaf Hossain","E-Engineering Ltd.","E-Engineering","Engineering","Supervisor","");
INSERT INTO inv_employee VALUES("73","ENG-000061","Md. Nazmul Haque","E-Engineering Ltd.","E-Engineering","Engineering","Senior Technician","");
INSERT INTO inv_employee VALUES("74","ENG-000062","Md. Altaf Hossain","E-Engineering Ltd.","E-Engineering","Market Development","Director","");
INSERT INTO inv_employee VALUES("75","ENG-000063","Md. Shamim Sheikh","E-Engineering Ltd.","E-Engineering","Administration","Peon","");
INSERT INTO inv_employee VALUES("76","ENG-000065","Md. Abdul Mannan Talukder","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Cook","");
INSERT INTO inv_employee VALUES("77","ENG-000067","Maisha Momtaj","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("78","ENG-000069","Md Salim Mandal","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("79","ENG-000071","Md. Anamul Kabir","E-Engineering Ltd.","E-Engineering","Administration","Assistant","");
INSERT INTO inv_employee VALUES("80","ENG-000072","Md Ali Hossain","E-Engineering Ltd.","E-Engineering","Dredging","Work Boat Master","");
INSERT INTO inv_employee VALUES("81","ENG-000073","Md Baizid Molla","E-Engineering Ltd.","E-Engineering","Dredging","Engine Driver","");
INSERT INTO inv_employee VALUES("82","ENG-000074","Azimuddin Ahmed","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("83","ENG-000076","Md. Rasedul Islam","E-Engineering Ltd.","E-Engineering","Dredging","Engineer","");
INSERT INTO inv_employee VALUES("84","ENG-000079","Md Abul Kalam Azad","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("85","ENG-000080","Md Julhas Hossain","E-Engineering Ltd.","E-Engineering","Engineering","Surveyor","");
INSERT INTO inv_employee VALUES("86","ENG-000081","Md Babul Hossain","E-Engineering Ltd.","E-Engineering","Engineering","Operator","");
INSERT INTO inv_employee VALUES("87","ENG-000082","Md Iqbal Hossain Khan","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant","");
INSERT INTO inv_employee VALUES("88","ENG-000083","Md Akbor Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Manager","");
INSERT INTO inv_employee VALUES("89","ENG-000087","Md Afzal Hossain Morol","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("90","ENG-000088","Md. Aklush Uddin","E-Engineering Ltd.","E-Engineering","Project ENG","Site Supervisor","");
INSERT INTO inv_employee VALUES("91","ENG-000089","Md Sabuj Ali Khan","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("92","ENG-000090","Md Abdul Hakim","E-Engineering Ltd.","E-Engineering","Project ENG","Ship Supervisor","");
INSERT INTO inv_employee VALUES("93","ENG-000094","Md. Mahbub Alam","E-Engineering Ltd.","E-Engineering","Project ENG","Electrician","");
INSERT INTO inv_employee VALUES("94","ENG-000096","Md. Abdullah-al-mamun","E-Engineering Ltd.","E-Engineering","Project ENG","Project Manager","");
INSERT INTO inv_employee VALUES("95","ENG-000097","Md Abdul Jalil","E-Engineering Ltd.","E-Engineering","Project ENG","Mechanic","");
INSERT INTO inv_employee VALUES("96","ENG-000111","Samim Hasan","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("97","ENG-000112","Masud Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Electrician","");
INSERT INTO inv_employee VALUES("98","ENG-000113","Hasib Sarkar","E-Engineering Ltd.","E-Engineering","Project ENG","Site Logistic Officer","");
INSERT INTO inv_employee VALUES("99","ENG-000114","Jasim Uddin","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Site Supervisor","");
INSERT INTO inv_employee VALUES("100","ENG-000115","Md. Saddam Hossain","E-Engineering Ltd.","E-Engineering","Administration","Peon","");
INSERT INTO inv_employee VALUES("101","ENG-000116","Md Badrul Alam","E-Engineering Ltd.","E-Engineering","Project ENG","Technician","");
INSERT INTO inv_employee VALUES("102","ENG-000117","Md Forhad Hossain","E-Engineering Ltd.","E-Engineering","Engineering","Project Co-Ordinator","");
INSERT INTO inv_employee VALUES("103","ENG-000118","Md. Mamunur Rashid","E-Engineering Ltd.","E-Engineering","Project ENG","Executive","");
INSERT INTO inv_employee VALUES("104","ENG-000119","Niaj Mahmud Taj","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant","");
INSERT INTO inv_employee VALUES("105","ENG-000120","B.M. Mizanur Rahman Maznu","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("106","ENG-000121","Sakib Thakur","E-Engineering Ltd.","E-Engineering","Administration","Officer","");
INSERT INTO inv_employee VALUES("107","ENG-000123","Md Jasim Uddin","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("108","ENG-000124","Mohammad Azijul Islam Sojib","E-Engineering Ltd.","E-Engineering","Project ENG","Site Supervisor","");
INSERT INTO inv_employee VALUES("109","ENG-000125","Md. Amjad Hosen","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("110","ENG-000126","Golam Mostafa","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant","");
INSERT INTO inv_employee VALUES("111","ENG-000127","Akter Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Operator","");
INSERT INTO inv_employee VALUES("112","ENG-000128","Md. Shahin Miah","E-Engineering Ltd.","E-Engineering","Project ENG","Electrician","");
INSERT INTO inv_employee VALUES("113","ENG-000129","Md Ashraful Alam Shafi","E-Engineering Ltd.","E-Engineering","Project ENG","Operator","");
INSERT INTO inv_employee VALUES("114","ENG-000130","Md Ratul Hasan","E-Engineering Ltd.","E-Engineering","Project ENG","WINCH Operator","");
INSERT INTO inv_employee VALUES("115","ENG-000131","Md Shariful Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("116","ENG-000132","Md. Saiful Islam","E-Engineering Ltd.","E-Engineering","Dredging","Dredging Master","");
INSERT INTO inv_employee VALUES("117","ENG-000133","Md Amirul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Lever Man","");
INSERT INTO inv_employee VALUES("118","ENG-000135","Anich Mia","E-Engineering Ltd.","E-Engineering","Project ENG","Pipe Fitter","");
INSERT INTO inv_employee VALUES("119","ENG-000136","Md. Rasel Mia","E-Engineering Ltd.","E-Engineering","Project ENG","Pipe Fitter","");
INSERT INTO inv_employee VALUES("120","ENG-000137","Md. Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("121","ENG-000138","Abdullahil Kafi","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("122","ENG-000139","Md. Zulfikar Ali","E-Engineering Ltd.","E-Engineering","Project ENG","Site Supervisor","");
INSERT INTO inv_employee VALUES("123","ENG-000140","Md Jamal Hossen","E-Engineering Ltd.","E-Engineering","Project ENG","Sukani","");
INSERT INTO inv_employee VALUES("124","ENG-000141","Md Shihab Uddin","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("125","ENG-000143","Rob","E-Engineering Ltd.","E-Engineering","Project ENG","Crew","");
INSERT INTO inv_employee VALUES("126","ENG-000144","Ab Razzak Shaikh","E-Engineering Ltd.","E-Engineering","Project ENG","WINCH Operator","");
INSERT INTO inv_employee VALUES("127","ENG-000146","S.M Zakir Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Work Boat Master","");
INSERT INTO inv_employee VALUES("128","ENG-000147","Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Excavator Operator","");
INSERT INTO inv_employee VALUES("129","ENG-000148","Kazi Joynal Abedin Manir","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("130","ENG-000149","Md Mokter Sikder","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("131","ENG-000150","Md Ibrahim Khalil","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("132","ENG-000151","Md Abdur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("133","ENG-000152","Md. Jahangir Alam","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("134","ENG-000153","Md Nazrul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("135","ENG-000154","Shahinur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","WINCH Operator","");
INSERT INTO inv_employee VALUES("136","ENG-000155","Md. Rasel Molla","E-Engineering Ltd.","E-Engineering","Project ENG","Work Boat Master","");
INSERT INTO inv_employee VALUES("137","ENG-000156","Mohammad Rocnuzzaman","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("138","ENG-000157","Md Samsul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("139","ENG-000158","Md Monoarul Islam","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("140","ENG-000160","Nazmul","E-Engineering Ltd.","E-Engineering","Project ENG","Operator","");
INSERT INTO inv_employee VALUES("141","ENG-000161","Md. Humayun Kabir","E-Engineering Ltd.","E-Engineering","Dredging","Work Boat Master","");
INSERT INTO inv_employee VALUES("142","ENG-000162","Nasim Ahamed","E-Engineering Ltd.","E-Engineering","Project ENG","Electrician","");
INSERT INTO inv_employee VALUES("143","ENG-000163","Md Nazmul Islam Nazrul","E-Engineering Ltd.","E-Engineering","Dredging","Excavator Operator","");
INSERT INTO inv_employee VALUES("144","ENG-000164","Md Salim Reza","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("145","ENG-000166","Md. Mosle Uddin","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("146","ENG-000167","Tasnim Tarafder","E-Engineering Ltd.","E-Engineering","Management","Director","");
INSERT INTO inv_employee VALUES("147","ENG-000168","Md. Kamrul","E-Engineering Ltd.","E-Engineering","Project ENG","Senior Electrician","");
INSERT INTO inv_employee VALUES("148","ENG-000169","Md Dulal Pramanik","E-Engineering Ltd.","E-Engineering","Project ENG","Operator","");
INSERT INTO inv_employee VALUES("149","ENG-000170","Md Abdullah Al Zul Jabadan","E-Engineering Ltd.","E-Engineering","Administration","Officer","");
INSERT INTO inv_employee VALUES("150","ENG-000171","Md. Rubel Mia","E-Engineering Ltd.","E-Engineering","Dredging","Loskor","");
INSERT INTO inv_employee VALUES("151","ENG-000172","Md Sojib","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Fitter","");
INSERT INTO inv_employee VALUES("152","ENG-000173","Md Yousuf Zia","E-Engineering Ltd.","E-Engineering","Dredging","Operator","");
INSERT INTO inv_employee VALUES("153","ENG-000174","Md. Mayhedi Hasan","E-Engineering Ltd.","E-Engineering","Project ENG","Deputy Manager","");
INSERT INTO inv_employee VALUES("154","ENG-000175","Mohammad Ibrahim","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("155","ENG-000176","Md Rafiqul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Project Engineer","");
INSERT INTO inv_employee VALUES("156","ENG-000177","Bulbul Ahmed","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("157","ENG-000178","Md. Sakawat Hossan","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("158","ENG-000180","Md. Edris","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("159","ENG-000181","Md Saiful Islam","E-Engineering Ltd.","E-Engineering","Administration","Peon","");
INSERT INTO inv_employee VALUES("160","ENG-000184","Md Rubel Hossain","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("161","ENG-000186","Md Shofiqul Islam","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("162","ENG-000187","Nizam Uddin","E-Engineering Ltd.","E-Engineering","Dredging","Engine Driver","");
INSERT INTO inv_employee VALUES("163","ENG-000188","Md Ramiz Alam","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("164","ENG-000189","Md Khokan","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("165","ENG-000190","Md Ajmir Ahmed","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("166","ENG-000191","Md Lokman Hossen","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("167","ENG-000192","Md Sirajul Islam","E-Engineering Ltd.","E-Engineering","Engineering","Surveyor","");
INSERT INTO inv_employee VALUES("168","ENG-000193","Mohammad Abul Kasem","E-Engineering Ltd.","E-Engineering","Engineering","Site Engineer","");
INSERT INTO inv_employee VALUES("169","ENG-000194","Md Sabbir Hossain","E-Engineering Ltd.","E-Engineering","Engineering","Site Engineer","");
INSERT INTO inv_employee VALUES("170","ENG-000195","Md. Belal Hossain","E-Engineering Ltd.","E-Engineering","Engineering","Assistant Site Supervisor","");
INSERT INTO inv_employee VALUES("171","ENG-000196","Md. Abdul Lotif","E-Engineering Ltd.","E-Engineering","Engineering","Welder","");
INSERT INTO inv_employee VALUES("172","ENG-000197","Md Chan Miah","E-Engineering Ltd.","E-Engineering","Engineering","Welder","");
INSERT INTO inv_employee VALUES("173","ENG-000198","Mir Neyamul Kabir","E-Engineering Ltd.","E-Engineering","Engineering","Electrician","");
INSERT INTO inv_employee VALUES("174","ENG-000199","Md Mohidujjaman","E-Engineering Ltd.","E-Engineering","Engineering","Electrician","");
INSERT INTO inv_employee VALUES("175","ENG-000200","Sumon","E-Engineering Ltd.","E-Engineering","Engineering","Welder","");
INSERT INTO inv_employee VALUES("176","ENG-000201","Md Abdul Motin","E-Engineering Ltd.","E-Engineering","Engineering","Electrician","");
INSERT INTO inv_employee VALUES("177","ENG-000202","Nepur Chandra Debonath","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("178","ENG-000203","Md. Azmol Hossain Sheikh","E-Engineering Ltd.","E-Engineering","Engineering","Electrician","");
INSERT INTO inv_employee VALUES("179","ENG-000204","A K M Saifullah","E-Engineering Ltd.","E-Engineering","Engineering","Project Manager","");
INSERT INTO inv_employee VALUES("180","ENG-000205","Md Ahsan Moner","E-Engineering Ltd.","E-Engineering","Engineering","Site Engineer","");
INSERT INTO inv_employee VALUES("181","ENG-000206","Hascebul Hassan Sabuj","E-Engineering Ltd.","E-Engineering","Project ENG","Storeman","");
INSERT INTO inv_employee VALUES("182","ENG-000207","Krishna Gopal Mollick","E-Engineering Ltd.","E-Engineering","Project ENG","Electrician","");
INSERT INTO inv_employee VALUES("183","ENG-000208","Abul Bashar","E-Engineering Ltd.","E-Engineering","Engineering","Electrician","");
INSERT INTO inv_employee VALUES("184","ENG-000209","Md Zahurul Islam","E-Engineering Ltd.","E-Engineering","Engineering","Site Engineer","");
INSERT INTO inv_employee VALUES("185","ENG-000210","Md Tapu Miah","E-Engineering Ltd.","E-Engineering","Engineering","Storeman","");
INSERT INTO inv_employee VALUES("186","ENG-000211","Md Shafiqul Alam Meraj","E-Engineering Ltd.","E-Engineering","Engineering","Site Engineer","");
INSERT INTO inv_employee VALUES("187","ENG-000212","Rana Sarker","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Engine Mechanic","");
INSERT INTO inv_employee VALUES("188","ENG-000213","Md Humayun Kabir","E-Engineering Ltd.","E-Engineering","Administration","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("189","ENG-000214","Md Khokon Shek","E-Engineering Ltd.","E-Engineering","Project ENG","Storeman","");
INSERT INTO inv_employee VALUES("190","ENG-000215","Md Rashed Hasan","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("191","ENG-000216","Md Nanno Mia","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("192","ENG-000217","Mehadi Hasan","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("193","ENG-000218","Md Al Amin Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("194","ENG-000219","Md Mashum Hashan","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("195","ENG-000220","Khalilur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("196","ENG-000221","Md Siful Islam Rubel","E-Engineering Ltd.","E-Engineering","Project ENG","Storeman","");
INSERT INTO inv_employee VALUES("197","ENG-000222","Md Tahubar Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("198","ENG-000223","Md Golam Mostafa","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("199","ENG-000224","Md. Ziaur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Lab Techinacian","");
INSERT INTO inv_employee VALUES("200","ENG-000225","Md. Amir Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Excavator Operator","");
INSERT INTO inv_employee VALUES("201","ENG-000226","Md. Hasan Tareq","E-Engineering Ltd.","E-Engineering","Project ENG","Deputy Manager","");
INSERT INTO inv_employee VALUES("202","ENG-000227","Md. Shoharabul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Project Manager","");
INSERT INTO inv_employee VALUES("203","ENG-000228","Md Abu Kawsar","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("204","ENG-000229","Md Ziaul Alam Bhuiyan","E-Engineering Ltd.","E-Engineering","Administration","Executive","");
INSERT INTO inv_employee VALUES("205","ENG-000230","Md Farhad Kazi","E-Engineering Ltd.","E-Engineering","Project ENG","Crew","");
INSERT INTO inv_employee VALUES("206","ENG-000231","Md Sayadur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("207","ENG-000232","Md Zahidul Haque","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Hydraulic Mechanic","");
INSERT INTO inv_employee VALUES("208","ENG-000233","Kazi Md Arman Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Supervisor","");
INSERT INTO inv_employee VALUES("209","ENG-000234","Md Asraful Islam Rony","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("210","ENG-000235","Md Kajol","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("211","ENG-000236","Ahsan Ullah Chowdhury","E-Engineering Ltd.","E-Engineering","Administration","Deputy Manager","");
INSERT INTO inv_employee VALUES("212","ENG-000237","Md Majedul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Site Supervisor","");
INSERT INTO inv_employee VALUES("213","ENG-000238","Meer Kamrul Hassan","E-Engineering Ltd.","E-Engineering","Project ENG","Lab Techinacian","");
INSERT INTO inv_employee VALUES("214","ENG-000239","Md Ariful Islam","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("215","ENG-000240","Biplob Devnath","E-Engineering Ltd.","E-Engineering","Project ENG","Project Manager","");
INSERT INTO inv_employee VALUES("216","ENG-000241","Md Rasel Sheikh","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Engine Mechanic","");
INSERT INTO inv_employee VALUES("217","ENG-000242","Md Insar Ali","E-Engineering Ltd.","E-Engineering","Project ENG","Welder","");
INSERT INTO inv_employee VALUES("218","ENG-000243","Md Pannu Mia","E-Engineering Ltd.","E-Engineering","Project ENG","Storeman","");
INSERT INTO inv_employee VALUES("219","ENG-000244","Md Nuor Khan","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Engineer","");
INSERT INTO inv_employee VALUES("220","ENG-000245","Md Shah Alam Mazumder","E-Engineering Ltd.","E-Engineering","Project ENG","Site Supervisor","");
INSERT INTO inv_employee VALUES("221","ENG-000246","Md Akter Hossen","E-Engineering Ltd.","E-Engineering","Project ENG","Deputy Manager","");
INSERT INTO inv_employee VALUES("222","ENG-000247","Md Mostafijur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Manager","");
INSERT INTO inv_employee VALUES("223","ENG-000248","Belal Hossain","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("224","ENG-000249","Delawar Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Site Assistant","");
INSERT INTO inv_employee VALUES("225","ENG-000250","Md Ferdous Khan","E-Engineering Ltd.","E-Engineering","Project ENG","Manager","");
INSERT INTO inv_employee VALUES("226","ENG-000251","Md Abu Taleb Molla","E-Engineering Ltd.","E-Engineering","Maintenance","Operator","");
INSERT INTO inv_employee VALUES("227","ENG-000252","Ibrahim","E-Engineering Ltd.","E-Engineering","Engineering","Driver","");
INSERT INTO inv_employee VALUES("228","ENG-000253","Md Abdul Halim Sarkar","E-Engineering Ltd.","E-Engineering","Engineering","Admin Assistant","");
INSERT INTO inv_employee VALUES("229","ENG-000254","Md Mostofa","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("230","ENG-000255","Md Sakender Ali","E-Engineering Ltd.","E-Engineering","Maintenance","Director","");
INSERT INTO inv_employee VALUES("231","ENG-000256","Md Mashfiqur Rahman","E-Engineering Ltd.","E-Engineering","Administration","Assistant General Manager","");
INSERT INTO inv_employee VALUES("232","ENG-000257","Alauddin Ahmed","E-Engineering Ltd.","E-Engineering","Maintenance","General Manager","");
INSERT INTO inv_employee VALUES("233","ENG-000258","Md Abdur Razzaque","E-Engineering Ltd.","E-Engineering","Engineering","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("234","ENG-000259","Md Momin Ali","E-Engineering Ltd.","E-Engineering","Project ENG","Operator","");
INSERT INTO inv_employee VALUES("235","ENG-000260","Feroz Khan","E-Engineering Ltd.","E-Engineering","Operation","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("236","ENG-000261","Mohammad Easin Maraj","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("237","ENG-000262","Md Raton Ali Molla","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("238","ENG-000263","Md Harun","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("239","ENG-000264","Md Abul Khalek","E-Engineering Ltd.","E-Engineering","Dredging","Work Boat Engine Driver","");
INSERT INTO inv_employee VALUES("240","ENG-000265","Mohammod Khairul Alam","E-Engineering Ltd.","E-Engineering","Maintenance","Batching Plant Operator","");
INSERT INTO inv_employee VALUES("241","ENG-000266","Md Humayun Kabir","E-Engineering Ltd.","E-Engineering","Project ENG","Project Engineer","");
INSERT INTO inv_employee VALUES("242","ENG-000267","Mohammad Homayun Kabir","E-Engineering Ltd.","E-Engineering","Project ENG","Project Engineer","");
INSERT INTO inv_employee VALUES("243","ENG-000268","Md Nuruzzaman Khan","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("244","ENG-000269","Md Ariful Islam","E-Engineering Ltd.","E-Engineering","QMS","Officer","");
INSERT INTO inv_employee VALUES("245","ENG-000270","Md Ferdous Rahman","E-Engineering Ltd.","E-Engineering","QMS","Officer","");
INSERT INTO inv_employee VALUES("246","ENG-000271","Manik Kumer Ghosh","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("247","ENG-000272","Md Faruk Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("248","ENG-000273","Abdul Hadi","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("249","ENG-000274","Md Ashiq Ali","E-Engineering Ltd.","E-Engineering","Project ENG","Deputy Project Manager","");
INSERT INTO inv_employee VALUES("250","ENG-000275","Sujoy Das","E-Engineering Ltd.","E-Engineering","Project ENG","Project Engineer","");
INSERT INTO inv_employee VALUES("251","ENG-000276","S M Hasinur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("252","ENG-000277","Md Sanaullah Sakib","E-Engineering Ltd.","E-Engineering","Dredging","Site Engineer","");
INSERT INTO inv_employee VALUES("253","ENG-000278","Md Abdur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("254","ENG-000279","Md Abdur Rouf","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("255","ENG-000280","Md Sultan Miah","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("256","ENG-000281","Mohammad Ashraful Miah","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("257","ENG-000282","Md Kuddus Ali","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("258","ENG-000283","Md Lokman Ahmed","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("259","ENG-000284","A K M Ferdous Alam","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("260","ENG-000285","Mohammad Mahmudur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Deputy General Manager","");
INSERT INTO inv_employee VALUES("261","ENG-000286","Md Arifur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("262","ENG-000287","Md Josim","E-Engineering Ltd.","E-Engineering","Dredging","Loskor","");
INSERT INTO inv_employee VALUES("263","ENG-000288","Md Mehedi Hasan Akash","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("264","ENG-000289","Md Abdul halim","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("265","ENG-000290","Md. Shariful Molla","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("266","ENG-000291","Md Yousuf Hosain","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("267","ENG-000292","Md Faisal Ahamed Arafat","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("268","ENG-000293","Md Amin Biswas","E-Engineering Ltd.","E-Engineering","Project ENG","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("269","ENG-000294","Saidul Islam Rezve","E-Engineering Ltd.","E-Engineering","Project ENG","Senior Manager","");
INSERT INTO inv_employee VALUES("270","ENG-000295","Md Mizanur Jomaddar","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("271","ENG-000296","Md Saddam Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("272","ENG-000297","Md Masud Rana","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("273","ENG-000298","Md. Josinur Rahman","E-Engineering Ltd.","E-Engineering","Dredging","Loskor","");
INSERT INTO inv_employee VALUES("274","ENG-000299","Md. Sagar Khan","E-Engineering Ltd.","E-Engineering","Dredging","Cook Helper","");
INSERT INTO inv_employee VALUES("275","ENG-000300","Md Mohidul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("276","ENG-000301","SK Sahin","E-Engineering Ltd.","E-Engineering","Dredging","Loskor","");
INSERT INTO inv_employee VALUES("277","ENG-000302","Md. Rabbi Sheikh","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("278","ENG-000303","Md Jalal Uddin","E-Engineering Ltd.","E-Engineering","Engineering","Operator","");
INSERT INTO inv_employee VALUES("279","ENG-000304","Maksudul Motin","E-Engineering Ltd.","E-Engineering","Project ENG","Officer","");
INSERT INTO inv_employee VALUES("280","ENG-000305","Mohammad Mukter Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Officer","");
INSERT INTO inv_employee VALUES("281","ENG-000306","Syful Islam","E-Engineering Ltd.","E-Engineering","Dredging","Sukani","");
INSERT INTO inv_employee VALUES("282","ENG-000307","Mohammad Asaduzzaman Iqbal","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("283","ENG-000308","Bidduth Ray","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("284","ENG-000309","Md. Saidur Rahaman","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("285","ENG-000310","Md. Shariful Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("286","ENG-000311","Mukter Hossen","E-Engineering Ltd.","E-Engineering","Project ENG","Supervisor","");
INSERT INTO inv_employee VALUES("287","ENG-000312","Md. Nazrul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("288","ENG-000313","Rubel Ahmed","E-Engineering Ltd.","E-Engineering","Project ENG","Surveyor","");
INSERT INTO inv_employee VALUES("289","ENG-000314","M.A Shafiqur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("290","ENG-000315","Md. Nurul Islam","E-Engineering Ltd.","E-Engineering","Engineering","Site Engineer","");
INSERT INTO inv_employee VALUES("291","ENG-000316","Kamrul Hasan","E-Engineering Ltd.","E-Engineering","Engineering","Site Engineer","");
INSERT INTO inv_employee VALUES("292","ENG-000317","Kamol Krishna","E-Engineering Ltd.","E-Engineering","Dredging","Surveyor","");
INSERT INTO inv_employee VALUES("293","ENG-000318","Md Tufan Ahmmad","E-Engineering Ltd.","E-Engineering","Project ENG","Roller Operator","");
INSERT INTO inv_employee VALUES("294","ENG-000319","Md Bipul Mia","E-Engineering Ltd.","E-Engineering","Project ENG","Driver","");
INSERT INTO inv_employee VALUES("295","ENG-000320","Md Jownal Abdin","E-Engineering Ltd.","E-Engineering","Project ENG","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("296","ENG-000321","Md Nazrul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Mixer Truck Driver","");
INSERT INTO inv_employee VALUES("297","ENG-000322","Md Iqbal Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Prime Mover Driver","");
INSERT INTO inv_employee VALUES("298","ENG-000323","Muntaz Ali","E-Engineering Ltd.","E-Engineering","Project ENG","Driver","");
INSERT INTO inv_employee VALUES("299","ENG-000324","Md Selim Reza","E-Engineering Ltd.","E-Engineering","Project ENG","Operator","");
INSERT INTO inv_employee VALUES("300","ENG-000325","Md Hassan","E-Engineering Ltd.","E-Engineering","Maintenance","Excavator Operator","");
INSERT INTO inv_employee VALUES("301","ENG-000326","Md. Waliullah","E-Engineering Ltd.","E-Engineering","Administration","Officer","");
INSERT INTO inv_employee VALUES("302","ENG-000327","Md Nuruzzaman Shahed","E-Engineering Ltd.","E-Engineering","Engineering","Site Engineer","");
INSERT INTO inv_employee VALUES("303","ENG-000328","Md Abdullah Al Mostain","E-Engineering Ltd.","E-Engineering","Project ENG","Deputy Project Manager","");
INSERT INTO inv_employee VALUES("304","ENG-000329","Anowar Shikder","E-Engineering Ltd.","E-Engineering","Project ENG","Operator","");
INSERT INTO inv_employee VALUES("305","ENG-000330","Mahbub Ahmed","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Assistant General Manager","");
INSERT INTO inv_employee VALUES("306","ENG-000331","Md Mainul Islam","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("307","ENG-000332","Mohan Miah","E-Engineering Ltd.","E-Engineering","Project ENG","Excavator Operator","");
INSERT INTO inv_employee VALUES("308","ENG-000333","Md Tanbir Ahamed Bablu","E-Engineering Ltd.","E-Engineering","QMS","Executive","");
INSERT INTO inv_employee VALUES("309","ENG-000334","Abdul Hakim (Lal Mia)","E-Engineering Ltd.","E-Engineering","Project ENG","Electrician","");
INSERT INTO inv_employee VALUES("310","ENG-000335","Fahim Montasir","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("311","ENG-000336","Md Abdul Jabbar","E-Engineering Ltd.","E-Engineering","Dredging","Senior Manager","");
INSERT INTO inv_employee VALUES("312","ENG-000337","Md Al-Amin","E-Engineering Ltd.","E-Engineering","Project ENG","Site Engineer","");
INSERT INTO inv_employee VALUES("313","ENG-000338","Md Al Helal","E-Engineering Ltd.","E-Engineering","Project ENG","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("314","ENG-000339","Md Habibur Rahaman","E-Engineering Ltd.","E-Engineering","Maintenance","Mixer Truck Driver","");
INSERT INTO inv_employee VALUES("315","ENG-000340","Md Lal Miaha","E-Engineering Ltd.","E-Engineering","Project ENG","Operator","");
INSERT INTO inv_employee VALUES("316","ENG-000341","Md Liton Howladar","E-Engineering Ltd.","E-Engineering","Maintenance","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("317","ENG-000342","Md. Alauddin","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("318","ENG-000343","Md Washim Hossain","E-Engineering Ltd.","E-Engineering","Project ENG","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("319","ENG-000344","Md Hafiz Uddin","E-Engineering Ltd.","E-Engineering","Project ENG","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("320","ENG-000345","Md Jain Uddin","E-Engineering Ltd.","E-Engineering","Project ENG","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("321","ENG-000346","Md Jahirul Hoque","E-Engineering Ltd.","E-Engineering","Project ENG","Excavator Operator","");
INSERT INTO inv_employee VALUES("322","ENG-000347","Md Lanzu Shardar","E-Engineering Ltd.","E-Engineering","Maintenance","Operator","");
INSERT INTO inv_employee VALUES("323","ENG-000348","Md Joherul Islam","E-Engineering Ltd.","E-Engineering","Business Development","Officer","");
INSERT INTO inv_employee VALUES("324","ENG-000349","Md Ripon","E-Engineering Ltd.","E-Engineering","Maintenance","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("325","ENG-000350","Mir Aslam","E-Engineering Ltd.","E-Engineering","Project ENG","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("326","ENG-000351","Md Ariful Islam","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("327","ENG-000352","Md Hassan","E-Engineering Ltd.","E-Engineering","Project ENG","Excavator Operator","");
INSERT INTO inv_employee VALUES("328","ENG-000353","Mosaref Hossain","E-Engineering Ltd.","E-Engineering","Maintenance","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("329","ENG-000354","Md Jewel Sheikh","E-Engineering Ltd.","E-Engineering","Maintenance","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("330","ENG-000355","Anuwar Hossain","E-Engineering Ltd.","E-Engineering","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("331","ENG-000356","Md Babul Sarder","E-Engineering Ltd.","E-Engineering","Maintenance","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("332","ENG-000357","Md Idris Khan","E-Engineering Ltd.","E-Engineering","Maintenance","Mechanic","");
INSERT INTO inv_employee VALUES("333","ENG-000358","Gazi Ismail Hossain","E-Engineering Ltd.","E-Engineering","Maintenance","Mechanic","");
INSERT INTO inv_employee VALUES("334","ENG-000359","Md Rafikul Islam","E-Engineering Ltd.","E-Engineering","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("335","ENG-000360","Md Golam Rosul","E-Engineering Ltd.","E-Engineering","Maintenance","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("336","ENG-000361","Md Main Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("337","ENG-000362","Md Shaheb Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Batching Plant Helper","");
INSERT INTO inv_employee VALUES("338","ENG-000363","Md. Jalil Khan Noyan","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Manager","");
INSERT INTO inv_employee VALUES("339","ENG-000364","Md. Billal Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("340","ENG-000365","Shaid Sheik","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("341","ENG-000366","Md. Hasibul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("342","ENG-000367","Habibur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("343","ENG-000368","Tofayel Ahmed","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("344","ENG-000369","Siddique Shek","E-Engineering Ltd.","E-Engineering","Maintenance","Operator","");
INSERT INTO inv_employee VALUES("345","ENG-000370","Md Abdur Rahman","E-Engineering Ltd.","E-Engineering","Maintenance","Prime Mover Driver","");
INSERT INTO inv_employee VALUES("346","ENG-000371","Md Mahabur Rahman","E-Engineering Ltd.","E-Engineering","Maintenance","Excavator Operator","");
INSERT INTO inv_employee VALUES("347","ENG-000372","Kazi Raju Ahammad","E-Engineering Ltd.","E-Engineering","Maintenance","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("348","ENG-000373","Zia Uddin","E-Engineering Ltd.","E-Engineering","QMS","Assistant Manager","");
INSERT INTO inv_employee VALUES("349","ENG-000374","Md Saidur Rahman Sawon","E-Engineering Ltd.","E-Engineering","Maintenance","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("350","ENG-000375","Md Monirul Islam Sikder","E-Engineering Ltd.","E-Engineering","Dredging","General Manager","");
INSERT INTO inv_employee VALUES("351","ENG-000376","Alamin Sheikh","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Fitter","");
INSERT INTO inv_employee VALUES("352","ENG-000377","Md Arif Hosen","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Fitter","");
INSERT INTO inv_employee VALUES("353","ENG-000378","Mostafizur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Crane Operator","");
INSERT INTO inv_employee VALUES("354","ENG-000379","Md. Raju","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("355","ENG-000380","Nafiur Rahman  ","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("356","ENG-000381","Md. Rabiul Islam","E-Engineering Ltd.","E-Engineering","Civil","Deputy Project Manager","");
INSERT INTO inv_employee VALUES("357","ENG-000382","Md. Mahfuzur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Electrician","");
INSERT INTO inv_employee VALUES("358","ENG-000383","Md. Nasibul Sheike","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("359","ENG-000384","Md. Shamim","E-Engineering Ltd.","E-Engineering","Mechanical","Dozzer Operator","");
INSERT INTO inv_employee VALUES("360","ENG-000385","Md. Taleb","E-Engineering Ltd.","E-Engineering","Mechanical","Concrete Pump Operator","");
INSERT INTO inv_employee VALUES("361","ENG-000386","Sahidul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Pipe Fitter","");
INSERT INTO inv_employee VALUES("362","ENG-000387","Md. Riaz","E-Engineering Ltd.","E-Engineering","Mechanical","Pipe Fitter","");
INSERT INTO inv_employee VALUES("363","ENG-000388","Md. Nuruzzaman","E-Engineering Ltd.","E-Engineering","Mechanical","Pipe Fitter","");
INSERT INTO inv_employee VALUES("364","ENG-000389","Md. Bashir Alom","E-Engineering Ltd.","E-Engineering","Mechanical","Pipe Fitter","");
INSERT INTO inv_employee VALUES("365","ENG-000390","Md. Abu Hanif","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Rigger","");
INSERT INTO inv_employee VALUES("366","ENG-000391","Md. Mokles Akndo","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Rigger","");
INSERT INTO inv_employee VALUES("367","ENG-000392","Bilas Biswas","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Rigger","");
INSERT INTO inv_employee VALUES("368","ENG-000393","Md. Abul Kalam Azad","E-Engineering Ltd.","E-Engineering","Mechanical","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("369","ENG-000394","Md. Imran Molla","E-Engineering Ltd.","E-Engineering","Mechanical","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("370","ENG-000395","Md. Rubel","E-Engineering Ltd.","E-Engineering","Mechanical","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("371","ENG-000396","Md. Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Batching Plant Helper","");
INSERT INTO inv_employee VALUES("372","ENG-000397","Md. Wahiduzzaman","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("373","ENG-000398","Md. Motiar Rahman","E-Engineering Ltd.","E-Engineering","Commercial","Executive","");
INSERT INTO inv_employee VALUES("374","ENG-000399","S. M. Borhan Uddin","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("375","ENG-000400","Md. Ahasan","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("376","ENG-000401","Kleanton Sarker","E-Engineering Ltd.","E-Engineering","Mechanical","Block Machine Operator","");
INSERT INTO inv_employee VALUES("377","ENG-000402","Md Monir Hossain","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("378","ENG-000403","Md. Sahabuddin","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("379","ENG-000404","Sarowar Alam","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("380","ENG-000405","Md. Shamim","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("381","ENG-000406","Anowar Hossen","E-Engineering Ltd.","E-Engineering","Mechanical","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("382","ENG-000407","Shahid Ullah","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("383","ENG-000408","Md. Tariqul Islam","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("384","ENG-000409","Md. Ayub Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Plant Engineer","");
INSERT INTO inv_employee VALUES("385","ENG-000410","Md. Mahedi Hasan (Roton)","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("386","ENG-000411","Md. Shafik","E-Engineering Ltd.","E-Engineering","Mechanical","Diesel Hammer Operator","");
INSERT INTO inv_employee VALUES("387","ENG-000412","Md. Farhad Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Crane Operator","");
INSERT INTO inv_employee VALUES("388","ENG-000413","Md. Saiful","E-Engineering Ltd.","E-Engineering","Mechanical","Concrete Pump Pipe Fitter","");
INSERT INTO inv_employee VALUES("389","ENG-000414","Md. Manirul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Concrete Pump Pipe Fitter","");
INSERT INTO inv_employee VALUES("390","ENG-000415","Md. Sabuj Sheikh","E-Engineering Ltd.","E-Engineering","Mechanical","Concrete Pump Pipe Fitter","");
INSERT INTO inv_employee VALUES("391","ENG-000416","Md. Nasir Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Concrete Pump Operator","");
INSERT INTO inv_employee VALUES("392","ENG-000417","Md Sajidur Rahman Sayed","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("393","ENG-000418","Md. Imran Hossain","E-Engineering Ltd.","E-Engineering","Store","Officer","");
INSERT INTO inv_employee VALUES("394","ENG-000419","Md. Main Uddin ","E-Engineering Ltd.","E-Engineering","Mechanical","Long Boom Excavator Operator","");
INSERT INTO inv_employee VALUES("395","ENG-000420","Md. Jamal Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Long Boom Excavator Operator","");
INSERT INTO inv_employee VALUES("396","ENG-000421","Md. Rafiqul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("397","ENG-000422","Md. Bellal Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Mixture Truck Helper","");
INSERT INTO inv_employee VALUES("398","ENG-000423","Md. Belal Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Low Bed Helper","");
INSERT INTO inv_employee VALUES("399","ENG-000424","Md. Aminul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Low Bed Helper","");
INSERT INTO inv_employee VALUES("400","ENG-000425","Md. Bablu Molla","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("401","ENG-000426","Md. Shojon Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanical Helper","");
INSERT INTO inv_employee VALUES("402","ENG-000427","Md. Tanvir Hossain","E-Engineering Ltd.","E-Engineering","QMS","Executive","");
INSERT INTO inv_employee VALUES("403","ENG-000428","Md. Khaokon Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Low Bed Operator","");
INSERT INTO inv_employee VALUES("404","ENG-000429","Md Rakib Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Junior Fitter","");
INSERT INTO inv_employee VALUES("405","ENG-000430","Syed Ahammad","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanic","");
INSERT INTO inv_employee VALUES("406","ENG-000431","Md. Liton Mridha","E-Engineering Ltd.","E-Engineering","Mechanical","Site Mechanical Engineer","");
INSERT INTO inv_employee VALUES("407","ENG-000432","Md Shamim Ul Momin","E-Engineering Ltd.","E-Engineering","Civil","Quantity Surveyor Engineer","");
INSERT INTO inv_employee VALUES("408","ENG-000433","Estaque Ahamed","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("409","ENG-000434","Sazzad Zaman Anik","E-Engineering Ltd.","E-Engineering","QMS","Executive","");
INSERT INTO inv_employee VALUES("410","ENG-000435","Ebrahim Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Roller Operator","");
INSERT INTO inv_employee VALUES("411","ENG-000436","Md Bachchu Shaik","E-Engineering Ltd.","E-Engineering","Mechanical","Backhoe Operator","");
INSERT INTO inv_employee VALUES("412","ENG-000437","Md Litan Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("413","ENG-000438","Md Kamal","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("414","ENG-000439","Md. Masum Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("415","ENG-000440","Md Nazmul Huda Bhola","E-Engineering Ltd.","E-Engineering","Mechanical","Backhoe Operator","");
INSERT INTO inv_employee VALUES("416","ENG-000441","Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Backhoe Operator","");
INSERT INTO inv_employee VALUES("417","ENG-000442","Md Shahidul Islam Jamal","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("418","ENG-000443","Md Shariful Mia Shipon","E-Engineering Ltd.","E-Engineering","Administration","Peon","");
INSERT INTO inv_employee VALUES("419","ENG-000444","Md Nurul Islam","E-Engineering Ltd.","E-Engineering","Civil","Mechanic","");
INSERT INTO inv_employee VALUES("420","ENG-000445","Md Hanif Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("421","ENG-000446","Sanaton Chandra Shil","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("422","ENG-000447","Shafiqul Mollah","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("423","ENG-000448","Md Abdul Hamid","E-Engineering Ltd.","E-Engineering","QMS","Senior Officer","");
INSERT INTO inv_employee VALUES("424","ENG-000449","Md Manik Sikder","E-Engineering Ltd.","E-Engineering","Dredging","Senior Officer","");
INSERT INTO inv_employee VALUES("425","ENG-000450","Md Shazzadul Hasan Talukder","E-Engineering Ltd.","E-Engineering","QMS","Senior Officer","");
INSERT INTO inv_employee VALUES("426","ENG-000451","Boshir Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("427","ENG-000452","Naharendu Majumder","E-Engineering Ltd.","E-Engineering","Mechanical","Manager","");
INSERT INTO inv_employee VALUES("428","ENG-000453","Md Shahin Akter","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Engineer","");
INSERT INTO inv_employee VALUES("429","ENG-000454","Md Babul Hossain","E-Engineering Ltd.","E-Engineering","Dredging","Surveyor","");
INSERT INTO inv_employee VALUES("430","ENG-000455","Md Mamunul Hasan","E-Engineering Ltd.","E-Engineering","Civil","Store Keeper","");
INSERT INTO inv_employee VALUES("431","ENG-000456","Md Shah Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Mixture Truck Helper","");
INSERT INTO inv_employee VALUES("432","ENG-000457","Md Tarikul Islam","E-Engineering Ltd.","E-Engineering","Civil","Assistant Lab Technician","");
INSERT INTO inv_employee VALUES("433","ENG-000458","Mohammad Ali Akber","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("434","ENG-000459","Md Ashraful Alam","E-Engineering Ltd.","E-Engineering","Civil","Project Engineer","");
INSERT INTO inv_employee VALUES("435","ENG-000460","Md Azizul Haque","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("436","ENG-000461","Md Saddam Hosen","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("437","ENG-000462","Md Shah Alam","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("438","ENG-000463","Mohammad Ali","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("439","ENG-000464","Md Shohag","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("440","ENG-000465","Md Nur Mohammad","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanic","");
INSERT INTO inv_employee VALUES("441","ENG-000466","Ripon","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("442","ENG-000467","Md Fazlul Haque","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("443","ENG-000468","Md Nuru Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("444","ENG-000469","Shyama  Proshad Sarker","E-Engineering Ltd.","E-Engineering","Civil","Assistant Lab Technician","");
INSERT INTO inv_employee VALUES("445","ENG-000470","Md Ruhul Amin","E-Engineering Ltd.","E-Engineering","Mechanical","Crane Operator","");
INSERT INTO inv_employee VALUES("446","ENG-000471","Kalyan Chandra Sharma","E-Engineering Ltd.","E-Engineering","Civil","Senior Project Manager","");
INSERT INTO inv_employee VALUES("447","ENG-000472","Md Nabiruzzaman","E-Engineering Ltd.","E-Engineering","Civil","Project Manager","");
INSERT INTO inv_employee VALUES("448","ENG-000473","Syed Hassan Mashruq","E-Engineering Ltd.","E-Engineering","Civil","Project Co-Ordinator","");
INSERT INTO inv_employee VALUES("449","ENG-000474","Md Mokhlesur Rahman","E-Engineering Ltd.","E-Engineering","Civil","Deputy Project Manager","");
INSERT INTO inv_employee VALUES("450","ENG-000475","Md  Salahuddin Azad","E-Engineering Ltd.","E-Engineering","Civil","Deputy Project Manager","");
INSERT INTO inv_employee VALUES("451","ENG-000476","Md Mahmudun Nabi","E-Engineering Ltd.","E-Engineering","QMS","Trainee Officer","");
INSERT INTO inv_employee VALUES("452","ENG-000477","Md Sohel Akhand","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("453","ENG-000478","Tapaus Chandra Pal","E-Engineering Ltd.","E-Engineering","Civil","Surveyor","");
INSERT INTO inv_employee VALUES("454","ENG-000479","Md Sohel Munshi","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("455","ENG-000480","Md Monirul Islam Manik","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("456","ENG-000481","Md Motleb Hassan","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("457","ENG-000482","Md Atikur Rahman","E-Engineering Ltd.","E-Engineering","Administration","Officer","");
INSERT INTO inv_employee VALUES("458","ENG-000483","Hakim Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Rigger","");
INSERT INTO inv_employee VALUES("459","ENG-000484","Md Moshiur Rahman","E-Engineering Ltd.","E-Engineering","Civil","Plant Operator","");
INSERT INTO inv_employee VALUES("460","ENG-000485","Dipak Kuamr Roy","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("461","ENG-000486","Ariful Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("462","ENG-000487","Romen Chandra Paul","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("463","ENG-000488","Md Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("464","ENG-000489","Md Morad Hossen","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("465","ENG-000490","Shahidul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Backhoe Operator","");
INSERT INTO inv_employee VALUES("466","ENG-000491","Md Abul Hasan","E-Engineering Ltd.","E-Engineering","Dredging","Lever Man","");
INSERT INTO inv_employee VALUES("467","ENG-000492","Md Rashedul Hasan","E-Engineering Ltd.","E-Engineering","Administration","Senior Officer","");
INSERT INTO inv_employee VALUES("468","ENG-000493","Mohammad Mokim Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("469","ENG-000494","Md Delshad Hossain","E-Engineering Ltd.","E-Engineering","Civil","Junior Surveyor","");
INSERT INTO inv_employee VALUES("470","ENG-000495","Rayhan Sajal","E-Engineering Ltd.","E-Engineering","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("471","ENG-000496","Md Motiur Rahman","E-Engineering Ltd.","E-Engineering","Civil","Surveyor Helper","");
INSERT INTO inv_employee VALUES("472","ENG-000497","Md Abdu Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("473","ENG-000498","Abdul Malek","E-Engineering Ltd.","E-Engineering","Civil","Surveyor Helper","");
INSERT INTO inv_employee VALUES("474","ENG-000499","Md Kamal Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("475","ENG-000500","lftekhar Hosen Nayeem","E-Engineering Ltd.","E-Engineering","Marine","Assistant Manager","");
INSERT INTO inv_employee VALUES("476","ENG-000501","Md Sumon Shekh","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanical Helper","");
INSERT INTO inv_employee VALUES("477","ENG-000502","Md ldbar Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("478","ENG-000503","Md Shamem","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("479","ENG-000504","Md Fotiq Miah","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("480","ENG-000505","Md. Rubel Hossain","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("481","ENG-000506","Masud Rana","E-Engineering Ltd.","E-Engineering","Civil","Lab Techinacian","");
INSERT INTO inv_employee VALUES("482","ENG-000507","Shohel Rana","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("483","ENG-000508","Md Nazmul Haque","E-Engineering Ltd.","E-Engineering","Store","Storeman","");
INSERT INTO inv_employee VALUES("484","ENG-000509","Dilip Chandra Das","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("485","ENG-000510","Md Ashraf Uddin","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("486","ENG-000511","Md Abdul Hamid","E-Engineering Ltd.","E-Engineering","Administration","Store Helper","");
INSERT INTO inv_employee VALUES("487","ENG-000512","Shahidul Islam","E-Engineering Ltd.","E-Engineering","Civil","Assistant QS Engineer","");
INSERT INTO inv_employee VALUES("488","ENG-000513","Morad Hassan Shimul","E-Engineering Ltd.","E-Engineering","Store","Assistant","");
INSERT INTO inv_employee VALUES("489","ENG-000514","Md Saidul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Sub Assistant Engineer","");
INSERT INTO inv_employee VALUES("490","ENG-000515","Mehdi Sultan Akhand","E-Engineering Ltd.","E-Engineering","Mechanical","Junior Engineer","");
INSERT INTO inv_employee VALUES("491","ENG-000516","Md Sharif Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Deputy Project Manager","");
INSERT INTO inv_employee VALUES("492","ENG-000517","Md Ibrahim Kazi","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("493","ENG-000518","Md Sultan Mahmud","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("494","ENG-000519","Md Riazul Zannat","E-Engineering Ltd.","E-Engineering","Civil","Lab Techinacian","");
INSERT INTO inv_employee VALUES("495","ENG-000520","Md Limon","E-Engineering Ltd.","E-Engineering","Store","Assistant","");
INSERT INTO inv_employee VALUES("496","ENG-000521","Md Moniruzzamn","E-Engineering Ltd.","E-Engineering","Civil","Helper","");
INSERT INTO inv_employee VALUES("497","ENG-000522","Md Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Manager","");
INSERT INTO inv_employee VALUES("498","ENG-000523","Md Tipu Sultan","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("499","ENG-000524","Md Al Amin","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("500","ENG-000525","Amirul Islam","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("501","ENG-000526","Parvez Mazumder","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("502","ENG-000527","Shaddam Hossain","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("503","ENG-000528","Md Abdul Malek","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("504","ENG-000529","Habibullah  Bahar","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("505","ENG-000530","Sohan Mollick","E-Engineering Ltd.","E-Engineering","Mechanical","Auto Electrician","");
INSERT INTO inv_employee VALUES("506","ENG-000531","Md Rubel","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanical Helper","");
INSERT INTO inv_employee VALUES("507","ENG-000532","Md Forhad Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("508","ENG-000533","Sheikh Alauddin","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("509","ENG-000534","Md Iliyas Ahmed","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("510","ENG-000535","Raju Ahmed","E-Engineering Ltd.","E-Engineering","Civil","Electrician","");
INSERT INTO inv_employee VALUES("511","ENG-000536","Md Mahamud Ullah","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("512","ENG-000537","Md Asif Hawlader","E-Engineering Ltd.","E-Engineering","Civil","Electrician","");
INSERT INTO inv_employee VALUES("513","ENG-000538","Md Abul Hasan","E-Engineering Ltd.","E-Engineering","Civil","Electrician","");
INSERT INTO inv_employee VALUES("514","ENG-000539","Subrato Das","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("515","ENG-000540","Md Shahriar Shajib","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("516","ENG-000541","Md Monirul Islam","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("517","ENG-000542","Pavel Sarker","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("518","ENG-000543","Md Zahidur Rahman","E-Engineering Ltd.","E-Engineering","Management","Director","");
INSERT INTO inv_employee VALUES("519","ENG-000544","Md Osman Sardar","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("520","ENG-000545"," Md Golam Rabbani","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("521","ENG-000546","Shafiqul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("522","ENG-000547","Md Al Amin Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("523","ENG-000548","Md Abdur Razzak","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("524","ENG-000549","Mehedy Hasan","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("525","ENG-000550","Md Ruhul Quddus","E-Engineering Ltd.","E-Engineering","Dredging","Executive Director","");
INSERT INTO inv_employee VALUES("526","ENG-000551","Md Abdur Rahaman","E-Engineering Ltd.","E-Engineering","Mechanical","Tyre Feeder","");
INSERT INTO inv_employee VALUES("527","ENG-000552","Md Russel Mahbub","E-Engineering Ltd.","E-Engineering","Civil","Senior Project Manager","");
INSERT INTO inv_employee VALUES("528","ENG-000553","Md Prantho Reza","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("529","ENG-000554","Mohammad Kawsarul Mondol","E-Engineering Ltd.","E-Engineering","Civil","Assistant QS Engineer","");
INSERT INTO inv_employee VALUES("530","ENG-000555","Md Shahadat Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Manager","");
INSERT INTO inv_employee VALUES("531","ENG-000556","Jobayer Hossain","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("532","ENG-000557","Md Sumon Rana","E-Engineering Ltd.","E-Engineering","Store","Senior Officer","");
INSERT INTO inv_employee VALUES("533","ENG-000558","Md lnzamul Haque","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("534","ENG-000559","B M Ibrahim Islam","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("535","ENG-000560","Zeblul Amin","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("536","ENG-000561","Tapos Mondal","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("537","ENG-000562","Md Yousuf Hossain","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("538","ENG-000563","Md Jani Hasan","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("539","ENG-000564","Md Ashraf Miah","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("540","ENG-000565","Al Mamun Fokir","E-Engineering Ltd.","E-Engineering","Mechanical","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("541","ENG-000566","Hafizur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("542","ENG-000567","Md Rajib Rana","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("543","ENG-000568","Ishak Hossen","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("544","ENG-000569","Abdullah Al Mamun","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("545","ENG-000570","Md Gulam Rabbany","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("546","ENG-000571","Md Anisur Rahman","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("547","ENG-000572","Md Omar Faruk","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("548","ENG-000573"," Md Uzzol Hossain","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("549","ENG-000574","S M Rajibul Hasan","E-Engineering Ltd.","E-Engineering","Civil","Project Engineer","");
INSERT INTO inv_employee VALUES("550","ENG-000575","Md Shoriful Islam","E-Engineering Ltd.","E-Engineering","Civil","Project Engineer","");
INSERT INTO inv_employee VALUES("551","ENG-000576","Nure Alom","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("552","ENG-000577","Md Zahidul Islam","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("553","ENG-000578","Palash Kumar Das","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("554","ENG-000579","Md Waliur Rahman","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("555","ENG-000580","Md Monirul Islam","E-Engineering Ltd.","E-Engineering","Civil","Lab Techinacian","");
INSERT INTO inv_employee VALUES("556","ENG-000581","Md Shobuj Hossin","E-Engineering Ltd.","E-Engineering","Civil","Assistant Lab Technician","");
INSERT INTO inv_employee VALUES("557","ENG-000582","Md Khayrul Islam","E-Engineering Ltd.","E-Engineering","Civil","Lab Techinacian","");
INSERT INTO inv_employee VALUES("558","ENG-000583","Md Mostofa","E-Engineering Ltd.","E-Engineering","Civil","Assistant Lab Technician","");
INSERT INTO inv_employee VALUES("559","ENG-000584","Md Habibur Rahman","E-Engineering Ltd.","E-Engineering","Civil","Lab Techinacian","");
INSERT INTO inv_employee VALUES("560","ENG-000585","Bulbul Islam","E-Engineering Ltd.","E-Engineering","Civil","Assistant Lab Technician","");
INSERT INTO inv_employee VALUES("561","ENG-000586","Md Estiaq Ahmed","E-Engineering Ltd.","E-Engineering","Civil","Lab Techinacian","");
INSERT INTO inv_employee VALUES("562","ENG-000587","Md Mejanur Rahman","E-Engineering Ltd.","E-Engineering","Civil","Auto CAD Engineer","");
INSERT INTO inv_employee VALUES("563","ENG-000588","Md Asmat Ali","E-Engineering Ltd.","E-Engineering","Civil","Auto CAD Engineer","");
INSERT INTO inv_employee VALUES("564","ENG-000589","Md Sajjad Chowdhury","E-Engineering Ltd.","E-Engineering","Civil","Auto CAD Engineer","");
INSERT INTO inv_employee VALUES("565","ENG-000590","Md Imran Sarker","E-Engineering Ltd.","E-Engineering","Civil","Auto CAD Engineer","");
INSERT INTO inv_employee VALUES("566","ENG-000591","Md Rashed Shake","E-Engineering Ltd.","E-Engineering","Civil","Auto CAD Engineer","");
INSERT INTO inv_employee VALUES("567","ENG-000592","Md Shahab Uddin","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("568","ENG-000593","Md Feroj Alom","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("569","ENG-000594","Md Eashir Arafat Polash","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("570","ENG-000595","Md Nazrul Islam","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("571","ENG-000596","Abdulla Al Mamun","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("572","ENG-000597","Salman Sah","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("573","ENG-000598","S M Redoanul Huda","E-Engineering Ltd.","E-Engineering","Civil","Assistant Quantity Surveyor","");
INSERT INTO inv_employee VALUES("574","ENG-000599","Shakil Ahmed","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("575","ENG-000600","Md Shahadat Khan","E-Engineering Ltd.","E-Engineering","QMS","Senior Officer","");
INSERT INTO inv_employee VALUES("576","ENG-000601","Nizam Uddin","E-Engineering Ltd.","E-Engineering","Civil","Auto CAD Engineer","");
INSERT INTO inv_employee VALUES("577","ENG-000602","Md Shahab Uddin","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("578","ENG-000603","Md Ebrahim Khalil Ullah","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("579","ENG-000604","Mohammed Hasan","E-Engineering Ltd.","E-Engineering","Civil","Auto CAD Engineer","");
INSERT INTO inv_employee VALUES("580","ENG-000605","Md Niaz Mahmud Shakil","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("581","ENG-000606","Rubel Hosen","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("582","ENG-000607","Md Mojammil Hoque","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("583","ENG-000608","Md Awyal","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Fitter","");
INSERT INTO inv_employee VALUES("584","ENG-000609","Md Delwar Howlader","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("585","ENG-000610"," Ahammad Ali","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Fitter","");
INSERT INTO inv_employee VALUES("586","ENG-000611","Md Younus","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("587","ENG-000612","Md Mamunul Islam","E-Engineering Ltd.","E-Engineering","Dredging","Engine Driver","");
INSERT INTO inv_employee VALUES("588","ENG-000613","Md Raisul Habib","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("589","ENG-000614","Md Shahadat Hossain","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engineer","");
INSERT INTO inv_employee VALUES("590","ENG-000615","Md Taher Shaikh","E-Engineering Ltd.","E-Engineering","Dredging","Lever Man","");
INSERT INTO inv_employee VALUES("591","ENG-000616","Md Mahedi Hasan","E-Engineering Ltd.","E-Engineering","Civil","Lab Techinacian","");
INSERT INTO inv_employee VALUES("592","ENG-000617","Md Towhidul Islam","E-Engineering Ltd.","E-Engineering","Dredging","Lever Man","");
INSERT INTO inv_employee VALUES("593","ENG-000618","Shopon","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Fitter","");
INSERT INTO inv_employee VALUES("594","ENG-000619","Md Shahin Hossen","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("595","ENG-000620","Md Foysal Khan","E-Engineering Ltd.","E-Engineering","Dredging","Lever Man","");
INSERT INTO inv_employee VALUES("596","ENG-000621","Md Mozammel Huq","E-Engineering Ltd.","E-Engineering","Dredging","Driver","");
INSERT INTO inv_employee VALUES("597","ENG-000622","Emran Hossain","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("598","ENG-000623","Monir Ahmed","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("599","ENG-000624","Sree Biplob Chandro Sarker","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("600","ENG-000625","Md Rasel Mia","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("601","ENG-000626","Sagor Islam","E-Engineering Ltd.","E-Engineering","Store","Store Officer","");
INSERT INTO inv_employee VALUES("602","ENG-000627","Md Badruzzaman","E-Engineering Ltd.","E-Engineering","Store","Store Officer","");
INSERT INTO inv_employee VALUES("603","ENG-000628","A K M Mainul Hassan","E-Engineering Ltd.","E-Engineering","Store","Store Officer","");
INSERT INTO inv_employee VALUES("604","ENG-000629","Sk Zahir Uddin","E-Engineering Ltd.","E-Engineering","Store","Store Keeper","");
INSERT INTO inv_employee VALUES("605","ENG-000630","Md Toshik Uzzaman","E-Engineering Ltd.","E-Engineering","Civil","Project Engineer","");
INSERT INTO inv_employee VALUES("606","ENG-000631","Md Shafikur Rahman","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("607","ENG-000632","Soharab Ahammad","E-Engineering Ltd.","E-Engineering","Store","Store Officer","");
INSERT INTO inv_employee VALUES("608","ENG-000633","Tamvirul Alam","E-Engineering Ltd.","E-Engineering","Civil","Security Officer","");
INSERT INTO inv_employee VALUES("609","ENG-000634","Ashikul Islam","E-Engineering Ltd.","E-Engineering","Civil","Mechanic","");
INSERT INTO inv_employee VALUES("610","ENG-000635","Uttam Sharma","E-Engineering Ltd.","E-Engineering","Store","Store Officer","");
INSERT INTO inv_employee VALUES("611","ENG-000636","Shahidul Islam","E-Engineering Ltd.","E-Engineering","Store","Store Officer","");
INSERT INTO inv_employee VALUES("612","ENG-000637","Faisal Ahmad Bhuiyan","E-Engineering Ltd.","E-Engineering","Store","Store Officer","");
INSERT INTO inv_employee VALUES("613","ENG-000638","Md Nur Alam Sarkar","E-Engineering Ltd.","E-Engineering","Civil","Store In-Charge","");
INSERT INTO inv_employee VALUES("614","ENG-000639","Mohammad Jamal Uddin","E-Engineering Ltd.","E-Engineering","Civil","Store Keeper","");
INSERT INTO inv_employee VALUES("615","ENG-000640","Md Riazul Islam","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("616","ENG-000641","Md Milon Hossain","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("617","ENG-000642","Abdul Halim","E-Engineering Ltd.","E-Engineering","QMS","Executive","");
INSERT INTO inv_employee VALUES("618","ENG-000643","Prashanta Biswas","E-Engineering Ltd.","E-Engineering","EHS","Senior Officer","");
INSERT INTO inv_employee VALUES("619","ENG-000644","Md Unus Ali","E-Engineering Ltd.","E-Engineering","Administration","Peon","");
INSERT INTO inv_employee VALUES("620","ENG-000645","Md Shidullah Sheikh","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Fitter","");
INSERT INTO inv_employee VALUES("621","ENG-000646","Abu Saed","E-Engineering Ltd.","E-Engineering","Dredging","Cook","");
INSERT INTO inv_employee VALUES("622","ENG-000647","Mamun Gazi","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Fitter","");
INSERT INTO inv_employee VALUES("623","ENG-000648","Md Ratib","E-Engineering Ltd.","E-Engineering","Dredging","WINCH Operator","");
INSERT INTO inv_employee VALUES("624","ENG-000649","Pijush Halder","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Supervisor","");
INSERT INTO inv_employee VALUES("625","ENG-000650","Monirujjaman","E-Engineering Ltd.","E-Engineering","Electrical","Assistant Engineer","");
INSERT INTO inv_employee VALUES("626","ENG-000651","Md Zabbar Sheikh","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("627","ENG-000652","Md Helal Pramanik","E-Engineering Ltd.","E-Engineering","Dredging","Cook","");
INSERT INTO inv_employee VALUES("628","ENG-000653","A AI Mashud","E-Engineering Ltd.","E-Engineering","Dredging","Lever Man","");
INSERT INTO inv_employee VALUES("629","ENG-000654","Razoyan Mahabub","E-Engineering Ltd.","E-Engineering","Civil","Assistant General Manager","");
INSERT INTO inv_employee VALUES("630","ENG-000655","Abdul Jabbr","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("631","ENG-000656","Masud Rana","E-Engineering Ltd.","E-Engineering","Civil","Site Surveyor","");
INSERT INTO inv_employee VALUES("632","ENG-000657","Rashedul Hoq Majumder","E-Engineering Ltd.","E-Engineering","Civil","Site Surveyor","");
INSERT INTO inv_employee VALUES("633","ENG-000658","Md Shaiful Islam","E-Engineering Ltd.","E-Engineering","Civil","Assistant Site Surveyor","");
INSERT INTO inv_employee VALUES("634","ENG-000659","Fayjul Haque Rabby","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("635","ENG-000660","Md Kibria","E-Engineering Ltd.","E-Engineering","Mechanical","Asphalt Plant Operator","");
INSERT INTO inv_employee VALUES("636","ENG-000661","Omor faruque","E-Engineering Ltd.","E-Engineering","Mechanical","Bitumen Distributor Operator","");
INSERT INTO inv_employee VALUES("637","ENG-000662","Tofajjal Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanical Helper","");
INSERT INTO inv_employee VALUES("638","ENG-000663","Saragit Biswas","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanical Helper","");
INSERT INTO inv_employee VALUES("639","ENG-000664","Md Shohrab Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","One Cylinder Engine Mechanic","");
INSERT INTO inv_employee VALUES("640","ENG-000665","Md Masud Alam","E-Engineering Ltd.","E-Engineering","Civil","Senior Project Manager","");
INSERT INTO inv_employee VALUES("641","ENG-000666","Ripon Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("642","ENG-000667","Md Mehedi Hasan","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("643","ENG-000668","Md Osman Shek","E-Engineering Ltd.","E-Engineering","Mechanical","Roller Operator","");
INSERT INTO inv_employee VALUES("644","ENG-000669","Md Abdus Salam Shikdar","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("645","ENG-000670","Md Nurul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Vibrator Hammer Operator","");
INSERT INTO inv_employee VALUES("646","ENG-000671","Md Ariful Biswas","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("647","ENG-000672","Md Joynal Abedin","E-Engineering Ltd.","E-Engineering","Mechanical","Tandem Roller Operator","");
INSERT INTO inv_employee VALUES("648","ENG-000673","Rakash Chowdhury","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("649","ENG-000674","Md Mozahedul Islam","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("650","ENG-000675","Manoj Roy","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanical Helper","");
INSERT INTO inv_employee VALUES("651","ENG-000676","Md Mazharul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("652","ENG-000677","Md Shohrab Hosen","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("653","ENG-000678","Saudi Al Hasan","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("654","ENG-000679","Md Shamim Hossain","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("655","ENG-000680","Md Fakrul Islam Sarkar","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("656","ENG-000681","Md Abdul Mannan","E-Engineering Ltd.","E-Engineering","Mechanical","Paver Operator","");
INSERT INTO inv_employee VALUES("657","ENG-000682","Rohol Amin","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("658","ENG-000683","Md Mohiuddin Howlader","E-Engineering Ltd.","E-Engineering","Mechanical","Supervisor","");
INSERT INTO inv_employee VALUES("659","ENG-000684","Md Sariful Islam","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("660","ENG-000685","Md Jahangir Alam Mukti","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("661","ENG-000686","Md Shakil Ahmmed","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("662","ENG-000687","Md Shorif Hossen","E-Engineering Ltd.","E-Engineering","Civil","Surveyor","");
INSERT INTO inv_employee VALUES("663","ENG-000688","Md Sayed Hossain","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("664","ENG-000689","Md Montu Munnsi","E-Engineering Ltd.","E-Engineering","Mechanical","Equipment Helper","");
INSERT INTO inv_employee VALUES("665","ENG-000690","Md Rabbani","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("666","ENG-000691","Ruhul Amin","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("667","ENG-000692","Md Sakib Munshi","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("668","ENG-000693","Md Shahjahan Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("669","ENG-000694","Md Abdul Kuddus Shorif","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("670","ENG-000695","Md Afjalur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("671","ENG-000696","Md Anowar Hossin Khan","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("672","ENG-000697","Sanjoy Kundu","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("673","ENG-000698","Md Arifur Rahman Sajol","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Electrician","");
INSERT INTO inv_employee VALUES("674","ENG-000699","Md Joynu Abedin","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("675","ENG-000700","Mithun Roy","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("676","ENG-000701","Md Abdullah Al Kafi","E-Engineering Ltd.","E-Engineering","Mechanical","Plant Helper","");
INSERT INTO inv_employee VALUES("677","ENG-000702","Md Abdul Karim","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Electrician","");
INSERT INTO inv_employee VALUES("678","ENG-000703","Md Mojammel Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanic","");
INSERT INTO inv_employee VALUES("679","ENG-000704","Md Asraful Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Electrician","");
INSERT INTO inv_employee VALUES("680","ENG-000705","Ahmad Ullah","E-Engineering Ltd.","E-Engineering","Mechanical","Pump Operator","");
INSERT INTO inv_employee VALUES("681","ENG-000706","Md Mohaiminul Islam","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("682","ENG-000707","Md Wahid","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("683","ENG-000708","Raja Khan","E-Engineering Ltd.","E-Engineering","Market Development","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("684","ENG-000709","Md Saroar Hossin","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("685","ENG-000710","Rasel","E-Engineering Ltd.","E-Engineering","Mechanical","Diesel Hammer Operator","");
INSERT INTO inv_employee VALUES("686","ENG-000711","S M Nazmul","E-Engineering Ltd.","E-Engineering","Civil","Senior Project Manager","");
INSERT INTO inv_employee VALUES("687","ENG-000712","Md Abdus Sabur","E-Engineering Ltd.","E-Engineering","Civil","Project Engineer","");
INSERT INTO inv_employee VALUES("688","ENG-000713","Md Rakibul Islam","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("689","ENG-000714","Sujhon Chandra Saha","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("690","ENG-000715","Md Emon","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("691","ENG-000716","Md Kaium Khan","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("692","ENG-000717","Md Rajlb Mia","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("693","ENG-000718","Md Rashedul Islam Rashed","E-Engineering Ltd.","E-Engineering","Administration","Assistant Manager","");
INSERT INTO inv_employee VALUES("694","ENG-000719","Md Maidul Islam","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("695","ENG-000720","Md Papon Khan","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("696","ENG-000721","Md Shamim","E-Engineering Ltd.","E-Engineering","Mechanical","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("697","ENG-000722","Md Ariful Islam","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("698","ENG-000723","Md Abdus Shattar","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("699","ENG-000724","Md Al Amin","E-Engineering Ltd.","E-Engineering","Dredging","Junior Engineer","");
INSERT INTO inv_employee VALUES("700","ENG-000725","Kazi Md Belayedh Hossain Nazim","E-Engineering Ltd.","E-Engineering","Mechanical","Batching Plant Operator","");
INSERT INTO inv_employee VALUES("701","ENG-000726","Jamal Hossain","E-Engineering Ltd.","E-Engineering","Dredging","Lever Man","");
INSERT INTO inv_employee VALUES("702","ENG-000727","Md Nahidul Islam","E-Engineering Ltd.","E-Engineering","Dredging","Junior Officer","");
INSERT INTO inv_employee VALUES("703","ENG-000728","Md Younush Ali","E-Engineering Ltd.","E-Engineering","Operation","Manager","");
INSERT INTO inv_employee VALUES("704","ENG-000729","Firoz Sheikh","E-Engineering Ltd.","E-Engineering","Dredging","Operator","");
INSERT INTO inv_employee VALUES("705","ENG-000730","Md Sajedur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Deputy General Manager","");
INSERT INTO inv_employee VALUES("706","ENG-000731","Md Samiul Alam","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("707","ENG-000732","Md Alamgir Hossain","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("708","ENG-000733","Md Khalilur Rahman","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("709","ENG-000734","Md Jahangir Hassin","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("710","ENG-000735","Shahadat Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("711","ENG-000736","Ab Razzak Shaikh","E-Engineering Ltd.","E-Engineering","Dredging","WINCH Operator","");
INSERT INTO inv_employee VALUES("712","ENG-000737","Fazar Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("713","ENG-000738","Noman Uddin","E-Engineering Ltd.","E-Engineering","Dredging","Operator","");
INSERT INTO inv_employee VALUES("714","ENG-000739","Md Nayan","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("715","ENG-000740","Halim Shaikh","E-Engineering Ltd.","E-Engineering","Dredging","Cook","");
INSERT INTO inv_employee VALUES("716","ENG-000741","Md Moznur Rahaman","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Fitter","");
INSERT INTO inv_employee VALUES("717","ENG-000742","Md Mijanur Rahman","E-Engineering Ltd.","E-Engineering","Finance And Accounts","Deputy Manager","");
INSERT INTO inv_employee VALUES("718","ENG-000743","Md Abul Bashr","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("719","ENG-000744","Md Bassue","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("720","ENG-000745","Jayanto Sarkar","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("721","ENG-000746","Md Ehsan Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("722","ENG-000747","Md Majed Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("723","ENG-000748","Mojammal  Haque","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("724","ENG-000749","Md Selim Reza","E-Engineering Ltd.","E-Engineering","Mechanical","Operator","");
INSERT INTO inv_employee VALUES("725","ENG-000750","Sonjoy Chandra Biswas","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("726","ENG-000751","Md Rasel Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("727","ENG-000752","Md Abdur Rab","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("728","ENG-000753","Md Ferdous","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("729","ENG-000754","Md Jabed","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("730","ENG-000755","Md Rasel Molla","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("731","ENG-000756","Md Shahidul Islam ","E-Engineering Ltd.","E-Engineering","Mechanical","Auto Electrician","");
INSERT INTO inv_employee VALUES("732","ENG-000757","Shamim Anwar","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("733","ENG-000758","Md Shamsur Rahman","E-Engineering Ltd.","E-Engineering","Project ENG","Assistant General Manager","");
INSERT INTO inv_employee VALUES("734","ENG-000759","Myin Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Manager","");
INSERT INTO inv_employee VALUES("735","ENG-000760","Md Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Administration","Store Assistant","");
INSERT INTO inv_employee VALUES("736","ENG-000761","Md Jahid Hasan","E-Engineering Ltd.","E-Engineering","Project ENG","Officer","");
INSERT INTO inv_employee VALUES("737","ENG-000762","Rashidul Islam","E-Engineering Ltd.","E-Engineering","QMS","Executive","");
INSERT INTO inv_employee VALUES("738","ENG-000763","Md Anwar Hosen","E-Engineering Ltd.","E-Engineering","Mechanical","Concrete Pump Operator","");
INSERT INTO inv_employee VALUES("739","ENG-000764","Abul Khair","E-Engineering Ltd.","E-Engineering","Mechanical","Auto Electrician","");
INSERT INTO inv_employee VALUES("740","ENG-000765","Md Salim Reza ","E-Engineering Ltd.","E-Engineering","Mechanical","Operator","");
INSERT INTO inv_employee VALUES("741","ENG-000766","Uttam Kumar Saha ","E-Engineering Ltd.","E-Engineering","Civil","Project Co-Ordinator","");
INSERT INTO inv_employee VALUES("742","ENG-000767","Md Amran Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("743","ENG-000768","Md Monir hossain","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("744","ENG-000769","Md Sabuj Mia","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("745","ENG-000770","Md Abul Bashar","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("746","ENG-000771","Arafat Miah","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("747","ENG-000772","Arnab Das","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("748","ENG-000773","Bibek Mondol","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("749","ENG-000774","Md Dulal ","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("750","ENG-000775","Md Foysal Hossain ","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("751","ENG-000776","Md Abedur Rahman","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("752","ENG-000777","Md Arman ","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("753","ENG-000778","Md Ashik","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("754","ENG-000779","Md Yeasin Sheikh","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("755","ENG-000780","Md Abdullah Sarker","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("756","ENG-000781","Md Jabed Hossain","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("757","ENG-000782","Md Ekhlas","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("758","ENG-000783","Md Hanif Mia","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("759","ENG-000784","Md Mosarrof Hossen","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("760","ENG-000785","Md Shimul Ali","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("761","ENG-000786","Md Miraz Hossen ","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("762","ENG-000787","Mohasin Mia","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("763","ENG-000788","Md Sabbir Ahamed","E-Engineering Ltd.","E-Engineering","Civil","Surveyor","");
INSERT INTO inv_employee VALUES("764","ENG-000789","Mohammad Ali Asraf","E-Engineering Ltd.","E-Engineering","Dredging","Supervisor","");
INSERT INTO inv_employee VALUES("765","ENG-000790","Mohin Uddin ","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("766","ENG-000791","Nur Mohhamad","E-Engineering Ltd.","E-Engineering","Dredging","Engine Driver","");
INSERT INTO inv_employee VALUES("767","ENG-000792","Imran Hossain","E-Engineering Ltd.","E-Engineering","EHS","Senior Officer","");
INSERT INTO inv_employee VALUES("768","ENG-000793","Md Nazrul Islam","E-Engineering Ltd.","E-Engineering","QMS","Executive","");
INSERT INTO inv_employee VALUES("769","ENG-000794","Md Salauddin Hayat","E-Engineering Ltd.","E-Engineering","EHS","Senior Officer","");
INSERT INTO inv_employee VALUES("770","ENG-000795","Md Amzad Hossen","E-Engineering Ltd.","E-Engineering","QMS","Senior Officer","");
INSERT INTO inv_employee VALUES("771","ENG-000796","Md Sofiqul Islalm","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("772","ENG-000797","Md Masud Rana","E-Engineering Ltd.","E-Engineering","Mechanical","Batching Plant Operator","");
INSERT INTO inv_employee VALUES("773","ENG-000798","Md Shohlel Rana","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("774","ENG-000799","Md Sazad Hosan","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("775","ENG-000800","Md Abdul Kader","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("776","ENG-000801","MG Rabbani","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("777","ENG-000802","Md Faruk","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("778","ENG-000803","Md Saifuddin Pinku","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("779","ENG-000804","Mohammad Osman","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("780","ENG-000805","Salah Uddin Kader","E-Engineering Ltd.","E-Engineering","Civil","Planning Engineer","");
INSERT INTO inv_employee VALUES("781","ENG-000806","Md Lokman","E-Engineering Ltd.","E-Engineering","Mechanical","Operator","");
INSERT INTO inv_employee VALUES("782","ENG-000807","Tuhin Bin Azam","E-Engineering Ltd.","E-Engineering","Project ENG","Executive Director","");
INSERT INTO inv_employee VALUES("783","ENG-000808","Abdullah Ahad","E-Engineering Ltd.","E-Engineering","Civil","Supervisor","");
INSERT INTO inv_employee VALUES("784","ENG-000809","Anowar Hossen","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanic","");
INSERT INTO inv_employee VALUES("785","ENG-000810","Md Rashadul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("786","ENG-000811","S M Saju","E-Engineering Ltd.","E-Engineering","Mechanical","Senior Electrician","");
INSERT INTO inv_employee VALUES("787","ENG-000812","Md Zakir Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("788","ENG-000813","S M Rakibul Hassan","E-Engineering Ltd.","E-Engineering","Civil","Store Officer","");
INSERT INTO inv_employee VALUES("789","ENG-000814","Md Abdul Karim","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("790","ENG-000815","Md Zakir Hosen","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("791","ENG-000816","Md Abdul Kadar","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("792","ENG-000817","Md Aminur Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("793","ENG-000818","Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Trailer Operator","");
INSERT INTO inv_employee VALUES("794","ENG-000819","Emon Hossain","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("795","ENG-000820","Md Farooq Sikder ","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("796","ENG-000821","Md Nurul Amin","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("797","ENG-000822","Tufayl Ahamed","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("798","ENG-000823","Md Jamirul Islam","E-Engineering Ltd.","E-Engineering","Dredging","Assistant","");
INSERT INTO inv_employee VALUES("799","ENG-000824","Md Alamin","E-Engineering Ltd.","E-Engineering","Dredging","Assistant","");
INSERT INTO inv_employee VALUES("800","ENG-000825","Md Mosaref Hossain","E-Engineering Ltd.","E-Engineering","Dredging","Assistant","");
INSERT INTO inv_employee VALUES("801","ENG-000826","Md Masud Saheed","E-Engineering Ltd.","E-Engineering","Dredging","Executive Director","");
INSERT INTO inv_employee VALUES("802","ENG-000827","Alam Molla","E-Engineering Ltd.","E-Engineering","Civil","Project Engineer","");
INSERT INTO inv_employee VALUES("803","ENG-000828","Md Abul Kalam Shamsuddin","E-Engineering Ltd.","E-Engineering","Civil","Store Officer","");
INSERT INTO inv_employee VALUES("804","ENG-000829","Md Rasel Alam","E-Engineering Ltd.","E-Engineering","Civil","Project Manager","");
INSERT INTO inv_employee VALUES("805","ENG-000830","Abdur Razzak Mollah","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("806","ENG-000831","Farhad Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("807","ENG-000832","Md Milon Hossen","E-Engineering Ltd.","E-Engineering","Mechanical","Crane Operator","");
INSERT INTO inv_employee VALUES("808","ENG-000833","Md Fakrul Islam Sarker","E-Engineering Ltd.","E-Engineering","Civil","Surveyor","");
INSERT INTO inv_employee VALUES("809","ENG-000834","Md Masud Rana","E-Engineering Ltd.","E-Engineering","Civil","Surveyor","");
INSERT INTO inv_employee VALUES("810","ENG-000835","Md Abdullah Al Mamun","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("811","ENG-000836","Md Abdur Rashid","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanic","");
INSERT INTO inv_employee VALUES("812","ENG-000837","Md Akash Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Concrete Pump Operator","");
INSERT INTO inv_employee VALUES("813","ENG-000838","Md Mostafa Kamal","E-Engineering Ltd.","E-Engineering","Mechanical","Surveyor","");
INSERT INTO inv_employee VALUES("814","ENG-000839","Md Tota Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Tyre Feeder","");
INSERT INTO inv_employee VALUES("815","ENG-000840","Md Mahmudul Islam","E-Engineering Ltd.","E-Engineering","EHS","Medical Assistant","");
INSERT INTO inv_employee VALUES("816","ENG-000841","Shanta Dey","E-Engineering Ltd.","E-Engineering","QMS","Medical Assistant","");
INSERT INTO inv_employee VALUES("817","ENG-000842","Md Zakir Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Manager","");
INSERT INTO inv_employee VALUES("818","ENG-000843","Md Nur Islam","E-Engineering Ltd.","E-Engineering","EHS","Senior Officer","");
INSERT INTO inv_employee VALUES("819","ENG-000844","Habibur Rahman Hasan","E-Engineering Ltd.","E-Engineering","Dredging","Senior Manager","");
INSERT INTO inv_employee VALUES("820","ENG-000845","Mohammed Yakub","E-Engineering Ltd.","E-Engineering","Dredging","Store Keeper","");
INSERT INTO inv_employee VALUES("821","ENG-000846","Md Ali Akbar","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("822","ENG-000847","Md. Robin Mia","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("823","ENG-000848","Md Abdul Mannan","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("824","ENG-000849","Abu Noman","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("825","ENG-000850","Mamunar Rasid","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("826","ENG-000851","Md Mintu Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("827","ENG-000852","Md Nurnobi Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("828","ENG-000853","Md Shahidul","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("829","ENG-000854","Md Shohid","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("830","ENG-000855","Md Yasin Sardar","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("831","ENG-000856","Md Younus","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("832","ENG-000857","Sha Alam","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("833","ENG-000858","Sala Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("834","ENG-000859","Md lrfat Hossen","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("835","ENG-000860","Md Shopon Fakir","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("836","ENG-000861","Md Chan Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("837","ENG-000862","Md Yousuf","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("838","ENG-000863","Syed Md Rashal","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("839","ENG-000864","Md Monir Hosen","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("840","ENG-000865","Md Abed Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("841","ENG-000866","Md Elias Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("842","ENG-000867","Azhar Mahmud","E-Engineering Ltd.","E-Engineering","Civil","Deputy Project Manager","");
INSERT INTO inv_employee VALUES("843","ENG-000868","Sagar Ahmed","E-Engineering Ltd.","E-Engineering","Mechanical","Batching Plant Operator","");
INSERT INTO inv_employee VALUES("844","ENG-000869","Md Abdul Momin Mredha","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("845","ENG-000870","Md Kawsar Ahamed","E-Engineering Ltd.","E-Engineering","Mechanical","Surveyor","");
INSERT INTO inv_employee VALUES("846","ENG-000871","Basar","E-Engineering Ltd.","E-Engineering","Mechanical","Roller Operator","");
INSERT INTO inv_employee VALUES("847","ENG-000872","Md Ziaul Hoque","E-Engineering Ltd.","E-Engineering","Mechanical","Vibrator Hammer Operator","");
INSERT INTO inv_employee VALUES("848","ENG-000873","Md Nazrul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Roller Operator","");
INSERT INTO inv_employee VALUES("849","ENG-000874","Baizid Bostami","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("850","ENG-000875","Masud Rana","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("851","ENG-000876","Md Shahadat Hossen","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("852","ENG-000877","Md Shamim","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("853","ENG-000878","Md Mohubar Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("854","ENG-000879","Nirob","E-Engineering Ltd.","E-Engineering","Mechanical","Concrete Pump Operator","");
INSERT INTO inv_employee VALUES("855","ENG-000880","Md Alamin Gajy","E-Engineering Ltd.","E-Engineering","Mechanical","Mixer Truck Driver","");
INSERT INTO inv_employee VALUES("856","ENG-000881","Titas Biswas","E-Engineering Ltd.","E-Engineering","Mechanical","Rigger","");
INSERT INTO inv_employee VALUES("857","ENG-000882","Md Mustafizur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("858","ENG-000883","Golap Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("859","ENG-000884","Md Ibrahim Kazi","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("860","ENG-000885","Md Shahidul Islam Hawladar","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("861","ENG-000886","Md Sofiqul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("862","ENG-000887","Touhid Hasan","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("863","ENG-000888","Md Taher","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("864","ENG-000889","Moznu","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("865","ENG-000890","Avilash Chandra Adikari","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("866","ENG-000891","Md Najmul Huda Razu","E-Engineering Ltd.","E-Engineering","Mechanical","Crane Operator","");
INSERT INTO inv_employee VALUES("867","ENG-000892","Md Nurul Afsar","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("868","ENG-000893","Abdus Salam","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("869","ENG-000894","Abdus Salam","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("870","ENG-000895","Md Jahangir Alam Khan","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("871","ENG-000896","Md Salim Shikder","E-Engineering Ltd.","E-Engineering","Mechanical","Motor Grader Operator","");
INSERT INTO inv_employee VALUES("872","ENG-000897","Md Shazib Molla","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("873","ENG-000898","Mohammad Hasan","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("874","ENG-000899","Md Mokter Hossain Tuhin","E-Engineering Ltd.","E-Engineering","Mechanical","Crane Operator","");
INSERT INTO inv_employee VALUES("875","ENG-000900","Sonet Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Batching Plant Helper","");
INSERT INTO inv_employee VALUES("876","ENG-000901","Swapan Acharjee","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("877","ENG-000902","Nazmul","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("878","ENG-000903","Ahesanul Haque","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("879","ENG-000904","Alauddin","E-Engineering Ltd.","E-Engineering","Mechanical","Vibrating Roller Operator","");
INSERT INTO inv_employee VALUES("880","ENG-000905","Amit Bagchi","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("881","ENG-000906","Md Masuder Rahman Khan","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("882","ENG-000907","Md Razib Shikder","E-Engineering Ltd.","E-Engineering","Mechanical","Vibrating Roller Operator","");
INSERT INTO inv_employee VALUES("883","ENG-000908","Md Samsul Alam","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("884","ENG-000909","Md Shahin Reza","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("885","ENG-000910","Md Yousuf Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Vibrating Roller Operator","");
INSERT INTO inv_employee VALUES("886","ENG-000911","Tofazzal Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("887","ENG-000912","S M Ashik Iqbal Sawpno","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("888","ENG-000913","Sayed Imran Khan Rocky","E-Engineering Ltd.","E-Engineering","Mechanical","Vibrating Roller Operator","");
INSERT INTO inv_employee VALUES("889","ENG-000914","Md Yousuf Zia","E-Engineering Ltd.","E-Engineering","Mechanical","Vibrating Roller Operator","");
INSERT INTO inv_employee VALUES("890","ENG-000915","Md. Jakaria Hossain","E-Engineering Ltd.","E-Engineering","Dredging","Head Cook","");
INSERT INTO inv_employee VALUES("891","ENG-000916","Md Babul Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Roller Operator","");
INSERT INTO inv_employee VALUES("892","ENG-000917","Jahidul Khan","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("893","ENG-000918","Md Alauddin","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("894","ENG-000919","Md Nehu Choduri","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("895","ENG-000920","Rabiul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("896","ENG-000921","Md Shohidul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("897","ENG-000922","Md Yaladur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Batching Plant Operator","");
INSERT INTO inv_employee VALUES("898","ENG-000923","Mahiuddin","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("899","ENG-000924","Md Ansarul Haque","E-Engineering Ltd.","E-Engineering","Dredging","Pipe Fitter","");
INSERT INTO inv_employee VALUES("900","ENG-000925","Md. Waliullah","E-Engineering Ltd.","E-Engineering","Project ENG","Officer","");
INSERT INTO inv_employee VALUES("901","ENG-000926","Md Shadat Hossen","E-Engineering Ltd.","E-Engineering","Marine","Welder","");
INSERT INTO inv_employee VALUES("902","ENG-000927","Md Saddam Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("903","ENG-000928","Md Sulaiman Hoque","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("904","ENG-000929","Abul Hossain ","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("905","ENG-000930","Md Anamul Hoque ","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("906","ENG-000931","Mijanur Rahaman ","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("907","ENG-000932","Md Mister Hossion ","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("908","ENG-000933","Md Palash ","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("909","ENG-000934","Ripon ","E-Engineering Ltd.","E-Engineering","Dredging","Assistant","");
INSERT INTO inv_employee VALUES("910","ENG-000935","Sabbir Khan Mojlis ","E-Engineering Ltd.","E-Engineering","Dredging","Crew","");
INSERT INTO inv_employee VALUES("911","ENG-000936","Farhad Uddin ","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("912","ENG-000937","Md Mojibur Rahman ","E-Engineering Ltd.","E-Engineering","Dredging","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("913","ENG-000938","Md Siful Islam ","E-Engineering Ltd.","E-Engineering","Dredging","Engine Driver","");
INSERT INTO inv_employee VALUES("914","ENG-000939","Foizul Ahmed","E-Engineering Ltd.","E-Engineering","Project ENG","Senior Officer","");
INSERT INTO inv_employee VALUES("915","ENG-000940","Md Robiul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Operator","");
INSERT INTO inv_employee VALUES("916","ENG-000941","Md Sarwar Hossain","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("917","ENG-000942","Khan Md Ahsan Habib","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Manager","");
INSERT INTO inv_employee VALUES("918","ENG-000943","Md Belal Uddin","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("919","ENG-000944","Ashiqur Rahman ","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("920","ENG-000945","Murad Howlader ","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("921","ENG-000946","Md Monjurul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("922","ENG-000947","Md Zhangir Alam","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("923","ENG-000948","Arshad Hossan","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("924","ENG-000949","ASM Shamim Ahsan","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("925","ENG-000950","Hafiz Ullah","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("926","ENG-000951","Kalam Sheikh","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("927","ENG-000952","Md Chan Miya","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("928","ENG-000953","Md Emon","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("929","ENG-000954","Md Omor Faruk","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("930","ENG-000955","Md Shaensha","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("931","ENG-000956","Oddod Hosaen","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("932","ENG-000957","Polash Das","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("933","ENG-000958","Md Nazmul Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("934","ENG-000959","Md Nurul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("935","ENG-000960","Md Shahadat Hossen","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("936","ENG-000961","Zonayed Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("937","ENG-000962","Md Hasan","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("938","ENG-000963","Md Rana ","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("939","ENG-000964","Abdur Rashid","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("940","ENG-000965","Ajad Molla","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("941","ENG-000966","Arifur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("942","ENG-000967","Md Kamal","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("943","ENG-000968","Md Razib","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("944","ENG-000969","Md Saidul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Supervisor","");
INSERT INTO inv_employee VALUES("945","ENG-000970","Md Shuvo Ahmed","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanical Helper","");
INSERT INTO inv_employee VALUES("946","ENG-000971","Mohammad Abu Sayed","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanical Helper","");
INSERT INTO inv_employee VALUES("947","ENG-000972","Md Siddique ","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("948","ENG-000973","Md Siddique ","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("949","ENG-000974","Md Samiul Islam ","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("950","ENG-000975","Md Taju Uddin ","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("951","ENG-000976","Abdul Alim ","E-Engineering Ltd.","E-Engineering","EHS","Executive","");
INSERT INTO inv_employee VALUES("952","ENG-000977","Md Homayun Kabir ","E-Engineering Ltd.","E-Engineering","Mechanical","Senior Mechanic","");
INSERT INTO inv_employee VALUES("953","ENG-000978","Mohammad Amir Hosen","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("954","ENG-000979","Md Najmul Hasan","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("955","ENG-000980","Md Touib Ali Molla","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("956","ENG-000981","Md Nazrul Shake","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("957","ENG-000982","Md Shapan Shikder","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("958","ENG-000983","Mohammad Shamim","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("959","ENG-000984","Md Samchul Haque","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("960","ENG-000985","Md Abu Sufian","E-Engineering Ltd.","E-Engineering","Mechanical","Auto Electrician","");
INSERT INTO inv_employee VALUES("961","ENG-000986","Shakty Mandal","E-Engineering Ltd.","E-Engineering","Civil","Junior Engineer","");
INSERT INTO inv_employee VALUES("962","ENG-000987","Md Harun Ur Rashid","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("963","ENG-000988","Md Naim Hossain","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("964","ENG-000989","Md Rezaul Haque","E-Engineering Ltd.","E-Engineering","Civil","Senior Site Supervisor","");
INSERT INTO inv_employee VALUES("965","ENG-000990","Mahbob Sobhan","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("966","ENG-000991","Md Robiul Hossain","E-Engineering Ltd.","E-Engineering","Civil","Quantity Surveyor Engineer","");
INSERT INTO inv_employee VALUES("967","ENG-000992","Md Masud Karim","E-Engineering Ltd.","E-Engineering","Mechanical","Store Keeper","");
INSERT INTO inv_employee VALUES("968","ENG-000993","Md Zahidul Islam","E-Engineering Ltd.","E-Engineering","Administration","Officer","");
INSERT INTO inv_employee VALUES("969","ENG-000994","Billal Hossen","E-Engineering Ltd.","E-Engineering","Civil","Assistant Lab Technician","");
INSERT INTO inv_employee VALUES("970","ENG-000995","Siddikur Rahman Ahad","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("971","ENG-000996","Motiar Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Pump Operator","");
INSERT INTO inv_employee VALUES("972","ENG-000997","Ibrahim Hosen","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("973","ENG-000998","Md Mashum Hasnan","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("974","ENG-000999","Md Sayad Ali","E-Engineering Ltd.","E-Engineering","Civil","Lab Techinacian","");
INSERT INTO inv_employee VALUES("975","ENG-001000","Md Tariqul Islam","E-Engineering Ltd.","E-Engineering","Civil","Site Engineer","");
INSERT INTO inv_employee VALUES("976","ENG-001001","Md Bellal Hossain","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("977","ENG-001002","Abdul Subhan","E-Engineering Ltd.","E-Engineering","Civil","Assistant Lab Technician","");
INSERT INTO inv_employee VALUES("978","ENG-001003","Alauddin Ahmed","E-Engineering Ltd.","E-Engineering","Mechanical","Executive Director","");
INSERT INTO inv_employee VALUES("979","ENG-001004","Rubel Bapary","E-Engineering Ltd.","E-Engineering","Mechanical","Pump Operator","");
INSERT INTO inv_employee VALUES("980","ENG-001005","Md Mohibbullah Morshed ","E-Engineering Ltd.","E-Engineering","Business Development","Executive Director","");
INSERT INTO inv_employee VALUES("981","ENG-001006","Md Hira Mia ","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("982","ENG-001007","Md Hasibur Rahman","E-Engineering Ltd.","E-Engineering","Civil","Assistant Planning Engineer","");
INSERT INTO inv_employee VALUES("983","ENG-001008","Md Mirza Fahim","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("984","ENG-001009","Md Nazmul Hossin","E-Engineering Ltd.","E-Engineering","Civil","Site Supervisor","");
INSERT INTO inv_employee VALUES("985","ENG-001010","Md Nahid Hasan","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Manager","");
INSERT INTO inv_employee VALUES("986","ENG-001011","Md Roton Molla","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("987","ENG-001012","Md Tanbir Ahamad Bhuina Saddam ","E-Engineering Ltd.","E-Engineering","Mechanical","Crane Operator","");
INSERT INTO inv_employee VALUES("988","ENG-001013","Sakib Howlader","E-Engineering Ltd.","E-Engineering","Administration","Store Helper","");
INSERT INTO inv_employee VALUES("989","ENG-001014","Md Abu Taher","E-Engineering Ltd.","E-Engineering","Mechanical","Batching Plant Helper","");
INSERT INTO inv_employee VALUES("990","ENG-001015","Md Faruk Fakir","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("991","ENG-001016","Md Jahid Mridha ","E-Engineering Ltd.","E-Engineering","Administration","Store Helper","");
INSERT INTO inv_employee VALUES("992","ENG-001017","Palash Mondal","E-Engineering Ltd.","E-Engineering","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("993","ENG-001018","Md Shohel Rana","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("994","ENG-001019","Md Rafiqul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Rigger","");
INSERT INTO inv_employee VALUES("995","ENG-001020","Md Rakibul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("996","ENG-001021","Torikul Islam","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("997","ENG-001022","Md Monarul","E-Engineering Ltd.","E-Engineering","Operation","Tractor Driver","");
INSERT INTO inv_employee VALUES("998","ENG-001023","Anamul Haque","E-Engineering Ltd.","E-Engineering","Mechanical","Rigger","");
INSERT INTO inv_employee VALUES("999","ENG-001024","Rakibul Islam","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1000","ENG-001025","Shamim Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Rigger","");
INSERT INTO inv_employee VALUES("1001","ENG-001026","Md Jakaria ","E-Engineering Ltd.","E-Engineering","Operation","Boat Driver","");
INSERT INTO inv_employee VALUES("1002","ENG-001027","Razib Shaikh","E-Engineering Ltd.","E-Engineering","Mechanical","Block Machine Operator","");
INSERT INTO inv_employee VALUES("1003","ENG-001028","Md Ashraful Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Roller Operator","");
INSERT INTO inv_employee VALUES("1004","ENG-001029","Md Hridoy","E-Engineering Ltd.","E-Engineering","Mechanical","Rigger","");
INSERT INTO inv_employee VALUES("1005","ENG-001030","Md Mohibullah Sheikh","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1006","ENG-001031","Md Elias Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Site Surveyor","");
INSERT INTO inv_employee VALUES("1007","ENG-001032","Mustafizur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Site Surveyor","");
INSERT INTO inv_employee VALUES("1008","ENG-001033","Miraj Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Site Surveyor","");
INSERT INTO inv_employee VALUES("1009","ENG-001034","Rahat Parvej","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Site Surveyor","");
INSERT INTO inv_employee VALUES("1010","ENG-001035","Md Abue Shalea Musa","E-Engineering Ltd.","E-Engineering","Administration","Supervisor","");
INSERT INTO inv_employee VALUES("1011","ENG-001036","Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Site Assistant","");
INSERT INTO inv_employee VALUES("1012","ENG-001037","Osman Goni Shajib","E-Engineering Ltd.","E-Engineering","Mechanical","Site Assistant","");
INSERT INTO inv_employee VALUES("1013","ENG-001038","Md Mohoshin","E-Engineering Ltd.","E-Engineering","Operation","Engineer","");
INSERT INTO inv_employee VALUES("1014","ENG-001039","Md Nazmul Islam","E-Engineering Ltd.","E-Engineering","Administration","Store Assistant","");
INSERT INTO inv_employee VALUES("1015","ENG-001040","Md Baker Hussain","E-Engineering Ltd.","E-Engineering","Administration","Store Assistant","");
INSERT INTO inv_employee VALUES("1016","ENG-001041","Abdullah","E-Engineering Ltd.","E-Engineering","Operation","Electrician","");
INSERT INTO inv_employee VALUES("1017","ENG-001042","Sala Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("1018","ENG-001043","Md Shafor Ali","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1019","ENG-001044","Md Mintu Howlader Hanif","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1020","ENG-001045","Hanif Akon","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1021","ENG-001046","Md Alomgir Molla","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1022","ENG-001047","Kakuli","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1023","ENG-001048","Md Aual","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1024","ENG-001049","Sapan","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1025","ENG-001050","Md Sohag Gazi","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1026","ENG-001051","Md Jahangir Sikder","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1027","ENG-001052","Hasan","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1028","ENG-001053","Md Saun","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1029","ENG-001054","Md Helal Chowkidar","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1030","ENG-001055","Md Elias Howlader","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1031","ENG-001056","Md Juel Mollah","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1032","ENG-001057","Khaled Choukidar","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1033","ENG-001058","Md Shohel ","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1034","ENG-001059","Sohel","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1035","ENG-001060","Md Belal Hossin","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1036","ENG-001061","Md Arif","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1037","ENG-001062","Md Siddik","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1038","ENG-001063","Taiful Islam","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1039","ENG-001064","Al Mamun","E-Engineering Ltd.","E-Engineering","Administration","Supervisor","");
INSERT INTO inv_employee VALUES("1040","ENG-001065","Md Monir Hosain","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1041","ENG-001066","Md Rubel","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1042","ENG-001067","Nazmul Haque","E-Engineering Ltd.","E-Engineering","Administration","Store Assistant","");
INSERT INTO inv_employee VALUES("1043","ENG-001068","Hazera Begum","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1044","ENG-001069","Md sohel Howladar","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1045","ENG-001070","Md Zahidul Islam","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1046","ENG-001071","Md Shimul","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1047","ENG-001072","Md Ibrahim","E-Engineering Ltd.","E-Engineering","Administration","Bike Driver","");
INSERT INTO inv_employee VALUES("1048","ENG-001073","Abu Bakkar Siddik","E-Engineering Ltd.","E-Engineering","Administration","Bike Driver","");
INSERT INTO inv_employee VALUES("1049","ENG-001074","Abul Bashar Hawlader","E-Engineering Ltd.","E-Engineering","Administration","Boat Driver","");
INSERT INTO inv_employee VALUES("1050","ENG-001075","Md Rasel","E-Engineering Ltd.","E-Engineering","Administration","Bike Driver","");
INSERT INTO inv_employee VALUES("1051","ENG-001076","Md Salam Matubbar","E-Engineering Ltd.","E-Engineering","Administration","Bike Driver","");
INSERT INTO inv_employee VALUES("1052","ENG-001077","Md Sabbir Ahmed Heridoy","E-Engineering Ltd.","E-Engineering","Administration","Site Supervisor","");
INSERT INTO inv_employee VALUES("1053","ENG-001078","Md Jahir Mia","E-Engineering Ltd.","E-Engineering","Operation","Tractor Driver","");
INSERT INTO inv_employee VALUES("1054","ENG-001079","Md Rafiqul Islam","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1055","ENG-001080","Md Aminul Islam Shakib","E-Engineering Ltd.","E-Engineering","Administration","Peon","");
INSERT INTO inv_employee VALUES("1056","ENG-001081","Md Roni Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("1057","ENG-001082","Rafiq","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1058","ENG-001083","Abdul Barek","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1059","ENG-001084","Asrab Ali","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1060","ENG-001085","Md Sobuj Hossain","E-Engineering Ltd.","E-Engineering","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("1061","ENG-001086","Md Imdadul Haque","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1062","ENG-001087","Mohammat Ali","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1063","ENG-001088","Md Majibar Rahman","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1064","ENG-001089","MD Abul Khair","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1065","ENG-001090","Md Sumon","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1066","ENG-001091","Md Ripon Islam","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1067","ENG-001092","Md Nazimuddin Daria","E-Engineering Ltd.","E-Engineering","Administration","Asphalt Plant Operator","");
INSERT INTO inv_employee VALUES("1068","ENG-001093","Md.Masum","E-Engineering Ltd.","E-Engineering","Administration","Surveyor","");
INSERT INTO inv_employee VALUES("1069","ENG-001094","Md.Nurannabi","E-Engineering Ltd.","E-Engineering","Administration","Surveyor Helper","");
INSERT INTO inv_employee VALUES("1070","ENG-001095","Md.Rubel","E-Engineering Ltd.","E-Engineering","Administration","Surveyor Helper","");
INSERT INTO inv_employee VALUES("1071","ENG-001096","Md.Ali Zinnah","E-Engineering Ltd.","E-Engineering","Administration","Lab Techinacian","");
INSERT INTO inv_employee VALUES("1072","ENG-001097","Md.Aktheruzzaman","E-Engineering Ltd.","E-Engineering","Administration","Supervisor","");
INSERT INTO inv_employee VALUES("1073","ENG-001098","Md.Nurul Hoque","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1074","ENG-001099","MD Abul Kawsar","E-Engineering Ltd.","E-Engineering","Administration","Lab Techinacian","");
INSERT INTO inv_employee VALUES("1075","ENG-001100","Mohahham Sultan Ahmad Badsha","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1076","ENG-001101","Md.Romzan Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1077","ENG-001102","Md.Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1078","ENG-001103","Md.Al-Mamun","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("1079","ENG-001104","Md.Sourav","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1080","ENG-001105","Md.Elias","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1081","ENG-001106","Md.Saiful Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Operator","");
INSERT INTO inv_employee VALUES("1082","ENG-001107","Mustak Ahammed","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1083","ENG-001108","Md.Sohag Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1084","ENG-001109","Md.Roni Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1085","ENG-001110","Md.Ujjol Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1086","ENG-001111","Md.Washim Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1087","ENG-001112","Md.Shahabuddin Hawlader","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1088","ENG-001113","Md.Keramot Sarder","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1089","ENG-001114","Md.Anower Sarder","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1090","ENG-001115","Md.Nurun Nabi","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("1091","ENG-001116","Md.Rasel ","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("1092","ENG-001117","Md.Shahjamal Mondol","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("1093","ENG-001118","Md.Tohidul Islam ","E-Engineering Ltd.","E-Engineering","Mechanical","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("1094","ENG-001119","Md.Shakil Ahamed","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1095","ENG-001120","Md.Hillal Sheikh","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1096","ENG-001121","Pavel Khondokar","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1097","ENG-001122","Md.Rafiqul","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1098","ENG-001123","Abdul Alim","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1099","ENG-001124","Md.Baharul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1100","ENG-001125","Md.Imran Kha","E-Engineering Ltd.","E-Engineering","Mechanical","Dump Truck Driver","");
INSERT INTO inv_employee VALUES("1101","ENG-001126","Md.Taher","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1102","ENG-001127","Ebrahim Khalil","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1103","ENG-001128","Md.Masud Rana","E-Engineering Ltd.","E-Engineering","Administration","Assistant Electrician","");
INSERT INTO inv_employee VALUES("1104","ENG-001129","Md.Emran Uddin","E-Engineering Ltd.","E-Engineering","Administration","Assistant Speed Boat Operator","");
INSERT INTO inv_employee VALUES("1105","ENG-001130","Md.Delowar","E-Engineering Ltd.","E-Engineering","Administration","Assistant Speed Boat Operator","");
INSERT INTO inv_employee VALUES("1106","ENG-001131","Md.Shofiqul Islam","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1107","ENG-001132","Md.Asadul Morol","E-Engineering Ltd.","E-Engineering","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("1108","ENG-001133","Abul Kasem","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1109","ENG-001134","Shakwat","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1110","ENG-001135","Saiful","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1111","ENG-001136","Parvez","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1112","ENG-001137","Md.Sujon","E-Engineering Ltd.","E-Engineering","Administration","Fuel Distributer Loader","");
INSERT INTO inv_employee VALUES("1113","ENG-001138","Md.saiful Islam Rasel","E-Engineering Ltd.","E-Engineering","Administration","Fuel Distributer Loader","");
INSERT INTO inv_employee VALUES("1114","ENG-001139","Md.Noman Uddin","E-Engineering Ltd.","E-Engineering","Administration","Field Assistant","");
INSERT INTO inv_employee VALUES("1115","ENG-001140","Md.Sadhin Akond","E-Engineering Ltd.","E-Engineering","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("1116","ENG-001141","Md.Helal Uddin ","E-Engineering Ltd.","E-Engineering","Administration","Operator","");
INSERT INTO inv_employee VALUES("1117","ENG-001142","Md Rohum Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1118","ENG-001143","Md Rezaul Karim","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("1119","ENG-001144","Sree Prodip Kumar Mondal","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1120","ENG-001145","Md Idris Khan","E-Engineering Ltd.","E-Engineering","Mechanical","Auto Electrician","");
INSERT INTO inv_employee VALUES("1121","ENG-001146","Gazi Islam Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Senior Mechanic","");
INSERT INTO inv_employee VALUES("1122","ENG-001147","Ripon","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("1123","ENG-001148","Md Perves Alam","E-Engineering Ltd.","E-Engineering","Administration","Surveyor Helper","");
INSERT INTO inv_employee VALUES("1124","ENG-001149","Md Samiul Parvez","E-Engineering Ltd.","E-Engineering","Administration","Assistant Lab Technician","");
INSERT INTO inv_employee VALUES("1125","ENG-001150","Md Mahabubur Rahman","E-Engineering Ltd.","E-Engineering","Administration","Surveyor Helper","");
INSERT INTO inv_employee VALUES("1126","ENG-001151","Md Abdul Motin","E-Engineering Ltd.","E-Engineering","Administration","Peon","");
INSERT INTO inv_employee VALUES("1127","ENG-001152","Md Maksudur Rahman","E-Engineering Ltd.","E-Engineering","Administration","Imam","");
INSERT INTO inv_employee VALUES("1128","ENG-001153","Md Ibadot Hossain","E-Engineering Ltd.","E-Engineering","Administration","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("1129","ENG-001154","Riaz Mondol","E-Engineering Ltd.","E-Engineering","Administration","Electrician","");
INSERT INTO inv_employee VALUES("1130","ENG-001155","Alomgir","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1131","ENG-001156","Md Shahidul Islam Riman","E-Engineering Ltd.","E-Engineering","Administration","Store Keeper","");
INSERT INTO inv_employee VALUES("1132","ENG-001157","Mohammad showkat Osman","E-Engineering Ltd.","E-Engineering","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("1133","ENG-001158","Jillur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Surveyor Helper","");
INSERT INTO inv_employee VALUES("1134","ENG-001159","Md Tareq Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Surveyor Helper","");
INSERT INTO inv_employee VALUES("1135","ENG-001160","Md Rubel Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Surveyor Helper","");
INSERT INTO inv_employee VALUES("1136","ENG-001161","Md shajahan","E-Engineering Ltd.","E-Engineering","Administration","Officer","");
INSERT INTO inv_employee VALUES("1137","ENG-001162","Md Moin Uddin Shekh","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1138","ENG-001163","Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1139","ENG-001164","Md.Raju mia","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1140","ENG-001165","Md Mostafa Dafadar","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1141","ENG-001166","Md Hemaeat","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1142","ENG-001167","Shahab Uddin ","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Site Supervisor","");
INSERT INTO inv_employee VALUES("1143","ENG-001168","Md Ismail Hossen","E-Engineering Ltd.","E-Engineering","Administration","Assistant Lab Technician","");
INSERT INTO inv_employee VALUES("1144","ENG-001169","Md Mir Mohammad Sujon","E-Engineering Ltd.","E-Engineering","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("1145","ENG-001170","MD Shafiqul Islam","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1146","ENG-001171","MD Rohomottullah","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1147","ENG-001172","Md Hridoy Miya","E-Engineering Ltd.","E-Engineering","Administration","Crew","");
INSERT INTO inv_employee VALUES("1148","ENG-001173","Md Morshid Alom","E-Engineering Ltd.","E-Engineering","Administration","Electrician","");
INSERT INTO inv_employee VALUES("1149","ENG-001174","Sazzat Munshi","E-Engineering Ltd.","E-Engineering","Mechanical","Pump Operator","");
INSERT INTO inv_employee VALUES("1150","ENG-001175","MD Rajib Shekh","E-Engineering Ltd.","E-Engineering","Mechanical","Pump Operator","");
INSERT INTO inv_employee VALUES("1151","ENG-001176","Md Abdul Mojid","E-Engineering Ltd.","E-Engineering","Mechanical","Pump Operator","");
INSERT INTO inv_employee VALUES("1152","ENG-001177","MD Saddam Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("1153","ENG-001178","Sakib Hossen","E-Engineering Ltd.","E-Engineering","Mechanical","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("1154","ENG-001179","Awal Hosen","E-Engineering Ltd.","E-Engineering","Mechanical","Crane Helper","");
INSERT INTO inv_employee VALUES("1155","ENG-001180","Md Shihab","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("1156","ENG-001181","Md Musa Miah","E-Engineering Ltd.","E-Engineering","Mechanical","Rigger","");
INSERT INTO inv_employee VALUES("1157","ENG-001182","Md Bablu","E-Engineering Ltd.","E-Engineering","Mechanical","Pump Operator","");
INSERT INTO inv_employee VALUES("1158","ENG-001183","Md Mamun Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Rigger","");
INSERT INTO inv_employee VALUES("1159","ENG-001184","Md Hafezul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Electrician","");
INSERT INTO inv_employee VALUES("1160","ENG-001185","Md Ziaur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Pump Operator","");
INSERT INTO inv_employee VALUES("1161","ENG-001186","MD Akbar Hossain","E-Engineering Ltd.","E-Engineering","Administration","Helper","");
INSERT INTO inv_employee VALUES("1162","ENG-001187","Md Aminur Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("1163","ENG-001188","Md Nur Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Helper","");
INSERT INTO inv_employee VALUES("1164","ENG-001189","Emon Ali","E-Engineering Ltd.","E-Engineering","Maintenance","Welder","");
INSERT INTO inv_employee VALUES("1165","ENG-001190","MD Saber Ul Islam","E-Engineering Ltd.","E-Engineering","Marine","Junior Engineer","");
INSERT INTO inv_employee VALUES("1166","ENG-001191","Md Inzamamul Haque","E-Engineering Ltd.","E-Engineering","Marine","Manager","");
INSERT INTO inv_employee VALUES("1167","ENG-001192","Md Amzad Hossain","E-Engineering Ltd.","E-Engineering","Maintenance","Welder","");
INSERT INTO inv_employee VALUES("1168","ENG-001193","Md Enamul","E-Engineering Ltd.","E-Engineering","Marine","Welder","");
INSERT INTO inv_employee VALUES("1169","ENG-001194","F Mohammad Arif","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1170","ENG-001195","Md Abdul Fattah Khan","E-Engineering Ltd.","E-Engineering","Civil","Executive Director","");
INSERT INTO inv_employee VALUES("1171","ENG-001196","MD. Shamsul Alam","E-Engineering Ltd.","E-Engineering","Civil","Project Manager","");
INSERT INTO inv_employee VALUES("1172","ENG-001197","Md Masum Molla","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1173","ENG-001198","Jewel Rana","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1174","ENG-001199","Md Sajahan Mrida","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1175","ENG-001200","Md Ashiqur Rahaman","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1176","ENG-001201","Md Jalal Miah","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1177","ENG-001202","Md Touhidul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Crane Operator","");
INSERT INTO inv_employee VALUES("1178","ENG-001203","Rohol Amin","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1179","ENG-001204","Md Jahidul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("1180","ENG-001205","Md AB Jolil","E-Engineering Ltd.","E-Engineering","Operation","Helper","");
INSERT INTO inv_employee VALUES("1181","ENG-001206","Md Abdur Barek","E-Engineering Ltd.","E-Engineering","Mechanical","Diesel Hammer Operator","");
INSERT INTO inv_employee VALUES("1182","ENG-001207","MD Rajib Mia","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("1183","ENG-001208","Md Rasel Sekh","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanic","");
INSERT INTO inv_employee VALUES("1184","ENG-001209","Md Shahadad Hossion","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1185","ENG-001210","Aminur Rahman ","E-Engineering Ltd.","E-Engineering","Mechanical","Hydraulic Rotary Drilling Operator","");
INSERT INTO inv_employee VALUES("1186","ENG-001211","Ahmad Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Crane Operator","");
INSERT INTO inv_employee VALUES("1187","ENG-001212","Junaid Zaman Riyadh","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1188","ENG-001213","Md Mahfuj Akando","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1189","ENG-001214","Md. Hasan Tareq","E-Engineering Ltd.","E-Engineering","Civil","Deputy Project Manager","");
INSERT INTO inv_employee VALUES("1190","ENG-001215","Muhammad Habibur","E-Engineering Ltd.","E-Engineering","Administration","Rigger","");
INSERT INTO inv_employee VALUES("1191","ENG-001216","Azid Ali","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1192","ENG-001217","S M Afroze  Al Masum","E-Engineering Ltd.","E-Engineering","Market Development","Assistant Site Engineer","");
INSERT INTO inv_employee VALUES("1193","ENG-001218","Md Mussa Mia","E-Engineering Ltd.","E-Engineering","Administration","Rigger","");
INSERT INTO inv_employee VALUES("1194","ENG-001219","Md Jahedur","E-Engineering Ltd.","E-Engineering","Administration","Rigger","");
INSERT INTO inv_employee VALUES("1195","ENG-001220","Md Hachnain Ahemed","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1196","ENG-001221","Nasir uddin","E-Engineering Ltd.","E-Engineering","Administration","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("1197","ENG-001222","Md Rarel Babu","E-Engineering Ltd.","E-Engineering","Mechanical","Wheel Loader Operator","");
INSERT INTO inv_employee VALUES("1198","ENG-001223","Burhan uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1199","ENG-001224","Johurul Islam","E-Engineering Ltd.","E-Engineering","Administration","Electrician","");
INSERT INTO inv_employee VALUES("1200","ENG-001225","Mosharof Hossain","E-Engineering Ltd.","E-Engineering","Administration","Peon","");
INSERT INTO inv_employee VALUES("1201","ENG-001226","Md Hafejul Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Electrician","");
INSERT INTO inv_employee VALUES("1202","ENG-001227","Nazrul Fakir","E-Engineering Ltd.","E-Engineering","Operation","Bulldozer Operator","");
INSERT INTO inv_employee VALUES("1203","ENG-001228","Md Marufur Rahman","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1204","ENG-001229","Md Unus Ali Nayan","E-Engineering Ltd.","E-Engineering","Mechanical","Concrete Pump Operator","");
INSERT INTO inv_employee VALUES("1205","ENG-001230","Md Al Amin Hossain Masum Billah","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1206","ENG-001231","Md Baker Hussain","E-Engineering Ltd.","E-Engineering","Operation","Tractor Driver","");
INSERT INTO inv_employee VALUES("1207","ENG-001232","Md Harun Khan ","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1208","ENG-001233","Sadman Hasnat Ishmam","E-Engineering Ltd.","E-Engineering","Business Development","Assistant Manager","");
INSERT INTO inv_employee VALUES("1209","ENG-001234","Md Emon Ali Eddris","E-Engineering Ltd.","E-Engineering","Administration","Mechanical Helper","");
INSERT INTO inv_employee VALUES("1210","ENG-001235","Arif","E-Engineering Ltd.","E-Engineering","Administration","Mechanical Helper","");
INSERT INTO inv_employee VALUES("1211","ENG-001236","Md Mizanur Rahman","E-Engineering Ltd.","E-Engineering","Mechanical","Excavator Operator","");
INSERT INTO inv_employee VALUES("1212","ENG-001237","Razzaque","E-Engineering Ltd.","E-Engineering","Mechanical","Low Bed Helper","");
INSERT INTO inv_employee VALUES("1213","ENG-001238","Md Helal Uddin","E-Engineering Ltd.","E-Engineering","Mechanical","Diesel Hammer Operator","");
INSERT INTO inv_employee VALUES("1214","ENG-001239","Hakim Ali","E-Engineering Ltd.","E-Engineering","Mechanical","Rigger","");
INSERT INTO inv_employee VALUES("1215","ENG-001240","Md Imran Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Welder","");
INSERT INTO inv_employee VALUES("1216","ENG-001241","Sheikh Rubel","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1217","ENG-001242","Md Mizanur Jomadder","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1218","ENG-001243","Kamruzzaman","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("1219","ENG-001244","Saidul Islam Rezve ","E-Engineering Ltd.","E-Engineering","Mechanical","Manager","");
INSERT INTO inv_employee VALUES("1220","ENG-001245","Md Abul Kamal Mondol","E-Engineering Ltd.","E-Engineering","Administration","Welder","");
INSERT INTO inv_employee VALUES("1221","ENG-001246","Md Amirul Islam","E-Engineering Ltd.","E-Engineering","Administration","Cook","");
INSERT INTO inv_employee VALUES("1222","ENG-001247","Md Masud Molla","E-Engineering Ltd.","E-Engineering","Administration","Tractor Driver","");
INSERT INTO inv_employee VALUES("1223","ENG-001248","Milon","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1224","ENG-001249","Amir Hossen","E-Engineering Ltd.","E-Engineering","Administration","Night Guard","");
INSERT INTO inv_employee VALUES("1225","ENG-001250","Md Sha Alam ","E-Engineering Ltd.","E-Engineering","Mechanical","Mechanic","");
INSERT INTO inv_employee VALUES("1226","ENG-001251","Md Liakot Sheikh ","E-Engineering Ltd.","E-Engineering","Mechanical","Transit Mixer Helper","");
INSERT INTO inv_employee VALUES("1227","ENG-001252","Md Abu rayhan","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1228","ENG-001253","Rajib","E-Engineering Ltd.","E-Engineering","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1229","ENG-001254","Raja Khan","E-Engineering Ltd.","E-Engineering","Mechanical","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("1230","ENG-001255","Anowar Hossain","E-Engineering Ltd.","E-Engineering","Mechanical","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("1231","ENG-001256","Kausar Sheikh","E-Engineering Ltd.","E-Engineering","Administration","Driver","");
INSERT INTO inv_employee VALUES("1232","ENG-001257","Md Shamim","E-Engineering Ltd.","E-Engineering","Mechanical","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("1233","ENG-001258","Md Sakhoyat Hossen","E-Engineering Ltd.","E-Engineering","Administration","Batching Plant Helper","");
INSERT INTO inv_employee VALUES("1234","ENG-001259","Abdul Basit","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("1235","ENG-001260","Afra Azmain","E-Engineering Ltd.","E-Engineering","Operation","Assistant Manager","");
INSERT INTO inv_employee VALUES("1236","ENG-001261","Md Sadequl Islam","E-Engineering Ltd.","E-Engineering","Mechanical","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("1237","ENG-001262","Md Ismail Hossen","E-Engineering Ltd.","E-Engineering","Administration","Lab Techinacian","");
INSERT INTO inv_employee VALUES("1238","ENG-001263","Akber Ali Fakir","E-Engineering Ltd.","E-Engineering","Administration","Lab Techinacian","");
INSERT INTO inv_employee VALUES("1239","ENG-001264","Saju Barua","E-Engineering Ltd.","E-Engineering","Mechanical","Auto Electrician","");
INSERT INTO inv_employee VALUES("1240","ENG-001265","Nurul Amin ","E-Engineering Ltd.","E-Engineering","Mechanical","Cook","");
INSERT INTO inv_employee VALUES("1241","ENG-001266","Abdul Basit","E-Engineering Ltd.","E-Engineering","Mechanical","Tractor Driver","");
INSERT INTO inv_employee VALUES("1242","IEL-000001","Rubya Chowdhury","88 Innovations Engineering Ltd.","Blank","Management","Chairman","");
INSERT INTO inv_employee VALUES("1243","IEL-000002","Tarafder Md Ruhul Saif","88 Innovations Engineering Ltd.","Blank","Management","Managing Director","");
INSERT INTO inv_employee VALUES("1244","IEL-000003","Tarafder Md. Ruhul Amin","88 Innovations Engineering Ltd.","Blank","Management","Director","");
INSERT INTO inv_employee VALUES("1245","IEL-000004","Tarafder Nigar Sultana","88 Innovations Engineering Ltd.","Blank","Management","Director","");
INSERT INTO inv_employee VALUES("1246","IEL-000005","Md Jobaer Kabir","88 Innovations Engineering Ltd.","Blank","Management","Chief Executive Officer","");
INSERT INTO inv_employee VALUES("1247","IEL-000006","Nurul Amin","88 Innovations Engineering Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("1248","IEL-000007","Md Farhad Ali","88 Innovations Engineering Ltd.","Blank","Software Development","Software Engineer","");
INSERT INTO inv_employee VALUES("1249","IEL-000008","Sayed Ahmed","88 Innovations Engineering Ltd.","Blank","Management","Graphic Designer","");
INSERT INTO inv_employee VALUES("1250","IEL-000009","Md Shahin Alam","88 Innovations Engineering Ltd.","Blank","Management","Officer","");
INSERT INTO inv_employee VALUES("1251","IEL-000010","Md Jim AR Rafi","88 Innovations Engineering Ltd.","Blank","Software Development","Programmer","");
INSERT INTO inv_employee VALUES("1252","IEL-000011","Abdullah Al Mamun","88 Innovations Engineering Ltd.","Blank","Software Development","Trainee Programmer","");
INSERT INTO inv_employee VALUES("1253","IEL-000012","Md. Abdul Alim","88 Innovations Engineering Ltd.","Blank","Administration","Assistant","");
INSERT INTO inv_employee VALUES("1254","IEL-000013","Md Rahamat Ullah Akhand","88 Innovations Engineering Ltd.","Blank","Administration","Technician","");
INSERT INTO inv_employee VALUES("1255","IEL-000014","Pulok","88 Innovations Engineering Ltd.","Blank","Software Development","Trainee Programmer","");
INSERT INTO inv_employee VALUES("1256","IEL-000015","Md Kowsar Hossain Sakib","88 Innovations Engineering Ltd.","Blank","Software Development","Trainee Programmer","");
INSERT INTO inv_employee VALUES("1257","IEL-000016","Muhammed Fakhrul Islam","88 Innovations Engineering Ltd.","Blank","Software Development","Senior Manager","");
INSERT INTO inv_employee VALUES("1258","IEL-000017","Atiqur Rahman Bhuiyan","88 Innovations Engineering Ltd.","Blank","Software Development","Executive","");
INSERT INTO inv_employee VALUES("1259","IEL-000018","Md Monirul Islam","88 Innovations Engineering Ltd.","Blank","Software Development","Manager","");
INSERT INTO inv_employee VALUES("1260","IEL-000019","Abdullah Al Mamun","88 Innovations Engineering Ltd.","Blank","Software Development","Programmer","");
INSERT INTO inv_employee VALUES("1261","IEL-000020","Md. Babul Farajee","88 Innovations Engineering Ltd.","Blank","Management","Manager","");
INSERT INTO inv_employee VALUES("1262","IEL-000021","Md Anisul Haque","88 Innovations Engineering Ltd.","Blank","IT","Deputy Manager","");
INSERT INTO inv_employee VALUES("1263","IEL-000022","Md. Asik Sikder","88 Innovations Engineering Ltd.","Blank","IT","Officer","");
INSERT INTO inv_employee VALUES("1264","IEL-000023","Ujjal Halder","88 Innovations Engineering Ltd.","Blank","IT","Officer","");
INSERT INTO inv_employee VALUES("1265","IEL-000024","Md. Imam Hossain","88 Innovations Engineering Ltd.","Blank","IT","Deputy Manager","");
INSERT INTO inv_employee VALUES("1266","IEL-000025","Subrata Halder","88 Innovations Engineering Ltd.","Blank","IT","Officer","");
INSERT INTO inv_employee VALUES("1267","IEL-000026","Md Sofiul Azam","88 Innovations Engineering Ltd.","Blank","Creative and Design","Video Editor","");
INSERT INTO inv_employee VALUES("1268","IEL-000027","Abdul Rahman Jamil Chowdhury","88 Innovations Engineering Ltd.","Blank","Software Development","Trainee Programmer","");
INSERT INTO inv_employee VALUES("1269","MPL-000001","Jalal Uddin Ahmed Chowdhury","Maxon Power Ltd.","Maxon Power","Management","Independent Director","");
INSERT INTO inv_employee VALUES("1270","MPL-005406","Jannatun Naima","Maxon Power Ltd.","Maxon Power","Administration","Officer","");
INSERT INTO inv_employee VALUES("1271","MPL-005408","Md Joynul Abedin","Maxon Power Ltd.","Maxon Power","Project","Supervisor","");
INSERT INTO inv_employee VALUES("1272","MPL-005409","Md Ruhul Amin","Maxon Power Ltd.","Maxon Power","Project","Head of Project","");
INSERT INTO inv_employee VALUES("1273","MPL-005410","Md Saiful Alam","Maxon Power Ltd.","Maxon Power","Project","Senior Manager","");
INSERT INTO inv_employee VALUES("1274","MPL-005411","Md. Masud","Maxon Power Ltd.","Maxon Power","Project","Foreman","");
INSERT INTO inv_employee VALUES("1275","MPL-005413","Hossain Imam Chowdhury","Maxon Power Ltd.","Maxon Power","Administration","Manager","");
INSERT INTO inv_employee VALUES("1276","MPL-005414","Md Gias Uddin Akhan","Maxon Power Ltd.","Maxon Power","Finance And Accounts","Deputy Manager","");
INSERT INTO inv_employee VALUES("1277","MPL-005416","Md Shohel Hossain","Maxon Power Ltd.","Maxon Power","Project","Deputy Manager","");
INSERT INTO inv_employee VALUES("1278","MPL-005417","Bissanath Kumar Sadhu","Maxon Power Ltd.","Maxon Power","Project","Deputy Manager","");
INSERT INTO inv_employee VALUES("1279","MPL-005418","Farhana Rahman","Maxon Power Ltd.","Maxon Power","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("1280","MPL-005419","Md Hasan Mahabub","Maxon Power Ltd.","Maxon Power","Project","Logistic Support Officer","");
INSERT INTO inv_employee VALUES("1281","MPL-005420","Md Ashraful Alam","Maxon Power Ltd.","Maxon Power","Project","Senior Manager","");
INSERT INTO inv_employee VALUES("1282","MPL-005421","Md Akrama Al Mamun Khan","Maxon Power Ltd.","Maxon Power","Project","Assistant Manager","");
INSERT INTO inv_employee VALUES("1283","MPL-005423","Md Mahbubur Rahman","Maxon Power Ltd.","Maxon Power","Project","Manager","");
INSERT INTO inv_employee VALUES("1284","MPL-005424","Humayun Kabir","Maxon Power Ltd.","Maxon Power","Administration","Peon","");
INSERT INTO inv_employee VALUES("1285","MPL-005425","Nurun Nobi Chowdhury","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1286","MPL-005426","Aminur Rahman Siddique","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1287","MPL-005427","S.M. Abdul Mannan","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1288","MPL-005428","Md Shamsul Alam","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1289","MPL-005429","Homaira Himu","Maxon Power Ltd.","Generator Sales","Administration","Senior Officer","");
INSERT INTO inv_employee VALUES("1290","MPL-005430","Md. Swapon Chowdhury","Maxon Power Ltd.","Maxon Power","Project","Deputy Manager","");
INSERT INTO inv_employee VALUES("1291","MPL-005431","Md Sajib Sarker","Maxon Power Ltd.","Generator Sales","Administration","Peon","");
INSERT INTO inv_employee VALUES("1292","MPL-005432","Md Faruk Hussain","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1293","MPL-005433","Md Akram Hossain","Maxon Power Ltd.","Generator Sales","Equipment","Executive Director","");
INSERT INTO inv_employee VALUES("1294","MPL-005434","Md. Juyel Miah","Maxon Power Ltd.","Generator Sales","Service","Assistant Manager","");
INSERT INTO inv_employee VALUES("1295","MPL-005435","Abul Kalam Azad","Maxon Power Ltd.","Generator Sales","Service","Senior Manager","");
INSERT INTO inv_employee VALUES("1296","MPL-005436","Md. Nasimul Haque","Maxon Power Ltd.","Generator Sales","Service","Manager","");
INSERT INTO inv_employee VALUES("1297","MPL-005437","Lawrence Baroi","Maxon Power Ltd.","Generator Sales","Service","Deputy Manager","");
INSERT INTO inv_employee VALUES("1298","MPL-005438","Md. Mashiur Rahman","Maxon Power Ltd.","Generator Sales","Service","Assistant Manager","");
INSERT INTO inv_employee VALUES("1299","MPL-005439","Mohammad Akramul Haque Bhuiyan","Maxon Power Ltd.","Generator Sales","Service","Executive","");
INSERT INTO inv_employee VALUES("1300","MPL-005440","Md Abir Hossain Sohag","Maxon Power Ltd.","Generator Sales","Service","Engineer","");
INSERT INTO inv_employee VALUES("1301","MPL-005441","Md Moyan Uddin","Maxon Power Ltd.","Generator Sales","Service","Foreman","");
INSERT INTO inv_employee VALUES("1302","MPL-005442","Md A.K. Azad","Maxon Power Ltd.","Generator Sales","Service","Supervisor","");
INSERT INTO inv_employee VALUES("1303","MPL-005443","Md Nazrul Islam Babu","Maxon Power Ltd.","Generator Sales","Service","Supervisor","");
INSERT INTO inv_employee VALUES("1304","MPL-005444","Nazrul Islam","Maxon Power Ltd.","Generator Sales","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("1305","MPL-005445","Md Rahamatullah","Maxon Power Ltd.","Generator Sales","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("1306","MPL-005446","Most. Papia Khatun","Maxon Power Ltd.","Generator Sales","Service","Senior Officer","");
INSERT INTO inv_employee VALUES("1307","MPL-005447","S M  Saimun Farshed","Maxon Power Ltd.","Generator Sales","Project","Assistant Manager","");
INSERT INTO inv_employee VALUES("1308","MPL-005448","A K M Mainul Hasan","Maxon Power Ltd.","Generator Sales","Administration","Officer","");
INSERT INTO inv_employee VALUES("1309","MPL-005449","Md. Asadul Islam","Maxon Power Ltd.","Generator Sales","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("1310","MPL-005450","Al Amin Sikder","Maxon Power Ltd.","Generator Sales","Administration","Driver","");
INSERT INTO inv_employee VALUES("1311","MPL-005451","Md Forkan Shake","Maxon Power Ltd.","Maxon Power","Administration","Driver","");
INSERT INTO inv_employee VALUES("1312","MPL-005452","Omar Faruque","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1313","MPL-005453","Shadman Sharar","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1314","MPL-005454","Md Sadikin Zime","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1315","MPL-005455","Md. Faisal Hasan","Maxon Power Ltd.","Generator Sales","Service","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1316","MPL-005456","Mohammad Obaidul Haque","Maxon Power Ltd.","Generator Sales","Service","General Manager","");
INSERT INTO inv_employee VALUES("1317","MPL-005457","Md Kamruzzaman","Maxon Power Ltd.","Generator Sales","Equipment","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1318","MPL-005458","Abul Khair","Maxon Power Ltd.","Generator Sales","Equipment","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1319","MPL-005459","Rajiv Kumar Gupta","Maxon Power Ltd.","Generator Sales","Liebherr","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1320","MPL-005460","Md Mizanur Rahman Samrat","Maxon Power Ltd.","Generator Sales","Administration","Driver","");
INSERT INTO inv_employee VALUES("1321","MPL-005461","Mohammed Kamal","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1322","MPL-005462","Farhad Ahmed","Maxon Power Ltd.","Generator Sales","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("1323","MPL-005463","Rajiv Kamal Chowdhury","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Deputy Manager","");
INSERT INTO inv_employee VALUES("1324","MPL-005464","Md. Munna Islam","Maxon Power Ltd.","Generator Sales","Administration","Driver","");
INSERT INTO inv_employee VALUES("1325","MPL-005465","Md Shakib Ali","Maxon Power Ltd.","Generator Sales","Project","Junior Engineer","");
INSERT INTO inv_employee VALUES("1326","MPL-005466","Md Emran Howlader","Maxon Power Ltd.","Generator Sales","Liebherr","Helper","");
INSERT INTO inv_employee VALUES("1327","MPL-005467","Sumon Majumder","Maxon Power Ltd.","Generator Sales","Project","Helper","");
INSERT INTO inv_employee VALUES("1328","MPL-005468","Abul Khair","Maxon Power Ltd.","Generator Sales","Liebherr","Junior Engineer","");
INSERT INTO inv_employee VALUES("1329","MPL-005469","Mohammad Mahabubur Rahman","Maxon Power Ltd.","Generator Sales","Liebherr","Junior Engineer","");
INSERT INTO inv_employee VALUES("1330","MPL-005470","Md. Fazlul Haque","Maxon Power Ltd.","Maxon Power","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("1331","MPL-005471","Nasrin Akter","Maxon Power Ltd.","Generator Sales","Finance And Accounts","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1332","MPL-005472","Masud","Maxon Power Ltd.","Maxon Power","Project","Foreman","");
INSERT INTO inv_employee VALUES("1333","MPL-005473","Md Mahabubur Rahman","Maxon Power Ltd.","Generator Sales","Administration","Driver","");
INSERT INTO inv_employee VALUES("1334","MPL-005474","Tanin Islam ","Maxon Power Ltd.","Maxon Power","Administration","Peon","");
INSERT INTO inv_employee VALUES("1335","MPL-005475","Abul Kalam Azad","Maxon Power Ltd.","Generator Sales","Service","Senior Manager","");
INSERT INTO inv_employee VALUES("1336","MPL-005476","Roni Ahamed","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1337","MPL-005477","Sheikh Khalid Hassan","Maxon Power Ltd.","Generator Sales","Liebherr","Junior Engineer","");
INSERT INTO inv_employee VALUES("1338","MPL-005478","Sheikh Hasibur Rahman","Maxon Power Ltd.","Generator Sales","Liebherr","Junior Engineer","");
INSERT INTO inv_employee VALUES("1339","MPL-005479","Md. Azizul Islam","Maxon Power Ltd.","Generator Sales","Liebherr","Electrician","");
INSERT INTO inv_employee VALUES("1340","MPL-005480","Md. Ismail Sk","Maxon Power Ltd.","Generator Sales","Liebherr","Helper","");
INSERT INTO inv_employee VALUES("1341","MPL-005481","Md Jahir Uddin","Maxon Power Ltd.","Generator Sales","Liebherr","Semi Mechanic","");
INSERT INTO inv_employee VALUES("1342","MPL-005482","Bishwajit Sarker","Maxon Power Ltd.","Generator Sales","Liebherr","Assistant Manager","");
INSERT INTO inv_employee VALUES("1343","MPL-005483","Khondokar Faiz Ahmed ","Maxon Power Ltd.","Generator Sales","Service","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1344","MPL-005484","Md Sohel Mridha","Maxon Power Ltd.","Generator Sales","Administration","Driver","");
INSERT INTO inv_employee VALUES("1345","MPL-005485","Md Anower Hossain","Maxon Power Ltd.","Generator Sales","Service","Foreman","");
INSERT INTO inv_employee VALUES("1346","MPL-005486","Md Shafikul Islam","Maxon Power Ltd.","Generator Sales","Liebherr","Assistant Manager","");
INSERT INTO inv_employee VALUES("1347","MPL-005487","Md A Samad","Maxon Power Ltd.","Generator Sales","Equipment","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1348","MPL-005488","Tanvir Ahmed Uddoy","Maxon Power Ltd.","Generator Sales","Liebherr","Senior Officer","");
INSERT INTO inv_employee VALUES("1349","MPL-005489","Mosarrof Hossain ","Maxon Power Ltd.","Generator Sales","Administration","Driver","");
INSERT INTO inv_employee VALUES("1350","MPL-005490","Abbas Molla","Maxon Power Ltd.","Generator Sales","Project","Peon","");
INSERT INTO inv_employee VALUES("1351","MPL-005491","Md Sarowar Hossain ","Maxon Power Ltd.","Maxon Power","Project","Assistant Engineer","");
INSERT INTO inv_employee VALUES("1352","MPL-005492","Junayed Zahir Chowdhury ","Maxon Power Ltd.","Maxon Power","Project","Assistant Engineer","");
INSERT INTO inv_employee VALUES("1353","MPL-005493","Soad Shajid","Maxon Power Ltd.","Maxon Power","Project","Assistant Engineer","");
INSERT INTO inv_employee VALUES("1354","MPL-005494","Md Golam Rabbani","Maxon Power Ltd.","Maxon Power","Administration","Officer","");
INSERT INTO inv_employee VALUES("1355","MPL-005495","Md Nahidul Islam","Maxon Power Ltd.","Generator Sales","Administration","Cook","");
INSERT INTO inv_employee VALUES("1356","MPL-005496","Md Shmim Khan","Maxon Power Ltd.","Generator Sales","Administration","Driver","");
INSERT INTO inv_employee VALUES("1357","MPL-005497","Mohammad Saifur Rahman","Maxon Power Ltd.","Maxon Power","Management","Independent Director","");
INSERT INTO inv_employee VALUES("1358","MPL-005498","Md Belal Hossain","Maxon Power Ltd.","Generator Sales","Liebherr","Crane Operator","");
INSERT INTO inv_employee VALUES("1359","MPL-005499","Md Hayatunnabi Khan","Maxon Power Ltd.","Generator Sales","Service","Head of Customer Service","");
INSERT INTO inv_employee VALUES("1360","MPL-005500","Md Abu Hena Mustafa","Maxon Power Ltd.","Generator Sales","Liebherr","General Manager","");
INSERT INTO inv_employee VALUES("1361","MPL-005501","Md Jakaria Shakh","Maxon Power Ltd.","Generator Sales","Liebherr","Crane Operator","");
INSERT INTO inv_employee VALUES("1362","MPL-005502","Aminur Rahman ","Maxon Power Ltd.","Generator Sales","Liebherr","Hydraulic Rotary Drilling Operator","");
INSERT INTO inv_employee VALUES("1363","MPL-005503","Ahmad Ali","Maxon Power Ltd.","Generator Sales","Liebherr","Crane Operator","");
INSERT INTO inv_employee VALUES("1364","MPL-005504","MD Fahim Faysal","Maxon Power Ltd.","Generator Sales","Administration","Peon","");
INSERT INTO inv_employee VALUES("1365","MPL-005505","Jaj Mia","Maxon Power Ltd.","Generator Sales","Administration","Driver","");
INSERT INTO inv_employee VALUES("1366","MPL-005506","Md Rasadul Islam","Maxon Power Ltd.","Generator Sales","Administration","Peon","");
INSERT INTO inv_employee VALUES("1367","MPL-005507","Rakib Ul Hasan","Maxon Power Ltd.","Maxon Rental Solution","Equipment Rental","Manager","");
INSERT INTO inv_employee VALUES("1368","MPL-005508","Arun Jodder","Maxon Power Ltd.","Generator Sales","Liebherr","Service Engineer","");
INSERT INTO inv_employee VALUES("1369","MPL-005509","Muhammad Nazmul Huda","Maxon Power Ltd.","Generator Sales","Liebherr","Assistant Engineer","");
INSERT INTO inv_employee VALUES("1370","MPL-005510","Md Rahamatullah","Maxon Power Ltd.","Generator Sales","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("1371","MPL-005511","Md Nasir Uddin Akand","Maxon Power Ltd.","Generator Sales","Liebherr","Auto Electrician","");
INSERT INTO inv_employee VALUES("1372","MPL-005512","Md Masum Mia","Maxon Power Ltd.","Maxon Power","Administration","Driver","");
INSERT INTO inv_employee VALUES("1373","MPL-005513","Khorshed Alam","Maxon Power Ltd.","Generator Sales","Administration","Driver","");
INSERT INTO inv_employee VALUES("1374","MPL-005514","Cokun Chandro Mondol","Maxon Power Ltd.","Generator Sales","Sales And Marketing","Deputy Manager","");
INSERT INTO inv_employee VALUES("1375","SEML-000001","Sajal Kumar Biswas","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Manager","");
INSERT INTO inv_employee VALUES("1376","SEML-000003","Md. Mashfiqur Rahman","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1377","SEML-000004","Md Riazul Islam","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Deputy Manager","");
INSERT INTO inv_employee VALUES("1378","SEML-000006","Md. Jafar Imam Khan","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Deputy Manager","");
INSERT INTO inv_employee VALUES("1379","SEML-000009","Md Imran","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Service Technician","");
INSERT INTO inv_employee VALUES("1380","SEML-000010","Sultan Mahmud","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Senior Manager","");
INSERT INTO inv_employee VALUES("1381","SEML-000011","Md. Habibur Rahman","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Deputy Manager","");
INSERT INTO inv_employee VALUES("1382","SEML-000012","Md Mizanur Rahman","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Senior Technician","");
INSERT INTO inv_employee VALUES("1383","SEML-000013","Md Abu Sayed","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Senior Technician","");
INSERT INTO inv_employee VALUES("1384","SEML-000014","Syeda Rowshan Ara","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1385","SEML-000015","Md Sahadat Hossain","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1386","SEML-000016","Md Farhad Uddin","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Deputy Manager","");
INSERT INTO inv_employee VALUES("1387","SEML-000017","Bishwajit Sarker","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1388","SEML-000018","Md Saidur Rahman Sarker","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Deputy Manager","");
INSERT INTO inv_employee VALUES("1389","SEML-000019","Abdullah-Al- Nahian","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1390","SEML-000020","Dabbroto Kundu","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Technician","");
INSERT INTO inv_employee VALUES("1391","SEML-000021","Md Zashim Uddin","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Supervisor","");
INSERT INTO inv_employee VALUES("1392","SEML-000025","Tania Akther","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1393","SEML-000027","Asha Akther","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1394","SEML-000028","Sufia Akther","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1395","SEML-000029","Md Robin","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1396","SEML-000031","Md Shaiful Al Mamun","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Supervisor","");
INSERT INTO inv_employee VALUES("1397","SEML-000032","Eti Akter","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1398","SEML-000033","Fatima Akter Lima","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1399","SEML-000037","Md. Mohiuddin Faruk","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1400","SEML-000040","Md Sayeid","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Technician","");
INSERT INTO inv_employee VALUES("1401","SEML-000043","Md Jobayer","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Junior Technician","");
INSERT INTO inv_employee VALUES("1402","SEML-000044","Md Nuruzzaman","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Junior Technician","");
INSERT INTO inv_employee VALUES("1403","SEML-000045","Taha Yasir","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1404","SEML-000046","Md. Nazmul Haque","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1405","SEML-000047","Anthony Das","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Supervisor","");
INSERT INTO inv_employee VALUES("1406","SEML-000048","Md Nazmul Hossain Mollah","Saif Electrical Manufacturing Ltd.","Blank","Purchase And Procurement","Officer","");
INSERT INTO inv_employee VALUES("1407","SEML-000049","Fatema Akter","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1408","SEML-000050","Nazmul Haque","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Senior Technician","");
INSERT INTO inv_employee VALUES("1409","SEML-000052","Muhammad Rakib Hasan","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1410","SEML-000053","Ashik Ullah","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Technician","");
INSERT INTO inv_employee VALUES("1411","SEML-000054","Tanvir Mahtab","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Supervisor","");
INSERT INTO inv_employee VALUES("1412","SEML-000055","Md Nobin","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Welder","");
INSERT INTO inv_employee VALUES("1413","SEML-000056","Nasir Uddin Badal","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1414","SEML-000058","Md. Jayed Iqbal","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1415","SEML-000060","Md Saiful Islam","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1416","SEML-000061","Md Naimur Rahman","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Technician","");
INSERT INTO inv_employee VALUES("1417","SEML-000062","A. G. M. Saifullah","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1418","SEML-000063","Md. Rifat Hossen Rocky","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Helper","");
INSERT INTO inv_employee VALUES("1419","SEML-000064","Pawul Biswas","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1420","SEML-000066","Md. Roni","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1421","SEML-000067","Ratan Rai","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1422","SEML-000068","Samsuddin Akando","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1423","SEML-000069","Junawed Hossain","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1424","SEML-000070","Md Rakib Hossain","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Welder","");
INSERT INTO inv_employee VALUES("1425","SEML-000071","Najmul Islam Rasel","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1426","SEML-000072","Md. Badal Hossain","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Welder","");
INSERT INTO inv_employee VALUES("1427","SEML-000073","Md. Shah Alam Molla","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Junior Welder","");
INSERT INTO inv_employee VALUES("1428","SEML-000074","Md Amaah","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1429","SEML-000075","Sokina Akter","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Junior Technician","");
INSERT INTO inv_employee VALUES("1430","SEML-000077","Rafika Islam","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Junior Technician","");
INSERT INTO inv_employee VALUES("1431","SEML-000078","Mayna Akter Maly","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Junior Technician","");
INSERT INTO inv_employee VALUES("1432","SEML-000079","Tania Akhter","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Junior Technician","");
INSERT INTO inv_employee VALUES("1433","SEML-000080","Juman Narak","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1434","SEML-000081","Dewan Morsed","Saif Electrical Manufacturing Ltd.","Blank","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("1435","SEML-000082","Md. Ripon Miah","Saif Electrical Manufacturing Ltd.","Blank","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("1436","SEML-000083","Imam Hossain Mizan","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Technician","");
INSERT INTO inv_employee VALUES("1437","SEML-000084","Md Mahmudul Hasan","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Senior Technician","");
INSERT INTO inv_employee VALUES("1438","SEML-000085","Md Mahabur Rahman","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Technician","");
INSERT INTO inv_employee VALUES("1439","SEML-000086","Md Ribu Mia","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1440","SEML-000087","Md Bijoy Biplob","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1441","SEML-000088","Md Fireejul Islam","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1442","SEML-000089","Shamim Sarker","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1443","SEML-000090","Abdul Awal","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Welder","");
INSERT INTO inv_employee VALUES("1444","SEML-000091","Md Ashikur Rahman","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1445","SEML-000092","Md Mofidul Islam Shohag","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1446","SEML-000093","Md Monjur Alam","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1447","SEML-000094","Md Kamruzzaman","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1448","SEML-000095","Rifat Hossain","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1449","SEML-000096","Md Mominor Rahman","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Welder","");
INSERT INTO inv_employee VALUES("1450","SEML-000097","Naime Mia","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1451","SEML-000098","Abu Hanif","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Senior Officer","");
INSERT INTO inv_employee VALUES("1452","SEML-000099","Md Jakirul Islam","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Supervisor","");
INSERT INTO inv_employee VALUES("1453","SEML-000100","Nasima Begum","Saif Electrical Manufacturing Ltd.","Blank","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("1454","SEML-000101","Md. Mamun Mondol","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Deputy Manager","");
INSERT INTO inv_employee VALUES("1455","SEML-000102","Md. Shohidul Islam","Saif Electrical Manufacturing Ltd.","Blank","Operation","Manager","");
INSERT INTO inv_employee VALUES("1456","SEML-000103","Md Waliul Bari","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Manager","");
INSERT INTO inv_employee VALUES("1457","SEML-000104","Kazol Chandra Biswas","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1458","SEML-000105","Md Shahin Sheikh","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1459","SEML-000106","Md Juyal Miah","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Welder","");
INSERT INTO inv_employee VALUES("1460","SEML-000107","Md Shahidul Islam Molla","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Senior Technician","");
INSERT INTO inv_employee VALUES("1461","SEML-000108","Most. Monira Akther Moni","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1462","SEML-000109","Jesmin Akter","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1463","SEML-000110","Tumpa Hazra","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1464","SEML-000111","Kazi Shanta","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1465","SEML-000112","Most. Shila Moni","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1466","SEML-000113","Halima Akter","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1467","SEML-000114","Chandni Akter Lima","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1468","SEML-000115","Tanzila Akter","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1469","SEML-000116","Subaita Akter Mukta","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1470","SEML-000117","Md. Shamsul Islam","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1471","SEML-000118","Md. Shohdul Islam","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Technician","");
INSERT INTO inv_employee VALUES("1472","SEML-000119","Shawon Mohammad Shahryiar","Saif Electrical Manufacturing Ltd.","Blank","Operation","Senior Manager","");
INSERT INTO inv_employee VALUES("1473","SEML-000120","Laboni Khatun","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1474","SEML-000121","Soroar Hossain","Saif Electrical Manufacturing Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1475","SEML-000122","Md Goalbar Hossen","Saif Electrical Manufacturing Ltd.","Blank","Administration","Helper","");
INSERT INTO inv_employee VALUES("1476","SEML-000123","Nur Mohammad Nuru","Saif Electrical Manufacturing Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1477","SEML-000124","Md Rumman Ahmed","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("1478","SEML-000125","Gazi Md Rafiul Hassan","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("1479","SEML-000126","Md Kazmir Hossain Khan","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("1480","SEML-000127","Md Mehedi Hasan","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("1481","SEML-000128","Mohammad Mohin Parves","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1482","SEML-000129","Md Emran Ahsan","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("1483","SEML-000130","Nuruzzaman Khan","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1484","SEML-000131","Mohammad Shiam Hossain","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("1485","SEML-000132","Mir Rubel Mia","Saif Electrical Manufacturing Ltd.","Blank","Management Information System","Manager","");
INSERT INTO inv_employee VALUES("1486","SEML-000133","Ashrafi Riaz","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1487","SEML-000134","Hazrat Ali","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1488","SEML-000135","Nasim","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1489","SEML-000136","Md Mahabub Khan","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Welder","");
INSERT INTO inv_employee VALUES("1490","SEML-000137","Motin Bapary","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Cleaner","");
INSERT INTO inv_employee VALUES("1491","SEML-000138","Motin Bapary","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Cleaner","");
INSERT INTO inv_employee VALUES("1492","SEML-000139","Md Hasan","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Welder","");
INSERT INTO inv_employee VALUES("1493","SEML-000140","Abdul Latif","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1494","SEML-000141","Hamid Ullah","Saif Electrical Manufacturing Ltd.","Blank","Finance And Accounts","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1495","SEML-000142","Hamid Ullah","Saif Electrical Manufacturing Ltd.","Blank","Finance And Accounts","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1496","SEML-000143","Md Alamgir Hossain","Saif Electrical Manufacturing Ltd.","Blank","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("1497","SEML-000144","Md Alamgir Hossain","Saif Electrical Manufacturing Ltd.","Blank","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("1498","SEML-000145","Md Joynal Abedin","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Deputy Manager","");
INSERT INTO inv_employee VALUES("1499","SEML-000146","Md Sujon Miah","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Foreman","");
INSERT INTO inv_employee VALUES("1500","SEML-000147","Md Alamin Bagmer","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1501","SEML-000148","Anowar Hossain ","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1502","SEML-000149","Easin Akond","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1503","SEML-000150","Sohel Rana ","Saif Electrical Manufacturing Ltd.","Blank","Pole Fabrication","Helper","");
INSERT INTO inv_employee VALUES("1504","SEML-000151","M A Hashim Bhuiyan","Saif Electrical Manufacturing Ltd.","Blank","Sales And Marketing","General Manager","");
INSERT INTO inv_employee VALUES("1505","SEML-000152","Mohammad Shahidul Alam Miah","Saif Electrical Manufacturing Ltd.","Blank","Operation","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("1506","SEML-000153","Syed Abdul Baten","Saif Electrical Manufacturing Ltd.","Blank","Administration","Senior Officer","");
INSERT INTO inv_employee VALUES("1507","SEML-000154","Mohammad Atiqur Rahman","Saif Electrical Manufacturing Ltd.","Blank","Service And Maintanance","Officer","");
INSERT INTO inv_employee VALUES("1508","SEML-000155","Sewly Akhter","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Junior Technician","");
INSERT INTO inv_employee VALUES("1509","SEML-000156","Md Rakib Hossen","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Junior Technician","");
INSERT INTO inv_employee VALUES("1510","SEML-000157","Md Samrat Hossen Sizan","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Junior Technician","");
INSERT INTO inv_employee VALUES("1511","SEML-000158","Anita Rani Haolader","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Junior Technician","");
INSERT INTO inv_employee VALUES("1512","SEML-000159","Kawshar Mollah ","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Junior Technician","");
INSERT INTO inv_employee VALUES("1513","SEML-000160","Md Sainul Islam","Saif Electrical Manufacturing Ltd.","Blank","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("1514","SGHF-000001","Md Abul Khaer","SAIF Global Health Foundation","Blank","Operation","Chief Coordinator","");
INSERT INTO inv_employee VALUES("1515","SGHF-000002","Taharina Akter Sathi","SAIF Global Health Foundation","Blank","Administration","Senior Officer","");
INSERT INTO inv_employee VALUES("1516","SGS-000011","Ahmed Sayed Al Fatah","Saif Global Sports Ltd.","Blank","Sports Management Operation","General Manager","");
INSERT INTO inv_employee VALUES("1517","SGS-000012","Assadujjaman Rony","Saif Global Sports Ltd.","Blank","Sports Management Operation","Assistant Manager","");
INSERT INTO inv_employee VALUES("1518","SGS-000013","Mohammad Mohebul Kabir","Saif Global Sports Ltd.","Blank","Sports Management Operation","Assistant Manager","");
INSERT INTO inv_employee VALUES("1519","SGS-000015","Manjur Ibne Habibulla","Saif Global Sports Ltd.","Blank","Sports Management Operation","Executive","");
INSERT INTO inv_employee VALUES("1520","SGS-000017","Tufayel Ahmad","Saif Global Sports Ltd.","Blank","Sports Management Operation","Officer","");
INSERT INTO inv_employee VALUES("1521","SGS-000018","Md Zahirul Hoque","Saif Global Sports Ltd.","Blank","Sports Management Operation","Officer","");
INSERT INTO inv_employee VALUES("1522","SGS-000021","Ariful Islam Raju","Saif Global Sports Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("1523","SGS-000023","Md. Jahir Uddin","Saif Global Sports Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("1524","SGS-000024","Firoza","Saif Global Sports Ltd.","Blank","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("1525","SGS-000025","Nasrin Akter","Saif Global Sports Ltd.","Blank","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("1526","SGS-000026","Khwaja Rakibul Hassan","Saif Global Sports Ltd.","Blank","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("1527","SGS-000027"," Md Mamun Hossain","Saif Global Sports Ltd.","Blank","Sports Management Operation","Assistant Manager","");
INSERT INTO inv_employee VALUES("1528","SGS-000028","Md. Abdul Jalil","Saif Global Sports Ltd.","Blank","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("1529","SGS-000029","Assaduzzaman Roni","Saif Global Sports Ltd.","Blank","Sports Management Operation","Manager","");
INSERT INTO inv_employee VALUES("1530","SGS-000030","Mohebul Kabir Rony ","Saif Global Sports Ltd.","Blank","Sports Management Operation","Deputy Manager","");
INSERT INTO inv_employee VALUES("1531","SLA-000001","Abddulolah Al Helal","Saif Logistic Alliance Ltd.","Blank","Logistics","Assistant Manager","");
INSERT INTO inv_employee VALUES("1532","SLA-000002","Md Delowar Hossain Chy","Saif Logistic Alliance Ltd.","Blank","Logistics","Project Co-Ordinator","");
INSERT INTO inv_employee VALUES("1533","SLA-000003","Md Mijanur Rahman","Saif Logistic Alliance Ltd.","Blank","Logistics","Deputy Manager","");
INSERT INTO inv_employee VALUES("1534","SML-000001","Shaila  Mahmud","SAIF Maritime Ltd.","Blank","Import","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1535","SML-000002","Sindhu Shekhar Das","SAIF Maritime Ltd.","Blank","Import","Executive","");
INSERT INTO inv_employee VALUES("1536","SML-000004","Sahanaz Bagum","SAIF Maritime Ltd.","Blank","Export and Import","Manager","");
INSERT INTO inv_employee VALUES("1537","SML-000005","Md. Nezam Uddin Rakib","SAIF Maritime Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("1538","SML-000006","Md. Abdul Subahan","SAIF Maritime Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1539","SML-000007","Mohammed Shaiful Hoque","SAIF Maritime Ltd.","Blank","Finance And Accounts","Manager","");
INSERT INTO inv_employee VALUES("1540","SML-000008","Md Milton Rana","SAIF Maritime Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1541","SML-000009","Nannu Kholefa","SAIF Maritime Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1542","SML-000010","Md Fazle Rabbi Gazi","SAIF Maritime Ltd.","Blank","Export and Import","Senior Executive","");
INSERT INTO inv_employee VALUES("1543","SML-000011","Foizul Ahmed","SAIF Maritime Ltd.","Blank","Customer Service And Documentation","Senior Officer","");
INSERT INTO inv_employee VALUES("1544","SML-000012","Md Abdullah Jahir","SAIF Maritime Ltd.","Blank","Administration","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("1545","SML-000013","Md Washim ","SAIF Maritime Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1546","SML-000014","Md. Shihabul Alam","SAIF Maritime Ltd.","Blank","Export and Import","Officer","");
INSERT INTO inv_employee VALUES("1547","SML-000015","Muhammad Akib Jabed","SAIF Maritime Ltd.","Blank","Export and Import","Assistant Manager","");
INSERT INTO inv_employee VALUES("1548","SML-000016","Zabanas Silvester Welerian ","SAIF Maritime Ltd.","Blank","Export and Import","General Manager","");
INSERT INTO inv_employee VALUES("1549","SML-000017","Shohel Md Yousuf","SAIF Maritime Ltd.","Blank","Export and Import","Deputy Manager","");
INSERT INTO inv_employee VALUES("1550","SML-000018","Sazid Hasan","SAIF Maritime Ltd.","Blank","Export and Import","Assistant Manager","");
INSERT INTO inv_employee VALUES("1551","SML-000019","Mohammad Newaz Sharif","SAIF Maritime Ltd.","Blank","Operation","Executive","");
INSERT INTO inv_employee VALUES("1552","SML-000020","Sayed Afridi","SAIF Maritime Ltd.","Blank","Import","Head of Customer Service","");
INSERT INTO inv_employee VALUES("1553","SML-000021","Md Abu Taher","SAIF Maritime Ltd.","Blank","Finance And Accounts","Deputy Manager","");
INSERT INTO inv_employee VALUES("1554","SML-000022","Suvankar Sarkar ","SAIF Maritime Ltd.","Blank","Operation","Executive","");
INSERT INTO inv_employee VALUES("1555","SML-000023","Md Monir Hossin","SAIF Maritime Ltd.","Blank","Export and Import","Office Assistant","");
INSERT INTO inv_employee VALUES("1556","SML-000024","Md. Sumon Miah","SAIF Maritime Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("1557","SML-000025","Ruman Das","SAIF Maritime Ltd.","Blank","Import","Executive","");
INSERT INTO inv_employee VALUES("1558","SML-000026","Saif Al Deen","SAIF Maritime Ltd.","Blank","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("1559","SML-000027","Sheikh Shamsul Islam","SAIF Maritime Ltd.","Blank","NVOCC and Freight Forwarding","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("1560","SML-000028","Reazul Hasan","SAIF Maritime Ltd.","Blank","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("1561","SML-000029","Dous Mohammed","SAIF Maritime Ltd.","Blank","Feeder Vessel","Head of Feeder Vessel","");
INSERT INTO inv_employee VALUES("1562","SML-000030","Sumit Palit","SAIF Maritime Ltd.","Blank","Feeder Vessel","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1563","SML-000031","Anamul Hoque Bhuiyan","SAIF Maritime Ltd.","Blank","Customer Service And Documentation","Deputy Manager","");
INSERT INTO inv_employee VALUES("1564","SML-000032","Tanveer Muhammad Nafiul Hussain","SAIF Maritime Ltd.","Blank","Operation","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("1565","SML-000033","Md Samiul Islam","SAIF Maritime Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1566","SML-000034","Md Abu Bakkar Siddique Sagor","SAIF Maritime Ltd.","Blank","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("1567","SML-000035","Saiful Islam","SAIF Maritime Ltd.","Blank","Finance And Accounts","Deputy Manager","");
INSERT INTO inv_employee VALUES("1568","SPHL-000001","Md Minhazul Islam","Saif Port Holdings Ltd.","Blank","Finance And Accounts","General Manager","");
INSERT INTO inv_employee VALUES("1569","SPHL-000002","Khan Md Istique Rana","Saif Port Holdings Ltd.","Blank","Logistics","Senior Officer","");
INSERT INTO inv_employee VALUES("1570","SPHL-000003","Khandaker Md Eheteshamul Islam","Saif Port Holdings Ltd.","Blank","Documentation","Executive","");
INSERT INTO inv_employee VALUES("1571","SPHL-000004","Sree Delip Kumar Das","Saif Port Holdings Ltd.","Blank","Operation","Electrician","");
INSERT INTO inv_employee VALUES("1572","SPHL-000005","Md Jahangir Alam Sheikh","Saif Port Holdings Ltd.","Blank","Operation","Supervisor","");
INSERT INTO inv_employee VALUES("1573","SPHL-000006","Md Shakil Hossain","Saif Port Holdings Ltd.","Blank","Administration","Crane Helper","");
INSERT INTO inv_employee VALUES("1574","SPHL-000007","Kazi Golam Moktader","Saif Port Holdings Ltd.","Blank","Operation","General Manager","");
INSERT INTO inv_employee VALUES("1575","SPHL-000008","Md Shoriful Islam Mridha","Saif Port Holdings Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1576","SPHL-000009","Rakibul Hassan Chowdhury","Saif Port Holdings Ltd.","Blank","Market Development","Officer","");
INSERT INTO inv_employee VALUES("1577","SPHL-000010","Tarafder Md. Ruhul Amin","Saif Port Holdings Ltd.","Blank","Management","Chairman","");
INSERT INTO inv_employee VALUES("1578","SPHL-000011","Tarafder Md. Ruhul Saif","Saif Port Holdings Ltd.","Blank","Management","Managing Director","");
INSERT INTO inv_employee VALUES("1579","SPHL-000012","Tarafder Nigar Sultana","Saif Port Holdings Ltd.","Blank","Management","Director","");
INSERT INTO inv_employee VALUES("1580","SPHL-000013","Rubya Chowdhury","Saif Port Holdings Ltd.","Blank","Management","Director","");
INSERT INTO inv_employee VALUES("1581","SPHL-000014","Tasnim Tarafder","Saif Port Holdings Ltd.","Blank","Management","Director","");
INSERT INTO inv_employee VALUES("1582","SPHL-000015","Md Shafikul Islam Saju","Saif Port Holdings Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1583","SPHL-000016","Md. Jahangir Alam","Saif Port Holdings Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1584","SPHL-000017","Md. Hasan Tareq","Saif Port Holdings Ltd.","Blank","Operation","Deputy Project Manager","");
INSERT INTO inv_employee VALUES("1585","SPHL-000018","Md. Altaf Hossain","Saif Port Holdings Ltd.","Blank","Operation","Director","");
INSERT INTO inv_employee VALUES("1586","SPHL-000019","Pabitra Kumar Sarker","Saif Port Holdings Ltd.","Blank","Operation","General Manager","");
INSERT INTO inv_employee VALUES("1587","SPHL-000020","Md Sakander Molla","Saif Port Holdings Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("1588","SPHL-000021","Md Asadur Rahman","Saif Port Holdings Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("1589","SPHL-000022","Axqs","Saif Port Holdings Ltd.","Blank","Finance And Accounts","Assistant Engine Driver","");
INSERT INTO inv_employee VALUES("1590","SPHL-000023","Md Rubel Hossain","Saif Port Holdings Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1591","SPHL-000024","Md Sahabuddin","Saif Port Holdings Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1592","SPHL-000025","Md Salim Mandal","Saif Port Holdings Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1593","SPHL-000026","Tutul Kha","Saif Port Holdings Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1594","SPHL-000027","Md. Motiar Rahman","Saif Port Holdings Ltd.","Blank","Commercial","Assistant Manager","");
INSERT INTO inv_employee VALUES("1595","SPHL-000028","Hridoy Hossain","Saif Port Holdings Ltd.","Blank","Operation","Junior Technician","");
INSERT INTO inv_employee VALUES("1596","SPHL-000029","Md Sumon","Saif Port Holdings Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1597","SPHL-000030","Md Al Amin","Saif Port Holdings Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1598","SPHL-000031","Md Abu Bakor Siddik ","Saif Port Holdings Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("1599","SPHL-000032","Md Moshiur Rahman","Saif Port Holdings Ltd.","Blank","Operation","Plant Operator","");
INSERT INTO inv_employee VALUES("1600","SPHL-000033","Md Abdul Hamid","Saif Port Holdings Ltd.","Blank","Administration","Store Helper","");
INSERT INTO inv_employee VALUES("1601","SPHL-000034","Md Rifat Hosan Rana","Saif Port Holdings Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("1602","SPHL-000035","Akash Par","Saif Port Holdings Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("1603","SPHL-000036","Noor Moksud Khan","Saif Port Holdings Ltd.","Blank","Finance And Accounts","Senior Manager","");
INSERT INTO inv_employee VALUES("1604","SPL-000001","Tarafder Md. Ruhul Amin","Saif Powertec Ltd.","Corporate","Management","Managing Director","");
INSERT INTO inv_employee VALUES("1605","SPL-000002","Tarafder Nigar Sultana","Saif Powertec Ltd.","Corporate","Management","Chairman","");
INSERT INTO inv_employee VALUES("1606","SPL-000004","Tarafder Md Ruhul Saif","Saif Powertec Ltd.","Battery","Management","Director","");
INSERT INTO inv_employee VALUES("1607","SPL-000005","Mohammed Shawkat Hossain Khan","Saif Powertec Ltd.","Corporate","Management","Director","");
INSERT INTO inv_employee VALUES("1608","SPL-000006","Engr. Md Nasiruddin Chowdhury","Saif Powertec Ltd.","Corporate","Management","Additional Managing Director","");
INSERT INTO inv_employee VALUES("1609","SPL-000008","Mostafizur Rahman","Saif Powertec Ltd.","Corporate","Management","Executive Director","");
INSERT INTO inv_employee VALUES("1610","SPL-000009","Md Hasan Reza","Saif Powertec Ltd.","Corporate","Finance And Accounts","Chief Finance Officer","");
INSERT INTO inv_employee VALUES("1611","SPL-000010","Md. Kamrul Hassan Khan","Saif Powertec Ltd.","Corporate","QMS","Head of QMS","");
INSERT INTO inv_employee VALUES("1612","SPL-000011","Md. Mostafa Kamal Pasha","Saif Powertec Ltd.","Corporate","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("1613","SPL-000012","Tariq Ahmed Khan","Saif Powertec Ltd.","Corporate","Human Resource Management","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1614","SPL-000013","Md Sohail Hashim Khan","Saif Powertec Ltd.","Corporate","Purchase And Procurement","Manager","");
INSERT INTO inv_employee VALUES("1615","SPL-000014","S M Aftab Hossain","Saif Powertec Ltd.","Sub Station","Project","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("1616","SPL-000015","A S M Zulficar Hidar","Saif Powertec Ltd.","Renewable Energy","Operation","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("1617","SPL-000017","Fakir Md. Salehin","Saif Powertec Ltd.","Corporate","Legal","Company Secretary","");
INSERT INTO inv_employee VALUES("1618","SPL-000018","Md. Abdul Mannan","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("1619","SPL-000019","Md. Monirruzzaman","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("1620","SPL-000020","Md. Kamruzzaman","Saif Powertec Ltd.","Equipment","Sales And Marketing","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1621","SPL-000022","Md Habibur Rahman","Saif Powertec Ltd.","Corporate","Administration","Deputy Manager","");
INSERT INTO inv_employee VALUES("1622","SPL-000023","Muhammed Fakhrul Islam","Saif Powertec Ltd.","Corporate","IT","Senior Manager","");
INSERT INTO inv_employee VALUES("1623","SPL-000024","Md Amirul Islam","Saif Powertec Ltd.","Corporate","Commercial","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("1624","SPL-000030","Shaila Mokbul Snigdha","Saif Powertec Ltd.","Corporate","Administration","Executive","");
INSERT INTO inv_employee VALUES("1625","SPL-000031","Md Emdadul Hassan","Saif Powertec Ltd.","Corporate","Finance And Accounts","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1626","SPL-000032","Md Abul Kasem Porag","Saif Powertec Ltd.","Corporate","Finance And Accounts","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1627","SPL-000033","Farhad Ahmed","Saif Powertec Ltd.","Battery","Commercial","Assistant Manager","");
INSERT INTO inv_employee VALUES("1628","SPL-000038","Md Sohidul Islam","Saif Powertec Ltd.","Renewable Energy","Finance And Accounts","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1629","SPL-000044","Md. Fazlur Rahman","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1630","SPL-000048","Md Mahbubur Rahman","Saif Powertec Ltd.","Corporate","Finance And Accounts","Security Officer","");
INSERT INTO inv_employee VALUES("1631","SPL-000056","Naznin Nahar","Saif Powertec Ltd.","Corporate","Human Resource Management","Assistant Manager","");
INSERT INTO inv_employee VALUES("1632","SPL-000061","Md. Mainul Islam","Saif Powertec Ltd.","Corporate","Commercial","Deputy Manager","");
INSERT INTO inv_employee VALUES("1633","SPL-000068","Shakil Mahmud","Saif Powertec Ltd.","Renewable Energy","Finance And Accounts","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1634","SPL-000069","Md Moniruzzaman","Saif Powertec Ltd.","Renewable Energy","Operation","Senior Manager","");
INSERT INTO inv_employee VALUES("1635","SPL-000070","Md Rezaul Karim","Saif Powertec Ltd.","Renewable Energy","Operation","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1636","SPL-000071","Shak Iffat Ara","Saif Powertec Ltd.","Corporate","Human Resource Management","Deputy Manager","");
INSERT INTO inv_employee VALUES("1637","SPL-000074","Jennath Ara","Saif Powertec Ltd.","Battery","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("1638","SPL-000076","Noor E Haque Mejbahtuz Jahan","Saif Powertec Ltd.","Renewable Energy","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("1639","SPL-000077","Md. Shohidul Islam","Saif Powertec Ltd.","Renewable Energy","Operation","Manager","");
INSERT INTO inv_employee VALUES("1640","SPL-000078","Md. Masud Rana","Saif Powertec Ltd.","Renewable Energy","Operation","Deputy Manager","");
INSERT INTO inv_employee VALUES("1641","SPL-000079","Md. Mamun Mondol","Saif Powertec Ltd.","Renewable Energy","Administration","Deputy Manager","");
INSERT INTO inv_employee VALUES("1642","SPL-000081","Md. Subhra Sadik","Saif Powertec Ltd.","Corporate","IT","Assistant Manager","");
INSERT INTO inv_employee VALUES("1643","SPL-000082","Palash Kumer Sarker","Saif Powertec Ltd.","Renewable Energy","Operation","Officer","");
INSERT INTO inv_employee VALUES("1644","SPL-000083","Utpal Chandra Dash","Saif Powertec Ltd.","Renewable Energy","Service And Maintanance","Senior Technician","");
INSERT INTO inv_employee VALUES("1645","SPL-000116","Md. Faisal Hasan","Saif Powertec Ltd.","Spare Parts","Service","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1646","SPL-000117","Md Fulmiah Sabbir","Saif Powertec Ltd.","SPOT","Finance And Accounts","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1647","SPL-000118","Md. Nasimul Haque","Saif Powertec Ltd.","Service And Energy Business","Service","Manager","");
INSERT INTO inv_employee VALUES("1648","SPL-000119","Md. Mashiur Rahman","Saif Powertec Ltd.","Service And Energy Business","Service","Assistant Manager","");
INSERT INTO inv_employee VALUES("1649","SPL-000122","Shanti Ranjan Howlader","Saif Powertec Ltd.","Sub Station","Project","Deputy Manager","");
INSERT INTO inv_employee VALUES("1650","SPL-000123","Md. Tawhidul Islam","Saif Powertec Ltd.","Corporate","Administration","Manager","");
INSERT INTO inv_employee VALUES("1651","SPL-000124","Md. Akramul Hague Bhuiyan","Saif Powertec Ltd.","Service And Energy Business","Service","Customer Care","");
INSERT INTO inv_employee VALUES("1652","SPL-000126","Md. A.K. Azad","Saif Powertec Ltd.","Service And Energy Business","Service","Supervisor","");
INSERT INTO inv_employee VALUES("1653","SPL-000131","Md. Rahamatullah","Saif Powertec Ltd.","Service And Energy Business","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("1654","SPL-000136","Md Shamsur Rahman","Saif Powertec Ltd.","Corporate","Project","Senior Manager","");
INSERT INTO inv_employee VALUES("1655","SPL-000138","Md. Arif Khan","Saif Powertec Ltd.","Corporate","Project","Supervisor","");
INSERT INTO inv_employee VALUES("1656","SPL-000140","Md Masud Mia","Saif Powertec Ltd.","Corporate","Project","Senior Electrician","");
INSERT INTO inv_employee VALUES("1657","SPL-000142","Helal Uddin","Saif Powertec Ltd.","Sub Station","Switch Gear","Welder","");
INSERT INTO inv_employee VALUES("1658","SPL-000144","Md Imdadul Haque","Saif Powertec Ltd.","Sub Station","Switch Gear","Welder","");
INSERT INTO inv_employee VALUES("1659","SPL-000148","Md. Mamun Molla","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("1660","SPL-000150","Md. Abdul Malek","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1661","SPL-000161","Md. Kazi Tuhin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1662","SPL-000162","Md. Shojib Ullah","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("1663","SPL-000195","Md. Shamsul Haq","Saif Powertec Ltd.","Corporate","Administration","Security Inspector","");
INSERT INTO inv_employee VALUES("1664","SPL-000196","Mirza Shamim","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1665","SPL-000198","Amirul Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1666","SPL-000213","Md. Shobuj Sheik","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("1667","SPL-000215","Md.Rafiqul Alam","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("1668","SPL-000253","Sree Sarol Chandro Roy","Saif Powertec Ltd.","Sub Station","Switch Gear","Senior Technician","");
INSERT INTO inv_employee VALUES("1669","SPL-000255","Md Monirul Islam","Saif Powertec Ltd.","Sub Station","Switch Gear","Technician","");
INSERT INTO inv_employee VALUES("1670","SPL-000260","Md. Nazmul Haque Khan","Saif Powertec Ltd.","SPOT","Documentation","Executive","");
INSERT INTO inv_employee VALUES("1671","SPL-000270","Md. Zakir Hosen","Saif Powertec Ltd.","SPOT","Billing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1672","SPL-000283","Abu Hena Mustafa","Saif Powertec Ltd.","CTED-Dhaka","Operation","General Manager","");
INSERT INTO inv_employee VALUES("1673","SPL-000288","Md. Didar Hossain Bhuiyan","Saif Powertec Ltd.","Corporate","EHS","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1674","SPL-000293","Md. Zahirul Islam","Saif Powertec Ltd.","Corporate","EHS","Assistant Manager","");
INSERT INTO inv_employee VALUES("1675","SPL-000298","S.M. Shamsul Farhan","Saif Powertec Ltd.","Battery","Project Development And Implemantaion","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("1676","SPL-000300","Kishor Clement Reberio","Saif Powertec Ltd.","Battery","RAndD","Executive","");
INSERT INTO inv_employee VALUES("1677","SPL-000301","A. F. M. Fahmidur Rahman","Saif Powertec Ltd.","Business Development","Business Development","Senior Manager","");
INSERT INTO inv_employee VALUES("1678","SPL-000302","Tanvir Anjum","Saif Powertec Ltd.","SPOT","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("1679","SPL-000303","Md. Didarul Alam Chowdhury","Saif Powertec Ltd.","Battery","Factory Operation","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1680","SPL-000304","Mirza Mostofa Hasan","Saif Powertec Ltd.","Battery","RAndD","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1681","SPL-000311","Md. Moyan Uddin","Saif Powertec Ltd.","Service And Energy Business","Service","Foreman","");
INSERT INTO inv_employee VALUES("1682","SPL-000312","Nazrul Islam Babu","Saif Powertec Ltd.","Service And Energy Business","Service","Supervisor","");
INSERT INTO inv_employee VALUES("1683","SPL-000315","Beauty Hossain","Saif Powertec Ltd.","Battery","Commercial","Executive","");
INSERT INTO inv_employee VALUES("1684","SPL-000320","Mohammad Asaduzzaman Talukder","Saif Powertec Ltd.","Renewable Energy","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1685","SPL-000321","Md. Sufi Sabbir Ahmed","Saif Powertec Ltd.","Corporate","Administration","Deputy Manager","");
INSERT INTO inv_employee VALUES("1686","SPL-000322","Fatema Tuj Zohora","Saif Powertec Ltd.","Corporate","Administration","Front Desk Officer","");
INSERT INTO inv_employee VALUES("1687","SPL-000323","Nusrat Jahan Tima","Saif Powertec Ltd.","Power and Energy","Service","Assistant Manager","");
INSERT INTO inv_employee VALUES("1688","SPL-000325","Dewan Rubaiat Hussain","Saif Powertec Ltd.","Corporate","IT","Head of IT","");
INSERT INTO inv_employee VALUES("1689","SPL-000328","AKM Moniruzzaman Quoreshi","Saif Powertec Ltd.","Power and Energy","Operation","Executive Director","");
INSERT INTO inv_employee VALUES("1690","SPL-000330","Md. Mahmudur Rahman","Saif Powertec Ltd.","Power and Energy","Sales And Marketing","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("1691","SPL-000333","Nadia Habib","Saif Powertec Ltd.","Energy Business","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1692","SPL-000336","Md. Juwel Mia","Saif Powertec Ltd.","Service And Energy Business","Service","Assistant Manager","");
INSERT INTO inv_employee VALUES("1693","SPL-000343","Md Shafiqul Islam","Saif Powertec Ltd.","Battery","Administration","Canteen Boy","");
INSERT INTO inv_employee VALUES("1694","SPL-000350","Md. Shafiqul Islam","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("1695","SPL-000352","Md. Akber Hossen","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("1696","SPL-000354","Md Zahirul Alam","Saif Powertec Ltd.","Corporate","Project","Executive","");
INSERT INTO inv_employee VALUES("1697","SPL-000355","Md Sadiqur Rahman","Saif Powertec Ltd.","Corporate","Brand Communication","Executive","");
INSERT INTO inv_employee VALUES("1698","SPL-000370","Md. Sabbir Sheikh","Saif Powertec Ltd.","Corporate","Administration","Deputy Manager","");
INSERT INTO inv_employee VALUES("1699","SPL-000371","Forkan Musolli","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("1700","SPL-000372","Md. Monir Hossain","Saif Powertec Ltd.","Battery","Administration","Assistant Manager","");
INSERT INTO inv_employee VALUES("1701","SPL-000373","Naved Ibne Azad","Saif Powertec Ltd.","Corporate","Administration","Assistant Manager","");
INSERT INTO inv_employee VALUES("1702","SPL-000375","Aminur Rahman","Saif Powertec Ltd.","Renewable Energy","Administration","Assistant Manager","");
INSERT INTO inv_employee VALUES("1703","SPL-000381","Zubayer Alam Khan","Saif Powertec Ltd.","Battery","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("1704","SPL-000383","Afroza Khatun","Saif Powertec Ltd.","Renewable Energy","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("1705","SPL-000384","Latifa Akther","Saif Powertec Ltd.","Corporate","Administration","Officer","");
INSERT INTO inv_employee VALUES("1706","SPL-000388","Md Alauddin","Saif Powertec Ltd.","Corporate","Administration","Liason Officer","");
INSERT INTO inv_employee VALUES("1707","SPL-000389","Syed Fayejur Rahman","Saif Powertec Ltd.","Corporate","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("1708","SPL-000390","B.M Ashikur Rahaman","Saif Powertec Ltd.","Corporate","Commercial","Executive","");
INSERT INTO inv_employee VALUES("1709","SPL-000393","Md Khalid Hossain Bhuyan","Saif Powertec Ltd.","Battery","Purchase And Procurement","Deputy Manager","");
INSERT INTO inv_employee VALUES("1710","SPL-000394","Tusar Uddin Ahmed","Saif Powertec Ltd.","SPOT","Documentation","Incharge Billing And Doc.","");
INSERT INTO inv_employee VALUES("1711","SPL-000395","Mohammad Beylayet Hossain","Saif Powertec Ltd.","Battery","Purchase And Procurement","Assistant Manager","");
INSERT INTO inv_employee VALUES("1712","SPL-000406","Md Mohiuddin Sarder Rana","Saif Powertec Ltd.","Battery","Administration","Senior Officer","");
INSERT INTO inv_employee VALUES("1713","SPL-000411","Shek Mintu Mia","Saif Powertec Ltd.","Corporate","Administration","Protocol Officer","");
INSERT INTO inv_employee VALUES("1714","SPL-000412","Md. Najim Uddin Dakua","Saif Powertec Ltd.","Corporate","Administration","Protocol Officer","");
INSERT INTO inv_employee VALUES("1715","SPL-000413","Sohag Sarder","Saif Powertec Ltd.","Corporate","Administration","Protocol Officer","");
INSERT INTO inv_employee VALUES("1716","SPL-000416","Md. Shajidul Islam","Saif Powertec Ltd.","Corporate","Administration","Junior Engineer","");
INSERT INTO inv_employee VALUES("1717","SPL-000422","Md Murad","Saif Powertec Ltd.","SPOT","Documentation","Executive","");
INSERT INTO inv_employee VALUES("1718","SPL-000425","Md Mizanur Rahman","Saif Powertec Ltd.","SPOT","Operation","Assistant Supervisor","");
INSERT INTO inv_employee VALUES("1719","SPL-000426","Md. Zia Uddin","Saif Powertec Ltd.","SPOT","Operation","Officer","");
INSERT INTO inv_employee VALUES("1720","SPL-000436","Masud Khan","Saif Powertec Ltd.","Battery","Administration","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("1721","SPL-000445","Mohammad Shah Alam","Saif Powertec Ltd.","SPOT","Administration","Executive","");
INSERT INTO inv_employee VALUES("1722","SPL-000447","Md Zillur Rahman","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Manager","");
INSERT INTO inv_employee VALUES("1723","SPL-000453","Tofayel Ahmed","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("1724","SPL-000454","Md. Alauddin","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1725","SPL-000456","Rifat Hasan Mallick","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Officer","");
INSERT INTO inv_employee VALUES("1726","SPL-000457","Md. Al- Amin","Saif Powertec Ltd.","Renewable Energy","Administration","Peon","");
INSERT INTO inv_employee VALUES("1727","SPL-000459","Most. Papia Khatun","Saif Powertec Ltd.","Service And Energy Business","Administration","Sales ADM And Application Engg.","");
INSERT INTO inv_employee VALUES("1728","SPL-000460","Sayeda Asrafy Sadia","Saif Powertec Ltd.","Battery","Administration","Senior Officer","");
INSERT INTO inv_employee VALUES("1729","SPL-000461","Md Murad","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("1730","SPL-000462","Md. Shariful Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1731","SPL-000463","Md. Monir","Saif Powertec Ltd.","Renewable Energy","Administration","Peon","");
INSERT INTO inv_employee VALUES("1732","SPL-000467","Salman Hossain Shamim","Saif Powertec Ltd.","Battery","Purchase And Procurement","Assistant Manager","");
INSERT INTO inv_employee VALUES("1733","SPL-000472","Md. Ahsan Tarafder","Saif Powertec Ltd.","Battery","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("1734","SPL-000478","Mithu Ranjan Kar","Saif Powertec Ltd.","Battery","Commercial","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1735","SPL-000479","Mahabub Hasan Ripon","Saif Powertec Ltd.","Battery","Charging","Executive","");
INSERT INTO inv_employee VALUES("1736","SPL-000480","Md. Masud Rana","Saif Powertec Ltd.","Battery","Quality Assurance","Executive","");
INSERT INTO inv_employee VALUES("1737","SPL-000481","S. M. Tushar Mahmud","Saif Powertec Ltd.","Battery","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("1738","SPL-000482","Md.Farooq Hossain","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Head Technician","");
INSERT INTO inv_employee VALUES("1739","SPL-000483","Ashraful Alam","Saif Powertec Ltd.","Battery","Maintenance","Senior Manager","");
INSERT INTO inv_employee VALUES("1740","SPL-000484","Md. Sultan Mahmud","Saif Powertec Ltd.","Battery","Assembly","Assistant Manager","");
INSERT INTO inv_employee VALUES("1741","SPL-000485","Tapan Kumar Roy","Saif Powertec Ltd.","Battery","RAndD","Officer","");
INSERT INTO inv_employee VALUES("1742","SPL-000486","Md. Samsuzzaman","Saif Powertec Ltd.","Battery","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("1743","SPL-000487","Md. Waliul Bari","Saif Powertec Ltd.","Renewable Energy","Sales And Marketing","Manager","");
INSERT INTO inv_employee VALUES("1744","SPL-000488","Bipul Chandra Roy","Saif Powertec Ltd.","Battery","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("1745","SPL-000489","William Davis Liton Hamborn","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("1746","SPL-000490","Md. Faridul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("1747","SPL-000492","Ali Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1748","SPL-000494","Md Kamal Hossain","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("1749","SPL-000495","Md Rizwanul Kabir","Saif Powertec Ltd.","Corporate","Finance And Accounts","Security Officer","");
INSERT INTO inv_employee VALUES("1750","SPL-000496","Md Sofikul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("1751","SPL-000497","Md. Masum","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("1752","SPL-000498","Hera Lal","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("1753","SPL-000499","Md. Abdul Kuddus","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("1754","SPL-000500","Abu Rasel","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("1755","SPL-000501","Md Ahasan Habib Sardar","Saif Powertec Ltd.","Battery","Charging","Executive","");
INSERT INTO inv_employee VALUES("1756","SPL-000502","Bidduth Chandra Das","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("1757","SPL-000503","Md. Pear Rahman","Saif Powertec Ltd.","Battery","Charging","Head Technician","");
INSERT INTO inv_employee VALUES("1758","SPL-000504","Md. Balal Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("1759","SPL-000505","Md. Helal Uddin Sikder","Saif Powertec Ltd.","Battery","Finance And Accounts","Head of Finance And Accounts","");
INSERT INTO inv_employee VALUES("1760","SPL-000506","Abu Noor Afsher Khan","Saif Powertec Ltd.","Battery","CMP","Manager","");
INSERT INTO inv_employee VALUES("1761","SPL-000513","Shiten Chandra Roy","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("1762","SPL-000515","Dhanesh Chandra Roy","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("1763","SPL-000516","Md. Khurshed Alam Meraj","Saif Powertec Ltd.","Battery","CMP","Supervisor","");
INSERT INTO inv_employee VALUES("1764","SPL-000523","Md. Abu Shihab","Saif Powertec Ltd.","Battery","Administration","Executive","");
INSERT INTO inv_employee VALUES("1765","SPL-000525","Md. Shahidul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("1766","SPL-000527","Ibrahim Miah","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("1767","SPL-000528","Abul Khair","Saif Powertec Ltd.","Equipment","Sales And Marketing","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1768","SPL-000529","Md. Abul Kashem ","Saif Powertec Ltd.","Battery","Quality Assurance","Senior Manager","");
INSERT INTO inv_employee VALUES("1769","SPL-000530","Md. Nasim Hasan Askery","Saif Powertec Ltd.","Battery","Purchase And Procurement","Executive","");
INSERT INTO inv_employee VALUES("1770","SPL-000549","Md. Rasel Miah","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("1771","SPL-000550","Abu Zafar","Saif Powertec Ltd.","Battery","Quality Assurance","Supervisor","");
INSERT INTO inv_employee VALUES("1772","SPL-000551","Md. Ziaur Rahaman","Saif Powertec Ltd.","Battery","Plate Preparation","Supervisor","");
INSERT INTO inv_employee VALUES("1773","SPL-000552","Md. Haider Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Supervisor","");
INSERT INTO inv_employee VALUES("1774","SPL-000553","Md. Julhas Uddin","Saif Powertec Ltd.","Battery","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("1775","SPL-000554","Sree Anil Chandro Dab Sharma","Saif Powertec Ltd.","Battery","Assembly","Head Technician","");
INSERT INTO inv_employee VALUES("1776","SPL-000555","Md Reaz Uddin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("1777","SPL-000558","Md. Kuddus Hawlader","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("1778","SPL-000560","A.B.M. Amanul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Engineer","");
INSERT INTO inv_employee VALUES("1779","SPL-000561","Nazrul Islam Mutaleb","Saif Powertec Ltd.","Service And Energy Business","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("1780","SPL-000562","Syed Abdul Baten","Saif Powertec Ltd.","Renewable Energy","Store","Senior Officer","");
INSERT INTO inv_employee VALUES("1781","SPL-000568","Md Zahid Reza","Saif Powertec Ltd.","SPOT","Documentation","Senior Officer","");
INSERT INTO inv_employee VALUES("1782","SPL-000573","Kamrul Hasan Bhuiyan","Saif Powertec Ltd.","SPOT","Operation","Terminal Superintendent","");
INSERT INTO inv_employee VALUES("1783","SPL-000581","Md. Anowar Hossen","Saif Powertec Ltd.","Battery","Gel And VRLA","Head Technician","");
INSERT INTO inv_employee VALUES("1784","SPL-000582","Md. Shajadul Islam","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("1785","SPL-000583","Nani Gopal Mhantha","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("1786","SPL-000584","Md Shohel Rana","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("1787","SPL-000585","Md. Nazrul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("1788","SPL-000586","Sujan Kumar Dev Sharman","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("1789","SPL-000587","Sree Bisnu Mohonto","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("1790","SPL-000588","Md Ashraful Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("1791","SPL-000589","Md. Ektiare Uddin","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1792","SPL-000590","Md. Anisur Rahman","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("1793","SPL-000591","Md. Rabiul Islam","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("1794","SPL-000592","Paresh Roy","Saif Powertec Ltd.","Battery","Assembly","Head Technician","");
INSERT INTO inv_employee VALUES("1795","SPL-000593","Super Son Marak","Saif Powertec Ltd.","Battery","Plate Preparation","Supervisor","");
INSERT INTO inv_employee VALUES("1796","SPL-000594","Md. Zakariya Hossain","Saif Powertec Ltd.","Battery","Charging","Senior Technician","");
INSERT INTO inv_employee VALUES("1797","SPL-000600","Md. Omar Faruque","Saif Powertec Ltd.","Renewable Energy","Finance And Accounts","Deputy Manager","");
INSERT INTO inv_employee VALUES("1798","SPL-000602","Md. Shofiqul Islam","Saif Powertec Ltd.","Battery","Assembly","Supervisor","");
INSERT INTO inv_employee VALUES("1799","SPL-000603","Md. Sazit Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("1800","SPL-000604","Md. Rabiul Islam","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Senior Technician","");
INSERT INTO inv_employee VALUES("1801","SPL-000605","Md. Rubel Hossain","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("1802","SPL-000606","Md. Zahid Hossain","Saif Powertec Ltd.","Corporate","Human Resource Management","Senior Manager","");
INSERT INTO inv_employee VALUES("1803","SPL-000607","Md. Mahabub Alam","Saif Powertec Ltd.","Battery","Sales And Marketing","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1804","SPL-000608","Md. Babul Farajee","Saif Powertec Ltd.","Corporate","IT","Manager","");
INSERT INTO inv_employee VALUES("1805","SPL-000609","Md. Abir Hossain","Saif Powertec Ltd.","Service And Energy Business","Service","Engineer","");
INSERT INTO inv_employee VALUES("1806","SPL-000610","Sheikh Borhan Uddin","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Service Engineer","");
INSERT INTO inv_employee VALUES("1807","SPL-000611","Md. Mizanur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Area Manager","");
INSERT INTO inv_employee VALUES("1808","SPL-000616","Md Mhamudul Hasen","Saif Powertec Ltd.","Corporate","Administration","Senior Officer","");
INSERT INTO inv_employee VALUES("1809","SPL-000618","Md. Zakir Hossain","Saif Powertec Ltd.","Battery","Sales And Marketing","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1810","SPL-000620","Md. Anisur Rahman","Saif Powertec Ltd.","Battery","Administration","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("1811","SPL-000621","Md. Rajib","Saif Powertec Ltd.","Corporate","Administration","Technician","");
INSERT INTO inv_employee VALUES("1812","SPL-000622","Digen Chandra Roy","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("1813","SPL-000624","Samir Ahmed","Saif Powertec Ltd.","Corporate","Administration","Officer","");
INSERT INTO inv_employee VALUES("1814","SPL-000626","Md. Abu Motaleb Khan","Saif Powertec Ltd.","Corporate","Administration","Manager","");
INSERT INTO inv_employee VALUES("1815","SPL-000630","Farjana Shairmin Akter","Saif Powertec Ltd.","Corporate","Administration","Officer","");
INSERT INTO inv_employee VALUES("1816","SPL-000633","Md. Abdul Karim","Saif Powertec Ltd.","Battery","Sales And Marketing","General Manager","");
INSERT INTO inv_employee VALUES("1817","SPL-000635","Md. Habibur Rahman","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1818","SPL-000639","Md. Poplu Sarder","Saif Powertec Ltd.","Corporate","Administration","Protocol Officer","");
INSERT INTO inv_employee VALUES("1819","SPL-000640","Md. Masud Alam","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("1820","SPL-000642","Shahidul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1821","SPL-000643","Md. Saddam Ali Mollah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1822","SPL-000653","Mohammad Sayeed Hossain","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Senior Manager","");
INSERT INTO inv_employee VALUES("1823","SPL-000658","Ms. Razia Sultana","Saif Powertec Ltd.","Corporate","Finance And Accounts","Manager","");
INSERT INTO inv_employee VALUES("1824","SPL-000663","Md. Mustafizur Rahman Limon","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1825","SPL-000664","Md. Mijanur Ali Sheik","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1826","SPL-000665","Md. Eliyas Kawsar","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1827","SPL-000666","Khan Shohidur Rohaman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1828","SPL-000668","Md Abu Saiem","Saif Powertec Ltd.","Renewable Energy","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("1829","SPL-000678","Md Alamgir Hossain Rana","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("1830","SPL-000682","Lawrance Bario","Saif Powertec Ltd.","Service And Energy Business","Service","Deputy Manager","");
INSERT INTO inv_employee VALUES("1831","SPL-000684","Md. Azanur Sardar","Saif Powertec Ltd.","Corporate","Administration","Protocol Officer","");
INSERT INTO inv_employee VALUES("1832","SPL-000688","Md. Nayem Mridha","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1833","SPL-000692","Muhammad Afshin Uz Zaman","Saif Powertec Ltd.","Corporate","Human Resource Management","General Manager","");
INSERT INTO inv_employee VALUES("1834","SPL-000693","Md. Amir Raza Younus","Saif Powertec Ltd.","Corporate","Administration","Front Desk Officer","");
INSERT INTO inv_employee VALUES("1835","SPL-000694","Shambhu Chandra Pal","Saif Powertec Ltd.","Corporate","Finance And Accounts","General Manager","");
INSERT INTO inv_employee VALUES("1836","SPL-000695","Ferdous Wahid","Saif Powertec Ltd.","Corporate","Enterprise Resource Planning","Senior Manager","");
INSERT INTO inv_employee VALUES("1837","SPL-000696","ATM Rashed Al Bannah","Saif Powertec Ltd.","Corporate","Enterprise Resource Planning","Manager","");
INSERT INTO inv_employee VALUES("1838","SPL-000698","Md. Zahidul Islam","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("1839","SPL-000702","Md. Shahin Molla","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1840","SPL-000704","Md. Abdul Hamid Chowdhury","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1841","SPL-000707","James Liton Gomes","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1842","SPL-000708","Md. Anowar Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1843","SPL-000709","Md. Robiul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1844","SPL-000711","Md Mahbubur Rahman","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("1845","SPL-000716","Ismail Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1846","SPL-000719","Md Rajeeb Khan","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("1847","SPL-000722","Md. Habib","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1848","SPL-000724","Md. Khaled Masud","Saif Powertec Ltd.","Battery","Marketing And Sales- Export And Corporate","Manager","");
INSERT INTO inv_employee VALUES("1849","SPL-000726","Mohammad Rashedul Hoque","Saif Powertec Ltd.","Corporate","Administration","Manager","");
INSERT INTO inv_employee VALUES("1850","SPL-000728","Md. Ulad Hossain","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1851","SPL-000729","Md. Imdadul Hoque","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1852","SPL-000734","Golam Mahadi Hassan","Saif Powertec Ltd.","Sub Station","Project","Engineer","");
INSERT INTO inv_employee VALUES("1853","SPL-000735","Md. Asaduzzaman","Saif Powertec Ltd.","Sub Station","Project","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1854","SPL-000736","Rajaur Karim","Saif Powertec Ltd.","SPOT","Documentation","Senior Officer","");
INSERT INTO inv_employee VALUES("1855","SPL-000737","Md. Amirul Islam","Saif Powertec Ltd.","SPOT","Operation","Assistant Supervisor","");
INSERT INTO inv_employee VALUES("1856","SPL-000738","Md. Ibrahim Khalil","Saif Powertec Ltd.","Corporate","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("1857","SPL-000739","Md. Jubaidur Rahman","Saif Powertec Ltd.","Corporate","Finance And Accounts","Share Officer","");
INSERT INTO inv_employee VALUES("1858","SPL-000740","Md. Fazlul Haque","Saif Powertec Ltd.","Corporate","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("1859","SPL-000741","Masud-uz- Zamman","Saif Powertec Ltd.","Corporate","Finance And Accounts","Manager","");
INSERT INTO inv_employee VALUES("1860","SPL-000742","Md. Sajidur Rahman","Saif Powertec Ltd.","Corporate","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("1861","SPL-000743","Palash Sarker","Saif Powertec Ltd.","Corporate","Administration","Admin Assistant","");
INSERT INTO inv_employee VALUES("1862","SPL-000746","Pinky Akter Komol","Saif Powertec Ltd.","Corporate","Administration","Senior Officer","");
INSERT INTO inv_employee VALUES("1863","SPL-000747","Masudur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1864","SPL-000748","Mohammed Joglul Haider Rumi","Saif Powertec Ltd.","Battery","Sales And Marketing","Deputy Manager","");
INSERT INTO inv_employee VALUES("1865","SPL-000749","Mahedi Hasan","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1866","SPL-000750","Md. Sohanur Rashid","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1867","SPL-000751","Md. Motiur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1868","SPL-000752","Md. Sayem Khan","Saif Powertec Ltd.","Battery","Purchase And Procurement","Senior Officer","");
INSERT INTO inv_employee VALUES("1869","SPL-000753","Md. Mizanur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("1870","SPL-000754","S.M. Wahidur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1871","SPL-000755","Md. Arif Hosen","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1872","SPL-000756","Md. Babar Ali","Saif Powertec Ltd.","Battery","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1873","SPL-000757","Md. Nazmul Hasan","Saif Powertec Ltd.","SPOT","Documentation","Officer","");
INSERT INTO inv_employee VALUES("1874","SPL-000759","Md. Nasimul Kabir","Saif Powertec Ltd.","Battery","Marketing And Sales- Export And Corporate","Manager","");
INSERT INTO inv_employee VALUES("1875","SPL-000760","S.M. Nazmul Ahsan","Saif Powertec Ltd.","Battery","Sales And Marketing","Area Manager","");
INSERT INTO inv_employee VALUES("1876","SPL-000761","Abu Saleh Md. Sharif","Saif Powertec Ltd.","Battery","Finance And Accounts","Deputy General Manager","");
INSERT INTO inv_employee VALUES("1877","SPL-000762","Md. Asaduzzaman Khan","Saif Powertec Ltd.","Battery","Maintenance","Officer","");
INSERT INTO inv_employee VALUES("1878","SPL-000763","Md. Tofayel Ahmed","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Store Officer","");
INSERT INTO inv_employee VALUES("1879","SPL-000764","Md. Mominur Rahman","Saif Powertec Ltd.","Battery","Maintenance","Deputy Manager","");
INSERT INTO inv_employee VALUES("1880","SPL-000765","Md. Shobuz Hossain","Saif Powertec Ltd.","SPOT","Billing","Senior Officer","");
INSERT INTO inv_employee VALUES("1881","SPL-000766","Mohammad Nazrul Islam","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1882","SPL-000767","Abu Abdullah","Saif Powertec Ltd.","Battery","Maintenance","Senior Officer","");
INSERT INTO inv_employee VALUES("1883","SPL-000770","Shadhan Tewary","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1884","SPL-000771","Md. Rakib Hasan Rubel","Saif Powertec Ltd.","Power and Energy","Sales And Marketing","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1885","SPL-000772","Md. Shefatuzzaman","Saif Powertec Ltd.","Sub Station","Operation","Junior Engineer","");
INSERT INTO inv_employee VALUES("1886","SPL-000773","Md. Nazrul Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1887","SPL-000777","Khan Robiul Islam","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1888","SPL-000778","Md. Nazmul Hussain","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1889","SPL-000779","Syed Mahfuzur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("1890","SPL-000791","Sonia Afroz","Saif Powertec Ltd.","Battery","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("1891","SPL-000792","Md. Layel Hasan","Saif Powertec Ltd.","Corporate","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("1892","SPL-000793","K.M. Kaisar Imtiaz Nur","Saif Powertec Ltd.","Battery","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1893","SPL-000794","Shubendu Kumar Podder","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("1894","SPL-000795","Md. Sazu Ahmed","Saif Powertec Ltd.","Battery","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("1895","SPL-000796","Sheikh Ahmed Adil","Saif Powertec Ltd.","Corporate","IT","Manager","");
INSERT INTO inv_employee VALUES("1896","SPL-000797","Merciful Hossain","Saif Powertec Ltd.","Battery","Purchase And Procurement","Assistant Manager","");
INSERT INTO inv_employee VALUES("1897","SPL-000800","Iqbal Hossain Khan","Saif Powertec Ltd.","SPOT","Store","Officer","");
INSERT INTO inv_employee VALUES("1898","SPL-000801","Roktim Kumar Pramanik","Saif Powertec Ltd.","Battery","Plate Preparation","Officer","");
INSERT INTO inv_employee VALUES("1899","SPL-000802","Amran Hossain","Saif Powertec Ltd.","Battery","EHS","Senior Manager","");
INSERT INTO inv_employee VALUES("1900","SPL-000803","Abdul Fattah","Saif Powertec Ltd.","Battery","Quality Assurance","Senior Officer","");
INSERT INTO inv_employee VALUES("1901","SPL-000804","Md. Ariful Islam","Saif Powertec Ltd.","Battery","Finance And Accounts","Manager","");
INSERT INTO inv_employee VALUES("1902","SPL-000805","Abu Sadet Md. Sabbir","Saif Powertec Ltd.","Battery","Maintenance","Senior Officer","");
INSERT INTO inv_employee VALUES("1903","SPL-000806","Anisul Islam Mahmood","Saif Powertec Ltd.","Corporate","Legal","Assistant General Manager","");
INSERT INTO inv_employee VALUES("1904","SPL-000807","Jobaidur Rahman Khan","Saif Powertec Ltd.","Battery","Maintenance","Senior Officer","");
INSERT INTO inv_employee VALUES("1905","SPL-000827","Md. Abu Naser","Saif Powertec Ltd.","Corporate","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("1906","SPL-005001","Md. Afzal Hossain","Saif Powertec Ltd.","Battery","Purchase And Procurement","Assistant","");
INSERT INTO inv_employee VALUES("1907","SPL-005026","Md. Masud Alam","Saif Powertec Ltd.","Battery","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("1908","SPL-005030","Md. Rezaul Karim","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1909","SPL-005031","Md. Syad Nazmul Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1910","SPL-005036","Murshalin Khan","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("1911","SPL-005037","Md. Mahamudul Hoque","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1912","SPL-005038","Sudave Parye","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1913","SPL-005039","Md. Monir Hosen","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1914","SPL-005044","Md. Sofikuzzaman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1915","SPL-005046","Md. Abdus  Shukur","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1916","SPL-005047","Md. Babul Hossin","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1917","SPL-005050","Md. Abdur Rashid Laskar","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1918","SPL-005054","Md. Aminul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("1919","SPL-005056","Md. Abul Kalam Azad","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1920","SPL-005057","Md. Shapon Dale","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("1921","SPL-005059","Md. Mamun Howlader","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1922","SPL-005061","Md. Abdul Bari Azad","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("1923","SPL-005063","Md. Munnu Miah Shaikh","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1924","SPL-005064","Md. Abdul Ali","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1925","SPL-005067","Md. Liakat Ali","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1926","SPL-005068","Kazi Rafiqul Hasan","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1927","SPL-005069","Shekh Monirul Islam","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1928","SPL-005070","Md. Delwar Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Officer","");
INSERT INTO inv_employee VALUES("1929","SPL-005071","Md. Saleh Ahmed","Saif Powertec Ltd.","SPOT","Administration","Security Officer","");
INSERT INTO inv_employee VALUES("1930","SPL-005073","Md. Bellal Hossain Mojumdar","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("1931","SPL-005074","Md. Mir Nannu Miah","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1932","SPL-005078","Md. Momen Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1933","SPL-005080","Md. Khairul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1934","SPL-005081","Md Rakibul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1935","SPL-005082","Suvroto Ojha","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1936","SPL-005085","Md. Alam Mollah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1937","SPL-005086","Md. Zohurul Islam Mohon","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1938","SPL-005087","Md. Shahidul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1939","SPL-005088","Masud Reza","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("1940","SPL-005089","Md. Ziaur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1941","SPL-005090","Md. Sanwar Hosen","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1942","SPL-005091","Ujjal Chandra","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("1943","SPL-005092","Md. Manik","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1944","SPL-005093","Md. Shahidul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1945","SPL-005094","Laila Begum","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1946","SPL-005097","Dilip Kumar Das","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1947","SPL-005098","Hossain Mollah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1948","SPL-005100","Md. Saiful Amin Shohel","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1949","SPL-005101","Md. Mokaram Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1950","SPL-005102","Minara Begum","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1951","SPL-005103","Md. Rafiqul Isam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1952","SPL-005104","Md. Kabir Hosen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1953","SPL-005105","Md. Sulaiman Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1954","SPL-005107","Md. Ibrahim Mollah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1955","SPL-005108","Ms. Anjuara Khatun","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1956","SPL-005114","Md. Selim Hawlader","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1957","SPL-005115","Md. Ariful Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1958","SPL-005118","Md. Shajahan Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("1959","SPL-005119","Prodip Biswas","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1960","SPL-005122","Md. Mamun Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1961","SPL-005124","Tapash Chandra Roy","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("1962","SPL-005125","Mst. Razia Akter","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1963","SPL-005126","Md. Shah Newaz Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1964","SPL-005127","Mst. Monowara Begum","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1965","SPL-005129","Asma Begam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1966","SPL-005132","Md. Jhon Sarder","Saif Powertec Ltd.","Sub Station","Switch Gear","Foreman","");
INSERT INTO inv_employee VALUES("1967","SPL-005134","Md. Shah Alam","Saif Powertec Ltd.","Sub Station","Switch Gear","Foreman","");
INSERT INTO inv_employee VALUES("1968","SPL-005135","Md. Kashem Ali","Saif Powertec Ltd.","Sub Station","Switch Gear","Painter","");
INSERT INTO inv_employee VALUES("1969","SPL-005137","Ms. Amena Khatun","Saif Powertec Ltd.","Battery","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1970","SPL-005139","Md. Polash Hawlader","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1971","SPL-005145","Md. Razu Ahmed","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("1972","SPL-005146","Md. Neowas Sharif","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("1973","SPL-005147","Md. Kamal Hossain","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("1974","SPL-005148","Tufayel Ahmed","Saif Powertec Ltd.","SPOT","Operation","Supervisor","");
INSERT INTO inv_employee VALUES("1975","SPL-005149","Summit Kumar Barai","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("1976","SPL-005150","Chandro Shakhar Datt","Saif Powertec Ltd.","SPOT","Documentation","Senior Officer","");
INSERT INTO inv_employee VALUES("1977","SPL-005152","Md. Taherul Islam","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("1978","SPL-005153","Md. Moazzem Hossain","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("1979","SPL-005154","Md. Jelam Matubber","Saif Powertec Ltd.","Battery","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("1980","SPL-005155","Md. Jibon Islam","Saif Powertec Ltd.","Battery","Administration","Supervisor","");
INSERT INTO inv_employee VALUES("1981","SPL-005156","Sanaton Ram","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("1982","SPL-005157","Nishas Richil","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("1983","SPL-005159","Md. Shahinul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("1984","SPL-005160","Md. Sahabuddin Mollah","Saif Powertec Ltd.","Battery","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1985","SPL-005161","Pannu Fakir","Saif Powertec Ltd.","Battery","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("1986","SPL-005162","Md. Kajol","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("1987","SPL-005164","Md. Roton Mahmud","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("1988","SPL-005166","Sree Sujon Chandara Roy","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("1989","SPL-005167","Poul Roy","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("1990","SPL-005168","Miraj Sardar","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("1991","SPL-005169","Md. Jaherul Islam","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("1992","SPL-005171","Md. Rasel","Saif Powertec Ltd.","Power and Energy","Administration","Peon","");
INSERT INTO inv_employee VALUES("1993","SPL-005172","Md. Raju Miah","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("1994","SPL-005174","Md. Kopil Uddin","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("1995","SPL-005177","Md.Johirul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1996","SPL-005178","Most. Moslema Begum","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("1997","SPL-005179","Pranto Costa","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("1998","SPL-005180"," Pabitra Dev","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("1999","SPL-005182","Md Mokarrom Hossain","Saif Powertec Ltd.","SPOT","Operation","Officer","");
INSERT INTO inv_employee VALUES("2000","SPL-005183","Mohammad Yasin","Saif Powertec Ltd.","SPOT","Operation","Supervisor","");
INSERT INTO inv_employee VALUES("2001","SPL-005184","Md. Munna","Saif Powertec Ltd.","SPOT","Operation","Supervisor","");
INSERT INTO inv_employee VALUES("2002","SPL-005185","Mohammad Mofazzul Hossain","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2003","SPL-005186","Md. Ahmad Ullah","Saif Powertec Ltd.","CTED-Dhaka","Operation","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("2004","SPL-005187","Md. Saddequl Islam","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2005","SPL-005188","Md. Arif Sheikh","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2006","SPL-005189","Mahafuz Alam","Saif Powertec Ltd.","CTED-Dhaka","Operation","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("2007","SPL-005190","Mohammad Hasan","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2008","SPL-005191","Md. Shapon","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2009","SPL-005193","Shahin Miazi","Saif Powertec Ltd.","SPOT","Operation","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("2010","SPL-005194","Monir Hosen","Saif Powertec Ltd.","SPOT","Operation","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("2011","SPL-005198","Md. Babul","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2012","SPL-005200","Md. Ibrahim","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2013","SPL-005201","Md. Chand Mia","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("2014","SPL-005203","Md. Atikur Rahman","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2015","SPL-005204","Md. Joinal Sheikh","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("2016","SPL-005205","Md. Shopon Miah","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("2017","SPL-005206","Md. Saiful Islam","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Foreman","");
INSERT INTO inv_employee VALUES("2018","SPL-005207","Md. Tanim Khan","Saif Powertec Ltd.","SPOT","Operation","FLT Operator","");
INSERT INTO inv_employee VALUES("2019","SPL-005208","Md. Zahid Hossain","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2020","SPL-005209","M.G.S Qibria","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2021","SPL-005210","Shakhawat Hossain Khan","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2022","SPL-005211","Md. Kaoser","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("2023","SPL-005212","Md. Shofi Ullah","Saif Powertec Ltd.","SPOT","Administration","Head Cook","");
INSERT INTO inv_employee VALUES("2024","SPL-005213","Md. Shahin Hossain","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("2025","SPL-005214","Md. Shihabul Alam","Saif Powertec Ltd.","Corporate","Administration","Officer","");
INSERT INTO inv_employee VALUES("2026","SPL-005215","Md. Rajib","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2027","SPL-005216","Tutul Ali","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Foreman","");
INSERT INTO inv_employee VALUES("2028","SPL-005217","Md. Zakir Hossain","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2029","SPL-005218","Md. Raju","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Assistant Foreman","");
INSERT INTO inv_employee VALUES("2030","SPL-005219","Md Ali Hossen","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("2031","SPL-005220","Md Imran Hossain Shopon","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2032","SPL-005221","Md. Shahidul Islam","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("2033","SPL-005241","Md. Abdul Alim","Saif Powertec Ltd.","Battery","IT","Assistant","");
INSERT INTO inv_employee VALUES("2034","SPL-005242","Md. Faridul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2035","SPL-005243","Rony Mollik","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2036","SPL-005244","Md. Masum Hossain Molla","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("2037","SPL-005246","Md Abdul Razzak","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2038","SPL-005248","Md. Emdadul Haque","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("2039","SPL-005252","Abdul Kader","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2040","SPL-005254","Md. Rasel Beg","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2041","SPL-005255","Md. Tariqul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2042","SPL-005256","Md. Imran Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2043","SPL-005257","Md. Rofiz","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2044","SPL-005260","Md Shahin Alam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2045","SPL-005261","Sayem","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2046","SPL-005262","Md. Azad Hossain","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2047","SPL-005263","Md Kabul","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2048","SPL-005264","Md. Moklesur Rahman","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2049","SPL-005266","Abid Hossain","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2050","SPL-005268","Sourave Das","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2051","SPL-005269","Md. Alomgir Hossain","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2052","SPL-005271","Md. Nur Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2053","SPL-005272","Amananda Dev","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2054","SPL-005273","Joydeb Deb Sharma","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2055","SPL-005274","Md. Montasir Billah","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2056","SPL-005275","Md. Al Mamun","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2057","SPL-005276","Md. Aminul Islam","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2058","SPL-005277","Md. Saiful Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("2059","SPL-005278","Kabir Mondol","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2060","SPL-005279","Md. Anamul Haque","Saif Powertec Ltd.","Battery","CMP","Head Technician","");
INSERT INTO inv_employee VALUES("2061","SPL-005280","Dhanodeb Kumar Ray","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2062","SPL-005281","Muhmmad Abu Ryhan","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2063","SPL-005282","Md. Shafiqul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("2064","SPL-005283","Md. Mominul Islam Momin","Saif Powertec Ltd.","Battery","CMP","Head Technician","");
INSERT INTO inv_employee VALUES("2065","SPL-005284","Alauddin Mohon","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2066","SPL-005285","Durjo Kumar Deb Sharma","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2067","SPL-005286","Md. Amzad Hossain","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2068","SPL-005287","Alu Welson Chisim","Saif Powertec Ltd.","Battery","Assembly","Head Technician","");
INSERT INTO inv_employee VALUES("2069","SPL-005288","Md. Nazmul Haque","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2070","SPL-005289","Md. Abu Rayhan Sarker","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("2071","SPL-005290","Badal Miah","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("2072","SPL-005291","Sree Modhu Ram","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2073","SPL-005292","Md. Masud","Saif Powertec Ltd.","Battery","CMP","Head Technician","");
INSERT INTO inv_employee VALUES("2074","SPL-005293","Md. Mokhlesur Rahman","Saif Powertec Ltd.","Battery","Gel And VRLA","Technician","");
INSERT INTO inv_employee VALUES("2075","SPL-005294","Md. Fazlur Rahman","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2076","SPL-005295","Anik Dibra","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2077","SPL-005297","Md. Khalil","Saif Powertec Ltd.","Battery","Administration","Head Cook","");
INSERT INTO inv_employee VALUES("2078","SPL-005298","Md. Abu Saleh Miah","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("2079","SPL-005299","Ala Uddin","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2080","SPL-005300","Md. Momin Mia","Saif Powertec Ltd.","Battery","Gel And VRLA","Senior Technician","");
INSERT INTO inv_employee VALUES("2081","SPL-005301","Md. Shahjalal","Saif Powertec Ltd.","Battery","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("2082","SPL-005302","Liton Kumar Arjo","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("2083","SPL-005303","Suren Chandra Roy","Saif Powertec Ltd.","Battery","Quality Assurance","Senior Technician","");
INSERT INTO inv_employee VALUES("2084","SPL-005304","Md. Saroar Hossain","Saif Powertec Ltd.","Battery","Quality Assurance","Senior Technician","");
INSERT INTO inv_employee VALUES("2085","SPL-005305","Md. Shahin Sikder","Saif Powertec Ltd.","Battery","Assembly","Head Technician","");
INSERT INTO inv_employee VALUES("2086","SPL-005306","Suman Chandra Sikder","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("2087","SPL-005307","Md. Mutaleb Hossen","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2088","SPL-005308","Bijoy Tudu","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2089","SPL-005310","Md. Elias Ali","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("2090","SPL-005311","Md. Shamim Reza","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2091","SPL-005312","Md. Shamim Kader","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2092","SPL-005313","Md. Abu Bakar Akanda","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2093","SPL-005314","Md. Attaur Rahman","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2094","SPL-005315","Md. Shafiqul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2095","SPL-005316","Palash Mondol","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2096","SPL-005317","Md. Amanullah","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2097","SPL-005318","Md. Saiful Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2098","SPL-005319","Fotik Deb Sharma","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2099","SPL-005320","Md. Nazrul Islam","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Senior Technician","");
INSERT INTO inv_employee VALUES("2100","SPL-005321","Hafizur Rahman","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2101","SPL-005323","Md. Faridul Islam","Saif Powertec Ltd.","Battery","RAndD","Head Technician","");
INSERT INTO inv_employee VALUES("2102","SPL-005324","Md. Mamun Hossain","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2103","SPL-005325","Md. Omar Faruq","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2104","SPL-005326","Md. Abdul Ahad Mia","Saif Powertec Ltd.","Battery","Quality Assurance","Senior Technician","");
INSERT INTO inv_employee VALUES("2105","SPL-005327","Rabiul Islam","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2106","SPL-005328","Sonjit Ray","Saif Powertec Ltd.","Battery","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("2107","SPL-005335","Md. Mahmudul Hasan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2108","SPL-005336","Md. Al- Amin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2109","SPL-005338","Kazi Golam Sarowar","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("2110","SPL-005339","Md. Faruk","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2111","SPL-005409","Ashiya Khatun","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("2112","SPL-005411","Md. Shakil","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("2113","SPL-005436","Md. Shipon Miah","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("2114","SPL-005437","Md. Arshad Alam","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("2115","SPL-005447","Md. Abdur Rahim","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("2116","SPL-005450","Dalim Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2117","SPL-005451","Md. Golam Kibria","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2118","SPL-005457","Md. Kofil Uddin","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("2119","SPL-005459","Md. Faruk Hossain","Saif Powertec Ltd.","Sub Station","Operation","Junior Engineer","");
INSERT INTO inv_employee VALUES("2120","SPL-005460","Md. Mahedi Hasan","Saif Powertec Ltd.","Battery","Quality Assurance","Senior Officer","");
INSERT INTO inv_employee VALUES("2121","SPL-005461","Md. Rabiul Awal","Saif Powertec Ltd.","Sub Station","Switch Gear","Technician","");
INSERT INTO inv_employee VALUES("2122","SPL-005462","Sree Ranjon Roy","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("2123","SPL-005463","Md. Rafiqul Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("2124","SPL-005464","Md. Golam Mostafa","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("2125","SPL-005465","Kuddus Mirda","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("2126","SPL-005466","Md. Shiraj Mollah","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("2127","SPL-005468","Md. Shohel Rana","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2128","SPL-005469","Md. Mehedi Hasan Rony","Saif Powertec Ltd.","Energy and Mineral Resource","Administration","Manager","");
INSERT INTO inv_employee VALUES("2129","SPL-005470","Md. Rafiul Hasan","Saif Powertec Ltd.","Battery","Sales Operation","Senior Manager","");
INSERT INTO inv_employee VALUES("2130","SPL-005471","Md. Aslam Tarafder","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("2131","SPL-005472","Md. Delwar Hossain","Saif Powertec Ltd.","Corporate","Administration","Assistant","");
INSERT INTO inv_employee VALUES("2132","SPL-005473","Md. Saiful Islam","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("2133","SPL-005474","Md. Milton Hossain","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("2134","SPL-005476","Md. Din Islam","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("2135","SPL-005477","Md. Ahasan Habib","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("2136","SPL-005479","Md. Roknuzzaman","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("2137","SPL-005480","Sahadat Hossain","Saif Powertec Ltd.","Battery","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("2138","SPL-005481","Md. Rokibul Hasan","Saif Powertec Ltd.","Battery","Sales Operation","Officer","");
INSERT INTO inv_employee VALUES("2139","SPL-005482","Md. Roquibul Hasan","Saif Powertec Ltd.","Battery","Sales Operation","Senior Officer","");
INSERT INTO inv_employee VALUES("2140","SPL-005483","Md. Rakibul Islam","Saif Powertec Ltd.","Corporate","Brand Communication","Executive","");
INSERT INTO inv_employee VALUES("2141","SPL-005487","Md. Sifur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("2142","SPL-005488","Ekram Bin Mahabub","Saif Powertec Ltd.","Corporate","Business Development","Executive","");
INSERT INTO inv_employee VALUES("2143","SPL-005490","Md. Mehedi Hasan","Saif Powertec Ltd.","Battery","Administration","Assistant","");
INSERT INTO inv_employee VALUES("2144","SPL-005491","Sunil Rozario","Saif Powertec Ltd.","Battery","Administration","Cook","");
INSERT INTO inv_employee VALUES("2145","SPL-005492","Md. Munna Islam","Saif Powertec Ltd.","Energy Business","Administration","Driver","");
INSERT INTO inv_employee VALUES("2146","SPL-005493","Somor Rebaru","Saif Powertec Ltd.","Battery","Administration","Canteen Boy","");
INSERT INTO inv_employee VALUES("2147","SPL-005494","Raju Purification","Saif Powertec Ltd.","Battery","Administration","Canteen Boy","");
INSERT INTO inv_employee VALUES("2148","SPL-005495","Nabiul Islam","Saif Powertec Ltd.","Battery","Administration","Canteen Boy","");
INSERT INTO inv_employee VALUES("2149","SPL-005496","Mst. Nazma Begum","Saif Powertec Ltd.","Battery","Administration","Canteen Boy","");
INSERT INTO inv_employee VALUES("2150","SPL-005497","Abdul Baten Morol","Saif Powertec Ltd.","Battery","Administration","Canteen Boy","");
INSERT INTO inv_employee VALUES("2151","SPL-005500","Md. Jamal Mia Monse","Saif Powertec Ltd.","Battery","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("2152","SPL-005501","Sri Shopon Kumar Das","Saif Powertec Ltd.","CTED-Dhaka","Administration","Driver","");
INSERT INTO inv_employee VALUES("2153","SPL-005502","Md. Forkan Dewan","Saif Powertec Ltd.","Battery","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("2154","SPL-005505","Md. Mukhlesur Rahman","Saif Powertec Ltd.","Corporate","Administration","Executive","");
INSERT INTO inv_employee VALUES("2155","SPL-005506","Md. Manik Hossain","Saif Powertec Ltd.","Battery","Administration","Canteen Boy","");
INSERT INTO inv_employee VALUES("2156","SPL-005508","Md. Anamul Hoque","Saif Powertec Ltd.","Battery","Administration","Canteen Boy","");
INSERT INTO inv_employee VALUES("2157","SPL-005510","Md. Rasel Hossain","Saif Powertec Ltd.","Battery","Administration","Canteen Boy","");
INSERT INTO inv_employee VALUES("2158","SPL-005511","Md. Ahasan-Ul-Karim","Saif Powertec Ltd.","Battery","Planning And Coordination","Manager","");
INSERT INTO inv_employee VALUES("2159","SPL-005512","Md. Hafizur Rahman","Saif Powertec Ltd.","Battery","Assembly","Senior Manager","");
INSERT INTO inv_employee VALUES("2160","SPL-005513","Md. Easin Hossain","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Senior Officer","");
INSERT INTO inv_employee VALUES("2161","SPL-005514","Md. Sajjad Hossain","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Senior Officer","");
INSERT INTO inv_employee VALUES("2162","SPL-005515","Mohammad Shoibul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Officer","");
INSERT INTO inv_employee VALUES("2163","SPL-005516","Rashed Anwer","Saif Powertec Ltd.","Battery","Plate Preparation","Officer","");
INSERT INTO inv_employee VALUES("2164","SPL-005517","Navid Anzoom","Saif Powertec Ltd.","Battery","Assembly","Officer","");
INSERT INTO inv_employee VALUES("2165","SPL-005518","Punam Kumar Kundu","Saif Powertec Ltd.","Battery","Charging","Officer","");
INSERT INTO inv_employee VALUES("2166","SPL-005519","Md. Anwarul Kadir","Saif Powertec Ltd.","Battery","Charging","Senior Officer","");
INSERT INTO inv_employee VALUES("2167","SPL-005520","Md. Ainul Trafder","Saif Powertec Ltd.","Battery","Gel And VRLA","Officer","");
INSERT INTO inv_employee VALUES("2168","SPL-005521","Milan Kar","Saif Powertec Ltd.","Battery","Planning And Coordination","Senior Officer","");
INSERT INTO inv_employee VALUES("2169","SPL-005524","Md Mahaful Alam Reza","Saif Powertec Ltd.","Battery","Maintenance","Senior Officer","");
INSERT INTO inv_employee VALUES("2170","SPL-005525","Md. Alfaz Uddin","Saif Powertec Ltd.","Battery","Maintenance","Executive","");
INSERT INTO inv_employee VALUES("2171","SPL-005526","Md. Mynul Hossen","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Officer","");
INSERT INTO inv_employee VALUES("2172","SPL-005527","Md. Sazzad Mahmud","Saif Powertec Ltd.","Battery","Assembly","Senior Officer","");
INSERT INTO inv_employee VALUES("2173","SPL-005528","Abu Naym Md. Soweb","Saif Powertec Ltd.","Battery","Assembly","Senior Officer","");
INSERT INTO inv_employee VALUES("2174","SPL-005529","Md. Atiqur Rahman","Saif Powertec Ltd.","Battery","Assembly","Senior Officer","");
INSERT INTO inv_employee VALUES("2175","SPL-005530","Kazi Mohammad Kashed Siddique","Saif Powertec Ltd.","Battery","Charging","Assistant Manager","");
INSERT INTO inv_employee VALUES("2176","SPL-005531","Md. Kamrul Hassan Sarker","Saif Powertec Ltd.","Battery","Quality Assurance","Executive","");
INSERT INTO inv_employee VALUES("2177","SPL-005532","Md. Osman Goni","Saif Powertec Ltd.","Battery","Finance And Accounts","Senior Manager","");
INSERT INTO inv_employee VALUES("2178","SPL-005533","Jahangir Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Deputy Manager","");
INSERT INTO inv_employee VALUES("2179","SPL-005534","Md. Sumon Mia","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2180","SPL-005535","Md. Souhag Mia","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2181","SPL-005536","Md. Hasan Sheikh","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2182","SPL-005537","Md. Azahar Ali","Saif Powertec Ltd.","Battery","Quality Assurance","Senior Technician","");
INSERT INTO inv_employee VALUES("2183","SPL-005538","Md. Kaoser","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2184","SPL-005539","Md. Samim Hossain","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2185","SPL-005540","Jahangir Ahamed","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2186","SPL-005541","Md. Maruf Hossain","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2187","SPL-005542","Md. Momin","Saif Powertec Ltd.","Battery","Maintenance","Assistant","");
INSERT INTO inv_employee VALUES("2188","SPL-005543","Md. Sajedur Rahman Shantu","Saif Powertec Ltd.","Battery","Quality Assurance","Senior Technician","");
INSERT INTO inv_employee VALUES("2189","SPL-005545","Bablu Kisku","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("2190","SPL-005546","Md. Dalwar Hossain","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2191","SPL-005547","Petrick Rozario","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2192","SPL-005548","Md. Monir Hossain","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2193","SPL-005549","Md. Abu Taher","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2194","SPL-005550","Md. Panna Sarkar","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2195","SPL-005551","Md. Ziyaul Hoque","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2196","SPL-005552","Md. Ziyaul Hoque","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2197","SPL-005553","Md. Alal Hosan","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2198","SPL-005554","Md. Saikat Mahmod Monir","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("2199","SPL-005555","Md. Rafiq Mia","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("2200","SPL-005556","Md. Robiul Islam","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2201","SPL-005557","Md. Rubel","Saif Powertec Ltd.","Battery","Administration","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("2202","SPL-005558","Amitabh Roy","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2203","SPL-005559","Md. Abul Kalam Azad","Saif Powertec Ltd.","Battery","Quality Assurance","Head Technician","");
INSERT INTO inv_employee VALUES("2204","SPL-005560","Md. Mir Hossain","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("2205","SPL-005562","Md. Shahab Uddin","Saif Powertec Ltd.","Battery","Administration","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("2206","SPL-005563","Mahamud Mollah","Saif Powertec Ltd.","Battery","Administration","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("2207","SPL-005564","Dipok Shaha","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("2208","SPL-005565","Kazi Muhammad Baky Billah","Saif Powertec Ltd.","Battery","Administration","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("2209","SPL-005566","Md. Dulal Ali","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2210","SPL-005567","Mehedi Hasan Riju","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2211","SPL-005568","Nirmal Chondra Roy","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2212","SPL-005569","Sadekul Islam","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2213","SPL-005570","Md. Younus Ali","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2214","SPL-005571","Md. Al Amin","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2215","SPL-005572","Shahin Sheikh","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2216","SPL-005573","Md. Imam Mehedi","Saif Powertec Ltd.","Battery","Quality Assurance","Head Technician","");
INSERT INTO inv_employee VALUES("2217","SPL-005574","Md. Golam Rabbane Mia","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("2218","SPL-005575","B. M. Naimur Rahman","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("2219","SPL-005577","Md. Imran Hossen","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2220","SPL-005578","Sultan Mahmud","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2221","SPL-005579","Gazi Mahabubur Rahman","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2222","SPL-005583","Kamal Bepary","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Senior Technician","");
INSERT INTO inv_employee VALUES("2223","SPL-005584","Amit Kumar Mondal","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2224","SPL-005585","Md. Rwoson Ali","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2225","SPL-005586","Md. Ziaur Rahman","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2226","SPL-005587","Kawser Hossain","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2227","SPL-005588","Md. Farid Ali","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2228","SPL-005590","Mahidi Hasan","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2229","SPL-005591","Md. Mokasur Rahman","Saif Powertec Ltd.","Battery","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("2230","SPL-005592","Md. Ibrahim Hossain","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2231","SPL-005593","Md. Rasel","Saif Powertec Ltd.","Battery","Administration","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("2232","SPL-005595","Biplob Gomes","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2233","SPL-005596","Md. Ashraful Alam","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2234","SPL-005597","Md. Shahidul Islam Monir","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("2235","SPL-005598","Md. Raja Mia","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2236","SPL-005599","Amrito Kumar Sarkar","Saif Powertec Ltd.","Battery","Maintenance","Officer","");
INSERT INTO inv_employee VALUES("2237","SPL-005600","Md. Ruhul Amin","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("2238","SPL-005601","Mr Probal Mankhin","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("2239","SPL-005602","Rajkumar Deb Sharma","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("2240","SPL-005603","Soptom Biswas","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("2241","SPL-005605","Md. Ruhul Amin","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2242","SPL-005606","Md. Eleyas Mia","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("2243","SPL-005607","Nicholas Soren","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2244","SPL-005608","Rasel Khan","Saif Powertec Ltd.","Battery","Administration","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("2245","SPL-005611","Proshanta Kumar Paul","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2246","SPL-005613","Md. Badal Hossain","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("2247","SPL-005614","Md. Juwel Miah","Saif Powertec Ltd.","Renewable Energy","Service And Maintanance","Welder","");
INSERT INTO inv_employee VALUES("2248","SPL-005615","Md. Monir Hossain","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("2249","SPL-005616","Md. Babul Miah","Saif Powertec Ltd.","Renewable Energy","Service And Maintanance","Helper","");
INSERT INTO inv_employee VALUES("2250","SPL-005617","Md. Ariful Islam","Saif Powertec Ltd.","Battery","Quality Assurance","Senior Technician","");
INSERT INTO inv_employee VALUES("2251","SPL-005618","Farhan Saeed","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("2252","SPL-005619","Md. Ismail Hossain","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("2253","SPL-005620","Md. Rakib Rahman","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("2254","SPL-005622","Sarif Hossain","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("2255","SPL-005624","Md. Sahin Shekh","Saif Powertec Ltd.","Renewable Energy","Service And Maintanance","Helper","");
INSERT INTO inv_employee VALUES("2256","SPL-005626","Md. Abdur Rahaman","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2257","SPL-005627","Kajol Chandra Das","Saif Powertec Ltd.","Renewable Energy","Service And Maintanance","Helper","");
INSERT INTO inv_employee VALUES("2258","SPL-005628","Md. Rasel Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2259","SPL-005629","Md. Abdul Alim","Saif Powertec Ltd.","Battery","CMP","Officer","");
INSERT INTO inv_employee VALUES("2260","SPL-005632","Md. Mahafuzer Rahman","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("2261","SPL-005633","Mostofa Shak","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2262","SPL-005634","Sala Uddin","Saif Powertec Ltd.","Battery","CMP","Head Technician","");
INSERT INTO inv_employee VALUES("2263","SPL-005635","Md. Kamal Hossain","Saif Powertec Ltd.","Battery","CMP","Head Technician","");
INSERT INTO inv_employee VALUES("2264","SPL-005636","Md. Shohidul Islam Mollah","Saif Powertec Ltd.","Renewable Energy","Service And Maintanance","Senior Technician","");
INSERT INTO inv_employee VALUES("2265","SPL-005637","Md. Abusama","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2266","SPL-005638","Giaul Hak","Saif Powertec Ltd.","Battery","CMP","Head Technician","");
INSERT INTO inv_employee VALUES("2267","SPL-005639","Md. Hafizur Rahman","Saif Powertec Ltd.","Battery","CMP","Head Technician","");
INSERT INTO inv_employee VALUES("2268","SPL-005640","Md. Dulal Mia","Saif Powertec Ltd.","Corporate","Administration","In-Charge","");
INSERT INTO inv_employee VALUES("2269","SPL-005641","Chandranath Mondal","Saif Powertec Ltd.","Battery","CMP","Head Technician","");
INSERT INTO inv_employee VALUES("2270","SPL-005643","Md. Nur Alam Siddik","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2271","SPL-005644","Md. Hadichur Rahman","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2272","SPL-005645","Md. Shagor Hasan","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2273","SPL-005646","Md. Imran Akon","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2274","SPL-005647","Milon Biswas","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2275","SPL-005648","Md. Sirajul Islam","Saif Powertec Ltd.","Battery","Charging","Senior Technician","");
INSERT INTO inv_employee VALUES("2276","SPL-005649","Md. Raihan Parves","Saif Powertec Ltd.","Battery","Charging","Senior Technician","");
INSERT INTO inv_employee VALUES("2277","SPL-005650","Abdul Alim","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2278","SPL-005651","Mozzamel Haque Bhuiyan","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2279","SPL-005652","Md. Zalal Uddin","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2280","SPL-005653","Md. Machin Mia","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2281","SPL-005654","Md. Ashikur Rahman","Saif Powertec Ltd.","Battery","Charging","Senior Technician","");
INSERT INTO inv_employee VALUES("2282","SPL-005655","Md. Alamgir Hossain","Saif Powertec Ltd.","Battery","Charging","Senior Technician","");
INSERT INTO inv_employee VALUES("2283","SPL-005656","Md. Babul Hossain","Saif Powertec Ltd.","Battery","Charging","Senior Technician","");
INSERT INTO inv_employee VALUES("2284","SPL-005657","Rana Palma","Saif Powertec Ltd.","Battery","Charging","Senior Technician","");
INSERT INTO inv_employee VALUES("2285","SPL-005658","Md. Abdus Salam","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2286","SPL-005659","Md. Masud Ali","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2287","SPL-005660","Saiful Biswas","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2288","SPL-005661","Md. Baizid Mustabid","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2289","SPL-005662","Md. Mojammal Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2290","SPL-005664","Sanowar Hossain","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2291","SPL-005666","Roktim","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2292","SPL-005667","Methun Biswas","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2293","SPL-005669","Swadeb Deb Sharma","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2294","SPL-005671","Md. Hazrat Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2295","SPL-005674","Md. Belal Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2296","SPL-005676","Md. Abdullah","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2297","SPL-005677","Md. Rabiul Islam","Saif Powertec Ltd.","Battery","Store","Technician","");
INSERT INTO inv_employee VALUES("2298","SPL-005678","Subas Chandra Dev Sharma","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2299","SPL-005680","Md. Zahid Hasan","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2300","SPL-005681","Md. Mamun","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2301","SPL-005682","Md. Nuruzzaman","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2302","SPL-005683","Md. Ab. Hannan Mollha","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("2303","SPL-005685","Md. Jakirul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2304","SPL-005686","Md. Belayt Hossen","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2305","SPL-005687","Md. Anamul Haque","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2306","SPL-005688","Md. Delour Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2307","SPL-005691","Md. Nazmul Haque","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2308","SPL-005692","Md. Liakot Ali Ripon","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2309","SPL-005693","Jamil Rahman","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2310","SPL-005694","Pobitro Dev","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2311","SPL-005695","Moniruzzaman","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2312","SPL-005696","Md. Rashedul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2313","SPL-005697","Md. Kamruj Zaman","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2314","SPL-005698","Md. Harun Sarker","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2315","SPL-005699","Md. Sadekul Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2316","SPL-005700","Md. Rasheduzzaman Mallik","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2317","SPL-005701","Md. Mominul Islam","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2318","SPL-005703","Md. Rifat Ahmed Imran","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2319","SPL-005705","Sree Baburam Roy","Saif Powertec Ltd.","Battery","Charging","Senior Technician","");
INSERT INTO inv_employee VALUES("2320","SPL-005706","Selim Mia","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2321","SPL-005707","Md. Arfan Ali","Saif Powertec Ltd.","Battery","Charging","Head Technician","");
INSERT INTO inv_employee VALUES("2322","SPL-005708","Shariful Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2323","SPL-005709","Md. Abdur Roshid","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2324","SPL-005710","Md. Anisur Rahman","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2325","SPL-005711","Md. Lutfar Rahman","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2326","SPL-005712","Md. Julhash Khan","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2327","SPL-005713","Md. Mainuddin Rana","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2328","SPL-005715","Md. Ruhul Amin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2329","SPL-005716","Md. Rafiul Islam","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2330","SPL-005719","Md. Jahidur Rahman","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2331","SPL-005720","Aman Ullah Patan","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2332","SPL-005721","Md. Mamun Sarker","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2333","SPL-005723","Md. Saha Alam","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2334","SPL-005724","Md. Monjur Rashid","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2335","SPL-005725","Md. Abu Daud","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2336","SPL-005726","Monir Uddin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2337","SPL-005727","Md. Monarul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2338","SPL-005730","Md. Sharif Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2339","SPL-005731","Md. Abul Bashar","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2340","SPL-005732","Solaiman","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2341","SPL-005733","Md. Hridoy Ahammed","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2342","SPL-005736","Abdur Rahman Sagor","Saif Powertec Ltd.","Battery","Plate Preparation","Technical Helper","");
INSERT INTO inv_employee VALUES("2343","SPL-005737","Md. Nazmul Kabir","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2344","SPL-005742","Md. Morad Mia","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2345","SPL-005743","Md. Rashedul Uddin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2346","SPL-005744","Saroj Bakchi","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2347","SPL-005745","Md. Siddikuzzaman","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2348","SPL-005746","Md. Mustafizur Rahman","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2349","SPL-005748","Asadul","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2350","SPL-005750","Md. Sumon Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2351","SPL-005755","Md. Saiful Islam","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Loader","");
INSERT INTO inv_employee VALUES("2352","SPL-005756","Md. Hanif","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Loader","");
INSERT INTO inv_employee VALUES("2353","SPL-005757","Md. Ismail Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2354","SPL-005758","Md. Mahabub Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2355","SPL-005761","Md. Gulbar Hosen Shaikh","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Loader","");
INSERT INTO inv_employee VALUES("2356","SPL-005764","Md. Mannan Mia","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Loader","");
INSERT INTO inv_employee VALUES("2357","SPL-005771","Saiful Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2358","SPL-005773","Md. Ahsan Habib","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2359","SPL-005774","Md. Johirul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2360","SPL-005777","Paritose Chandra Roy","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2361","SPL-005778","Md. Abdul Based","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2362","SPL-005780","Robiul Hossain","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2363","SPL-005781","Md. Mosrraf Hossain","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2364","SPL-005783","Md. Omar Faruk Tuhin","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2365","SPL-005785","Md. Anichal Haque","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2366","SPL-005786","Suresh Stephen Mankin","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2367","SPL-005787","Samim Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2368","SPL-005788","Md. Nurul Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2369","SPL-005789","Syed Akram Hossan","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2370","SPL-005790","Md. Salah Uddin","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2371","SPL-005791","Md. Yeasin Mia Shimul","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2372","SPL-005792","Md. Serajul Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2373","SPL-005793","Md. Imran Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2374","SPL-005794","Md. Rasel Mian","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2375","SPL-005796","Md. Jafor Ikbal","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2376","SPL-005797","Horendra Nath Broman","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2377","SPL-005799","Md. Sohel Rana","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2378","SPL-005800","Md. Ruhul Amin","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2379","SPL-005802","Md. Rishadul Islam Ranak","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2380","SPL-005803","Ripon Ali","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2381","SPL-005805","Shimanta Mardi","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2382","SPL-005806","Md. Forhad Hossen","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2383","SPL-005808","Rukunuzzaman","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2384","SPL-005809","Md. Shamim Ali","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2385","SPL-005811","Md Abdul Qayum Sharif","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2386","SPL-005812","Saiful Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2387","SPL-005813","Md. Abdul Karim","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2388","SPL-005815","Md. Abdul Alim","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2389","SPL-005816","Md. Kamruzzaman","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2390","SPL-005817"," Rubel Molla","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2391","SPL-005818","Rashidul Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2392","SPL-005819","Md. Shohidul Islam","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2393","SPL-005821","Sadiqul","Saif Powertec Ltd.","Battery","Assembly","Head Technician","");
INSERT INTO inv_employee VALUES("2394","SPL-005824","Md. Mostafizur Rahman","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2395","SPL-005825","Md. Muniruzzaman","Saif Powertec Ltd.","Battery","Assembly","Head Technician","");
INSERT INTO inv_employee VALUES("2396","SPL-005827","Md. Zahidul Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2397","SPL-005833","Md. Mobarak Ali","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2398","SPL-005834","Md. Anowar Hossain","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2399","SPL-005835","Md. Abul Hasanat","Saif Powertec Ltd.","Battery","Assembly","Head Technician","");
INSERT INTO inv_employee VALUES("2400","SPL-005836","Abdul Alim","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2401","SPL-005837","Md. Robiul Islam","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2402","SPL-005838","Md. Masud Rana","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2403","SPL-005839","Md. Sabidul Sharif Rabbi","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2404","SPL-005840","Md. Rafiqul Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2405","SPL-005841","Pankaj Costa","Saif Powertec Ltd.","Battery","MC","Head Technician","");
INSERT INTO inv_employee VALUES("2406","SPL-005842","Md. Shakil Bhuya","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2407","SPL-005843","Md. Mofizul Bari Bhuiya","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2408","SPL-005844","Md. Firoz Ahmmed","Saif Powertec Ltd.","Battery","Administration","Officer","");
INSERT INTO inv_employee VALUES("2409","SPL-005845","Md. Shirajul Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("2410","SPL-005847","Md. Alam Shek","Saif Powertec Ltd.","Battery","Administration","Head Cook","");
INSERT INTO inv_employee VALUES("2411","SPL-005848","Md. Monowar Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2412","SPL-005849","Md. Anowar Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2413","SPL-005851","Md. Mostafizur Rahman","Saif Powertec Ltd.","Renewable Energy","Operation","Assistant Manager","");
INSERT INTO inv_employee VALUES("2414","SPL-005852","Md. Jakirul Islam","Saif Powertec Ltd.","Renewable Energy","Service And Maintanance","Supervisor","");
INSERT INTO inv_employee VALUES("2415","SPL-005853","Miraj Sheikh","Saif Powertec Ltd.","Power and Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("2416","SPL-005855","Md. Ekbal Hossain","Saif Powertec Ltd.","Battery","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("2417","SPL-005857","Md. Belal Hossain Miah","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("2418","SPL-005858","Md. Nayan","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("2419","SPL-005859","Md. Sohel Rana","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2420","SPL-005863","Md. Anowar Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2421","SPL-005867","Md. Kamal Khan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2422","SPL-005868","Md. Golam Rabbani Molla","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2423","SPL-005870","Md. Shohel Rana","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2424","SPL-005872","Md. Shahriar Ibn Selim Robin","Saif Powertec Ltd.","Battery","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("2425","SPL-005873","Md. Aqibul Islam","Saif Powertec Ltd.","Battery","Planning And Coordination","Assistant Manager","");
INSERT INTO inv_employee VALUES("2426","SPL-005874","Md. Firuj Islam","Saif Powertec Ltd.","Sub Station","Project","Assistant Manager","");
INSERT INTO inv_employee VALUES("2427","SPL-005878","Shamal Chandra Dev Sharma","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2428","SPL-005879","Chandan Kumar Roy","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2429","SPL-005880","Rabbi Hossen","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2430","SPL-005881","Md. Rakibul Islam","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2431","SPL-005882","Md. Kabiruzzaman","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2432","SPL-005884","Md. Shohel Rana","Saif Powertec Ltd.","Battery","Plate Preparation","Head Technician","");
INSERT INTO inv_employee VALUES("2433","SPL-005886","Md. Milon","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2434","SPL-005889","Md. Atikur Rahman","Saif Powertec Ltd.","Battery","Charging","Senior Technician","");
INSERT INTO inv_employee VALUES("2435","SPL-005891","Sheikh Mohammad Shamshuzzaman","Saif Powertec Ltd.","Battery","Service And WSS","Executive","");
INSERT INTO inv_employee VALUES("2436","SPL-005892","Khaled Ferdous","Saif Powertec Ltd.","Battery","Service And WSS","Officer","");
INSERT INTO inv_employee VALUES("2437","SPL-005893","Md. Sariful Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2438","SPL-005894","Md. Ariful Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2439","SPL-005895","Salim Raza","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2440","SPL-005896","Komol Chandra Roy","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2441","SPL-005897","S. M. Maidul Islam","Saif Powertec Ltd.","Battery","MC","Senior Technician","");
INSERT INTO inv_employee VALUES("2442","SPL-005898","Ziaul Hoque","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2443","SPL-005899","Md. Jahangir Alam","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("2444","SPL-005903","Saddam Hossain","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("2445","SPL-005905","Md. Ismail","Saif Powertec Ltd.","SPOT","Administration","In-Charge","");
INSERT INTO inv_employee VALUES("2446","SPL-005907","Md. Abu Ismail","Saif Powertec Ltd.","SPOT","Operation","Advisor","");
INSERT INTO inv_employee VALUES("2447","SPL-005908","Md. Moniruzzaman","Saif Powertec Ltd.","SPOT","Operation","Consultant","");
INSERT INTO inv_employee VALUES("2448","SPL-005909","Md. Khorshed Husain","Saif Powertec Ltd.","SPOT","Finance And Accounts","General Manager","");
INSERT INTO inv_employee VALUES("2449","SPL-005910","A.K.M. Fazlul Haque","Saif Powertec Ltd.","SPOT","Administration","General Manager","");
INSERT INTO inv_employee VALUES("2450","SPL-005911","Md. Rezaul Karim","Saif Powertec Ltd.","SPOT","Administration","Senior Manager","");
INSERT INTO inv_employee VALUES("2451","SPL-005912","Sohel Pervez","Saif Powertec Ltd.","SPOT","Administration","Senior Manager","");
INSERT INTO inv_employee VALUES("2452","SPL-005913","Zia Uddin Manik Chowdhury","Saif Powertec Ltd.","SPOT","Purchase And Procurement","Deputy Manager","");
INSERT INTO inv_employee VALUES("2453","SPL-005914","Aetasham Rashul","Saif Powertec Ltd.","SPOT","Finance And Accounts","Manager","");
INSERT INTO inv_employee VALUES("2454","SPL-005915","Md. Nasir Mahmud","Saif Powertec Ltd.","SPOT","Administration","Liason Officer","");
INSERT INTO inv_employee VALUES("2455","SPL-005916","Mosarraf Hossain","Saif Powertec Ltd.","SPOT","Administration","Estate Officer","");
INSERT INTO inv_employee VALUES("2456","SPL-005917","Ferhana Ferdous","Saif Powertec Ltd.","SPOT","Administration","Executive","");
INSERT INTO inv_employee VALUES("2457","SPL-005918","Hossain Muhammad Arafat","Saif Powertec Ltd.","SPOT","Administration","Junior Officer","");
INSERT INTO inv_employee VALUES("2458","SPL-005919","Tuton Majumder","Saif Powertec Ltd.","SPOT","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("2459","SPL-005920","Md. Zakir Hossain","Saif Powertec Ltd.","SPOT","Administration","Officer","");
INSERT INTO inv_employee VALUES("2460","SPL-005921","Zillur Rahman","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2461","SPL-005922","Md. Shahriar","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2462","SPL-005923","Md. Helal Khan Panu","Saif Powertec Ltd.","SPOT","Administration","Supervisor","");
INSERT INTO inv_employee VALUES("2463","SPL-005924","Md. Farid","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("2464","SPL-005926","Md. Ibrahim","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("2465","SPL-005927","Md. Didarul Alam Mintu","Saif Powertec Ltd.","SPOT","Administration","Peon","");
INSERT INTO inv_employee VALUES("2466","SPL-005928","Seraz Uddin","Saif Powertec Ltd.","CTED-CTG","Administration","Peon","");
INSERT INTO inv_employee VALUES("2467","SPL-005929","Md. Emran Hosain","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2468","SPL-005930","Babul Ali","Saif Powertec Ltd.","SPOT","Administration","Peon","");
INSERT INTO inv_employee VALUES("2469","SPL-005931","Md. Shorif Hossen","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2470","SPL-005932","Shovon Ahammed","Saif Powertec Ltd.","Battery","Administration","Officer","");
INSERT INTO inv_employee VALUES("2471","SPL-005933","Md. Din Islam Jibon","Saif Powertec Ltd.","SPOT","Operation","Officer","");
INSERT INTO inv_employee VALUES("2472","SPL-005936","Md. Rayhan","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("2473","SPL-005937","Md. Momen Miah","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("2474","SPL-005938","Md. Sajib Sarker","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("2475","SPL-005939","Md. Mahbub Alam","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("2476","SPL-005941","Anarul","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("2477","SPL-005942","Jibon Madbor","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("2478","SPL-005943","Md. Tarqul Islam","Saif Powertec Ltd.","Battery","Maintenance","Officer","");
INSERT INTO inv_employee VALUES("2479","SPL-005944","Ariful Islam","Saif Powertec Ltd.","Sub Station","Switch Gear","Junior Technician","");
INSERT INTO inv_employee VALUES("2480","SPL-005946","Md. Khokon Mia","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("2481","SPL-005947","Md. Mizanur Rahman Samrat","Saif Powertec Ltd.","Energy Business","Administration","Driver","");
INSERT INTO inv_employee VALUES("2482","SPL-005949","Arif Mia","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("2483","SPL-005950","Md. Ali Newas Sharif","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("2484","SPL-005951","Md. Babul Mia","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2485","SPL-005952","A K M Fazlul Haque","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("2486","SPL-005953","Md. Anwar Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2487","SPL-005954","Md. Siddik","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2488","SPL-005955","Md. Shohel Molla","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2489","SPL-005961","Md. Ruhul Amin","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2490","SPL-005962","Obaidul Haque Humayun","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2491","SPL-005963","Shariful Sarder","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2492","SPL-005966","Md. Imran Hossan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2493","SPL-005972","Md. Al Mamun","Saif Powertec Ltd.","Battery","Maintenance","Officer","");
INSERT INTO inv_employee VALUES("2494","SPL-005973","Shah Alam","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("2495","SPL-005974","KM Harun Or Rashid","Saif Powertec Ltd.","SPOT","Operation","Senior Officer","");
INSERT INTO inv_employee VALUES("2496","SPL-005975","Joy Sarkar","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("2497","SPL-005977","Md. Shihabur Rahman","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Officer","");
INSERT INTO inv_employee VALUES("2498","SPL-005978","Md. Uzzol Molla","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2499","SPL-005981","Sakibul Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2500","SPL-005983","Abdul Jabbar","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2501","SPL-005985","Mrinal Roy","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2502","SPL-005986","Jotish Chandra Roy","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2503","SPL-005988","Md. Mahabur Rashid","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2504","SPL-005989","Md. Ashraful Alam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2505","SPL-005990","Nurul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2506","SPL-005991","Md. Baki Billah","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2507","SPL-005992","Md. Lokman Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Officer","");
INSERT INTO inv_employee VALUES("2508","SPL-005994","S K Abul Kalam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2509","SPL-005995","Md. Rafiqul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2510","SPL-005996","Nur Mohammad","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2511","SPL-005997","Md. Saiful Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2512","SPL-005998","Abu Laich","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2513","SPL-005999","Md. Farid","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2514","SPL-006000","Md. Basir Sheikh","Saif Powertec Ltd.","SPOT","Administration","Protocol Officer","");
INSERT INTO inv_employee VALUES("2515","SPL-006001","Md. Fokir Saiful","Saif Powertec Ltd.","SPOT","Administration","Protocol Officer","");
INSERT INTO inv_employee VALUES("2516","SPL-006002","Azizul Islam","Saif Powertec Ltd.","SPOT","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("2517","SPL-006003","Md. Bari","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2518","SPL-006005","Solaiman","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2519","SPL-006007","Md. Faruk Ahamad Sohag","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2520","SPL-006008","Alomgir Hossen","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2521","SPL-006009","Md. Ruhul Amin","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2522","SPL-006010","Md. Noor Alam Siddke","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2523","SPL-006011","Md. Faruq Hossen","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2524","SPL-006012","Md. Shariful Islam","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2525","SPL-006013","Md. Nabin","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2526","SPL-006014","Md. Nur Hossain","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2527","SPL-006015","Md. Suman Baparay","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2528","SPL-006016","Shariful Islam","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2529","SPL-006017","Md. Lion Islam","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2530","SPL-006018","Md. Aktarul Islam","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2531","SPL-006019","Md. Parves Sarker","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("2532","SPL-006021","Md. Rezaul Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2533","SPL-006022","Md. Anisur Rahman","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2534","SPL-006023","Akbar","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2535","SPL-006025","Johurul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2536","SPL-006026","Md. Farhad Hossen","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2537","SPL-006028","Ashraful Moula","Saif Powertec Ltd.","Battery","Sales Operation","Senior Officer","");
INSERT INTO inv_employee VALUES("2538","SPL-006029","Md. Tayeb Ali","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("2539","SPL-006030","Md. Sahab Uddin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2540","SPL-006031","Md. Rony Sheikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2541","SPL-006032","Md. Milon Howlader","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2542","SPL-006034","Md. Abu Kalam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2543","SPL-006035","Abdul Momin","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("2544","SPL-006036","Md. Azharul Islam","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("2545","SPL-006037","Md. Azizul Haque","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2546","SPL-006040","Bhuyan Tariqul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2547","SPL-006041","Jahangir Alam Uzzal","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2548","SPL-006043","Md. Khalilur Rahman","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("2549","SPL-006044","Micheal Sumon Mollick","Saif Powertec Ltd.","Corporate","Brand Communication","Assistant General Manager","");
INSERT INTO inv_employee VALUES("2550","SPL-006045","Md. Ashraf Uddin","Saif Powertec Ltd.","SPOT","Administration","Door Closer","");
INSERT INTO inv_employee VALUES("2551","SPL-006046","Md. Belayet Hossain","Saif Powertec Ltd.","SPOT","Operation","Terminal Superintendent","");
INSERT INTO inv_employee VALUES("2552","SPL-006047","Md. Asadullah","Saif Powertec Ltd.","SPOT","Documentation","Senior Officer","");
INSERT INTO inv_employee VALUES("2553","SPL-006048","Shakhawat Hossain Murad","Saif Powertec Ltd.","SPOT","Operation","Yard Supervisor","");
INSERT INTO inv_employee VALUES("2554","SPL-006049","Md. Tanvir Mahtab","Saif Powertec Ltd.","SPOT","Operation","Yard Supervisor","");
INSERT INTO inv_employee VALUES("2555","SPL-006051","Md. Mosharof","Saif Powertec Ltd.","SPOT","Operation","Foreman","");
INSERT INTO inv_employee VALUES("2556","SPL-006052","Md. Salim","Saif Powertec Ltd.","SPOT","Operation","Foreman","");
INSERT INTO inv_employee VALUES("2557","SPL-006053","Md. Hassan","Saif Powertec Ltd.","SPOT","Operation","Lasher","");
INSERT INTO inv_employee VALUES("2558","SPL-006054","Abdullah Al Mamun","Saif Powertec Ltd.","Battery","Project Development And Implemantaion","Manager","");
INSERT INTO inv_employee VALUES("2559","SPL-006055","Razib Chitrakar","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("2560","SPL-006056","Sohel Bepari","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("2561","SPL-006058","Shakir Ahamed","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2562","SPL-006059","Jahid Hosen","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2563","SPL-006060","Taijul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2564","SPL-006061","Md. Zakir Hossain","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2565","SPL-006063","Israfil Hossen","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2566","SPL-006064","Zuthon Chandra Nath","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2567","SPL-006066","Md. Kabiruzzaman Shuvo","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2568","SPL-006067","Md. Riaz","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2569","SPL-006070","Samim Ahamed Sisir","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2570","SPL-006071","Md. Jahidul Islam","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2571","SPL-006072","Md. Omar Faruk Mondol","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2572","SPL-006073","Naeem Sheikh","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2573","SPL-006076","Abu Bakkar","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2574","SPL-006077","Md. Robiul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2575","SPL-006078","Md. Abul Taher Sarker","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2576","SPL-006080","Md. Rimon Khan","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2577","SPL-006081","Faruk Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2578","SPL-006082","Dulal Chandra Ray","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2579","SPL-006083","Md. Masud Ali","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2580","SPL-006084","Md. Abul Kalam Azad","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2581","SPL-006085","Md. Masumuzzaman","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2582","SPL-006086","Md. Nabi Hossain","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2583","SPL-006087","Md. Nazmul Hossain","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2584","SPL-006088","Md. Masud Rana","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2585","SPL-006089","Md. Badaruddin Kayad","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2586","SPL-006090","Pervaj Hossen","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2587","SPL-006092","Md. Saddam Hossain","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2588","SPL-006093","Md. Azharul Islam","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2589","SPL-006095","Emam Hossain","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2590","SPL-006096","Ahasan Mollah","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2591","SPL-006097","Md. Abusaid","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2592","SPL-006098","Sagar Kazi","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2593","SPL-006099","Debdas Mondal","Saif Powertec Ltd.","Battery","Charging","Senior Technician","");
INSERT INTO inv_employee VALUES("2594","SPL-006100","Ashraful Alam","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2595","SPL-006102","Tafsir Uddin Ahmed","Saif Powertec Ltd.","CTED-CTG","Maintenance","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("2596","SPL-006103","N. I. M. Shujauddowla","Saif Powertec Ltd.","CTED-CTG","Maintenance","General Manager","");
INSERT INTO inv_employee VALUES("2597","SPL-006104","Shibu Chandra Bhowmik","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Chief Engineer","");
INSERT INTO inv_employee VALUES("2598","SPL-006105","Md. Nasir","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Manager","");
INSERT INTO inv_employee VALUES("2599","SPL-006106","Jewel Mazumdar","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2600","SPL-006107","Al-Amin","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2601","SPL-006109","Md. Baki Billah","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2602","SPL-006110","Khorshed Alam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2603","SPL-006111","Md. Aynal Haque","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2604","SPL-006112","Md. Morshedur Rahmam","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2605","SPL-006118","Md. Kamrul Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2606","SPL-006119","Abu Naeem","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2607","SPL-006120","Md. Nazmul Hauqe Bhuiyan","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2608","SPL-006121","Md. Mahasin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2609","SPL-006122","Tubarok Hossin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2610","SPL-006123","Arif","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2611","SPL-006124","Md. Sarowar Hossain Khan","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2612","SPL-006125","Md. Azgar Ali","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2613","SPL-006127","Md. Al-Amin Mia","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2614","SPL-006128","Samar Taju","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2615","SPL-006129","Md. Shahin Alam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2616","SPL-006132","Manjurul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2617","SPL-006133","Md. Parvez Rana","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2618","SPL-006134","Md. Shohel Sarker","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2619","SPL-006137","Abdul Kader Zilani","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Senior Manager","");
INSERT INTO inv_employee VALUES("2620","SPL-006138","Md. Kawsar Akon","Saif Powertec Ltd.","CTED-CTG","Maintenance","Assistant Manager","");
INSERT INTO inv_employee VALUES("2621","SPL-006139","Mirza Abdul Kader Beg","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Assistant Manager","");
INSERT INTO inv_employee VALUES("2622","SPL-006140","Md. Qaikozzaman","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Deputy Manager","");
INSERT INTO inv_employee VALUES("2623","SPL-006141","Md. Anowar Hossain","Saif Powertec Ltd.","CTED-CTG","Purchase And Procurement","Officer","");
INSERT INTO inv_employee VALUES("2624","SPL-006142","Mir Mohammad","Saif Powertec Ltd.","CTED-CTG","Store","Store Officer","");
INSERT INTO inv_employee VALUES("2625","SPL-006143","Md. Mamun Sarder","Saif Powertec Ltd.","CTED-CTG","Maintenance","Store Officer","");
INSERT INTO inv_employee VALUES("2626","SPL-006144","Mohammad Shah Alam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Assistant Manager","");
INSERT INTO inv_employee VALUES("2627","SPL-006145","Diponkar Mitra","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Junior Engineer","");
INSERT INTO inv_employee VALUES("2628","SPL-006146","Md. Abdullah Al Noman","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("2629","SPL-006147","Md. Emam Hossain","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Supervisor","");
INSERT INTO inv_employee VALUES("2630","SPL-006148","Sk Md. Abu Sufian","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Junior Engineer","");
INSERT INTO inv_employee VALUES("2631","SPL-006149","Rubel Kanti Ghosh","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("2632","SPL-006150","Mohammad Ariful Islam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("2633","SPL-006151","Md. Jahid Hassan Chowdhury","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("2634","SPL-006152","Shahedur Rahman Khan","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("2635","SPL-006153","Md. Zafor Sadeque","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Trainee Engineer","");
INSERT INTO inv_employee VALUES("2636","SPL-006154","Md. Jahid Hasan","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("2637","SPL-006155","Sheikh Khalid Hassan","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("2638","SPL-006156","Md. Imam Jakaria","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("2639","SPL-006161","Kazi Tohidul Islam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Supervisor","");
INSERT INTO inv_employee VALUES("2640","SPL-006162","Naresh Kumar Dey","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Supervisor","");
INSERT INTO inv_employee VALUES("2641","SPL-006163","Md. Jamil Islam","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Supervisor","");
INSERT INTO inv_employee VALUES("2642","SPL-006164","Mahamud Kabir Masum","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Supervisor","");
INSERT INTO inv_employee VALUES("2643","SPL-006165","Mohammed Idris","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Welder","");
INSERT INTO inv_employee VALUES("2644","SPL-006166","Md. Abdul Haque","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Welder","");
INSERT INTO inv_employee VALUES("2645","SPL-006167","Md. Shohal Howlader","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Assistant Supervisor","");
INSERT INTO inv_employee VALUES("2646","SPL-006168","Md. Zahirul Islam","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Assistant Supervisor","");
INSERT INTO inv_employee VALUES("2647","SPL-006169","Nurul Amin Badsha","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Senior Technician","");
INSERT INTO inv_employee VALUES("2648","SPL-006170","Main Uddin","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Vulcanizer","");
INSERT INTO inv_employee VALUES("2649","SPL-006171","Md. Amanul Haque","Saif Powertec Ltd.","CTED-CTG","Maintenance","Storeman","");
INSERT INTO inv_employee VALUES("2650","SPL-006172","Md. Salam Dhali","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Senior Mechanic","");
INSERT INTO inv_employee VALUES("2651","SPL-006173","Md. Jahid Kazi","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Senior Mechanic","");
INSERT INTO inv_employee VALUES("2652","SPL-006174","Md. Azizul Islam","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Electrician","");
INSERT INTO inv_employee VALUES("2653","SPL-006175","Md. Kamrul Islam Kamal","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Assistant Supervisor","");
INSERT INTO inv_employee VALUES("2654","SPL-006176","Md. Ifthakar Uddin","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("2655","SPL-006177","Md. Ismail Sk","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("2656","SPL-006178","Md. Ahmadur Rahaman","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2657","SPL-006179","Md. Aslam Hoosain","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2658","SPL-006180","Md. Jakir Shak","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Mechanic","");
INSERT INTO inv_employee VALUES("2659","SPL-006181","Md. Showkat Akbar","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("2660","SPL-006182","Md. Sultan Ahammed","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Vulcanizer","");
INSERT INTO inv_employee VALUES("2661","SPL-006183","Md. Shahjahan Ali","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("2662","SPL-006184","Md. Robiul Islam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("2663","SPL-006185","Mohammed Salim","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Welder","");
INSERT INTO inv_employee VALUES("2664","SPL-006186","Ashish Kumar Das","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Mechanic","");
INSERT INTO inv_employee VALUES("2665","SPL-006187","Shahadat Hossen","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("2666","SPL-006188","Kutub Uddin","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Vulcanizer","");
INSERT INTO inv_employee VALUES("2667","SPL-006189","Mamun Hossen","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Vulcanizer","");
INSERT INTO inv_employee VALUES("2668","SPL-006190","Swajan Paul","Saif Powertec Ltd.","CTED-CTG","Maintenance","Liason Officer","");
INSERT INTO inv_employee VALUES("2669","SPL-006191","Md. Didar Mia","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Assistant Supervisor","");
INSERT INTO inv_employee VALUES("2670","SPL-006192","Md. Jahangir Alam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("2671","SPL-006193","Md. Rashed","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2672","SPL-006194","Md. Sakib Uddin","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("2673","SPL-006195","Md. Mainul Islam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("2674","SPL-006197","Mitun Dey","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2675","SPL-006198","Abdul Mannan Nayam","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("2676","SPL-006200","Naru Safa","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Senior Mechanic","");
INSERT INTO inv_employee VALUES("2677","SPL-006201","Md. Nazim Uddin","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Senior Electrician","");
INSERT INTO inv_employee VALUES("2678","SPL-006202","Md. Sajjad Hossen Saju","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Electrician","");
INSERT INTO inv_employee VALUES("2679","SPL-006203","Ahmod Nobi","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("2680","SPL-006204","Md. Ashraful Islam Chowdhury","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2681","SPL-006205","Md. Nur Uddin","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("2682","SPL-006206","Zahidul Islam","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2683","SPL-006207","Sazzad Hossen Hridoy","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2684","SPL-006208","Tawhidul Islam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("2685","SPL-006209","Mohammad Rakib","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("2686","SPL-006211","Abdul Hakim","Saif Powertec Ltd.","CTED-CTG","Store","Storeman","");
INSERT INTO inv_employee VALUES("2687","SPL-006212","Md. Aminul Islam","Saif Powertec Ltd.","CTED-CTG","Store","Storeman","");
INSERT INTO inv_employee VALUES("2688","SPL-006213","Sahedul Islam","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2689","SPL-006215","Mohammad Rubel","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Lathe Man","");
INSERT INTO inv_employee VALUES("2690","SPL-006217","Mohammed Moin Uddin","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2691","SPL-006218","Md. Imran","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Mechanic","");
INSERT INTO inv_employee VALUES("2692","SPL-006219","Kamrul Hasan","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("2693","SPL-006220","Md. Raju Hossen","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2694","SPL-006221","Md. Hasan","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Mechanic","");
INSERT INTO inv_employee VALUES("2695","SPL-006222","Md. Joynal Abedin","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2696","SPL-006223","Suzauddin Moni","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2697","SPL-006224","Md. Iqbal Hosan","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2698","SPL-006225","Md. Sakib","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2699","SPL-006226","Md. Sohel","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2700","SPL-006227","Md. Ajmir Hossan","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("2701","SPL-006228","Md. Musa Mia","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("2702","SPL-006229","Md. Mahfuj","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("2703","SPL-006230","Imam Uddin","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("2704","SPL-006231","Mohammed Parvej","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("2705","SPL-006232","Biplob Chandra Pal","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("2706","SPL-006233","Moin Uddin","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("2707","SPL-006234","Abu Bakar","Saif Powertec Ltd.","Battery","CMP","Senior Officer","");
INSERT INTO inv_employee VALUES("2708","SPL-006237","Md. Shahidullah","Saif Powertec Ltd.","CTED-CTG","Administration","Peon","");
INSERT INTO inv_employee VALUES("2709","SPL-006238","Babul Chowdhury","Saif Powertec Ltd.","CTED-CTG","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2710","SPL-006239","Orabindu Dey","Saif Powertec Ltd.","CTED-CTG","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2711","SPL-006240","Milon Das","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("2712","SPL-006241","Md. Rana","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("2713","SPL-006242","Mohammed Romzan Ali","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("2714","SPL-006243","Md. Bodiuzzaman Badol","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("2715","SPL-006244","Md. Morshed Hossen Shuvo","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("2716","SPL-006245","Abdur Sattar","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("2717","SPL-006246","Md. Pamrus Reza","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("2718","SPL-006248","Nadeem Nafis","Saif Powertec Ltd.","Battery","Gel And VRLA","Manager","");
INSERT INTO inv_employee VALUES("2719","SPL-006249","Muhammad Zahed Hossain","Saif Powertec Ltd.","SPOT","CTMS","Head of CTMS","");
INSERT INTO inv_employee VALUES("2720","SPL-006250","Mintu","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2721","SPL-006251","Md. Mostafizur Rahman","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2722","SPL-006253","Soyed Mohammad Mostofa Kamal","Saif Powertec Ltd.","Battery","Maintenance","Head Technician","");
INSERT INTO inv_employee VALUES("2723","SPL-006254","Sumon Chandra Das","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2724","SPL-006255","Md. Ramjan Ali","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("2725","SPL-006256","Rakib Hossan","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2726","SPL-006260","Md. Anik Sarker","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2727","SPL-006262","Md. Enayat Ullah","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("2728","SPL-006263","Md. Juwel Mia","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2729","SPL-006264","Md. Shahab Uddin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2730","SPL-006265","Md. Shohag Miah","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2731","SPL-006267","Md. Momen Shakh","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("2732","SPL-006268","Mostakim Hossain","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("2733","SPL-006269","Md. Suzon Mia","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2734","SPL-006271","Md. Abbas Mia","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("2735","SPL-006272","Md. Khairul Alam","Saif Powertec Ltd.","Battery","MC","Officer","");
INSERT INTO inv_employee VALUES("2736","SPL-006273","Md. Robin Mia","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("2737","SPL-006278","Al Amin","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2738","SPL-006279","Dipu Chandra Roy","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2739","SPL-006280","Sagor Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2740","SPL-006282","Mahidul Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2741","SPL-006283","Shree Upaton Roy","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2742","SPL-006284","Md. Sohel Rana","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2743","SPL-006285","Md. Sumon Mia","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2744","SPL-006287","Md. Uzzol Khan","Saif Powertec Ltd.","Battery","Assembly","Senior Technician","");
INSERT INTO inv_employee VALUES("2745","SPL-006288","Md. Mahmudul Islam","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2746","SPL-006289","Dipok Hossin","Saif Powertec Ltd.","Battery","Warehouse And Logistics","Technician","");
INSERT INTO inv_employee VALUES("2747","SPL-006290","Anower Hossain","Saif Powertec Ltd.","Battery","Administration","Technician","");
INSERT INTO inv_employee VALUES("2748","SPL-006291","Md. Rubel Mia","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2749","SPL-006292","Md. Rakibul Hasan Rabin","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2750","SPL-006295","Munna Mollah","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("2751","SPL-006306","Md. Edris Ali","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2752","SPL-006307","Nasima Begum","Saif Powertec Ltd.","Renewable Energy","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("2753","SPL-006308","Sagar","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2754","SPL-006309","Mehedi Hassan Rizvi","Saif Powertec Ltd.","Battery","Sales And Marketing","Area Manager","");
INSERT INTO inv_employee VALUES("2755","SPL-006310","Md. Rayhan","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("2756","SPL-006311","Jewel Roy","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("2757","SPL-006313","Hasan Miah","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("2758","SPL-006314","Md. Samsul Hoque Sohel","Saif Powertec Ltd.","Battery","Sales And Marketing","Area Manager","");
INSERT INTO inv_employee VALUES("2759","SPL-006315","Md. Afaq Rubel","Saif Powertec Ltd.","SPOT","Operation","Officer","");
INSERT INTO inv_employee VALUES("2760","SPL-006316","Md. Akramuzzaman Shaikh","Saif Powertec Ltd.","SPOT","Operation","Officer","");
INSERT INTO inv_employee VALUES("2761","SPL-006318","Mohammad Shahin","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("2762","SPL-006319","Md. Mozammel","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("2763","SPL-006320","Md. Omar Faruq","Saif Powertec Ltd.","SPOT","Operation","Senior Officer","");
INSERT INTO inv_employee VALUES("2764","SPL-006322","Momin Howlader","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("2765","SPL-006323","Pollock Reberio","Saif Powertec Ltd.","Battery","CMP","Officer","");
INSERT INTO inv_employee VALUES("2766","SPL-006324","Md. Abdullah Al Amin","Saif Powertec Ltd.","Battery","Sales And Marketing","Area Manager","");
INSERT INTO inv_employee VALUES("2767","SPL-006325","Kazi Mahadi Hasan","Saif Powertec Ltd.","Battery","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("2768","SPL-006326","Md. Hanif Hossain","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Service Engineer","");
INSERT INTO inv_employee VALUES("2769","SPL-006327","Mahbubur Rahman Khan","Saif Powertec Ltd.","SPOT","CTMS","Deputy Manager","");
INSERT INTO inv_employee VALUES("2770","SPL-006328","Nurul Amin Yousuf","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2771","SPL-006329","Mohasin Kabir","Saif Powertec Ltd.","SPOT","CTMS","Senior Equipment Controller","");
INSERT INTO inv_employee VALUES("2772","SPL-006330","Nabiul Hasan Chowdhury","Saif Powertec Ltd.","SPOT","CTMS","Co-Ordinator","");
INSERT INTO inv_employee VALUES("2773","SPL-006331","Mohammad Sodrul Islam Beg","Saif Powertec Ltd.","SPOT","CTMS","Assistant Equipment Co-Ordinator","");
INSERT INTO inv_employee VALUES("2774","SPL-006332","Golam Sarwar","Saif Powertec Ltd.","SPOT","CTMS","Assistant Equipment Co-Ordinator","");
INSERT INTO inv_employee VALUES("2775","SPL-006333","Md. Kamal Uddin Bhuiyan","Saif Powertec Ltd.","SPOT","Operation","Assistant Equipment Co-Ordinator","");
INSERT INTO inv_employee VALUES("2776","SPL-006334","Md. Razaul Karim","Saif Powertec Ltd.","SPOT","Ship Planning","Deputy Ship Planner","");
INSERT INTO inv_employee VALUES("2777","SPL-006335","Md. Abdulla Al Mujahid","Saif Powertec Ltd.","SPOT","CTMS","Documentation Staff Trainee","");
INSERT INTO inv_employee VALUES("2778","SPL-006336","Md. Safayat  Khan","Saif Powertec Ltd.","SPOT","CTMS","Yard Checker","");
INSERT INTO inv_employee VALUES("2779","SPL-006337","Md. Arafath Hamdad","Saif Powertec Ltd.","SPOT","CTMS","Yard Checker","");
INSERT INTO inv_employee VALUES("2780","SPL-006338","Jatindra Nath Sharma","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("2781","SPL-006339","Md. Anamul Hoque","Saif Powertec Ltd.","SPOT","Documentation","Officer","");
INSERT INTO inv_employee VALUES("2782","SPL-006340","Privel Costa","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2783","SPL-006341","Md.Shafayetur Rahman","Saif Powertec Ltd.","SPOT","CTMS","Assistant Equipment Co-Ordinator","");
INSERT INTO inv_employee VALUES("2784","SPL-006342","Sree Dulal Chandra Dep Sharma","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2785","SPL-006343","Dev Raj Sarker","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2786","SPL-006344","Kamal Farook Jahan","Saif Powertec Ltd.","Business Development","Business Development","Regional Manager","");
INSERT INTO inv_employee VALUES("2787","SPL-006345","Moni Babu","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2788","SPL-006346","Md. Ripon Khandakar","Saif Powertec Ltd.","Battery","CMP","Senior Technician","");
INSERT INTO inv_employee VALUES("2789","SPL-006347","Md. Habibur Rahman","Saif Powertec Ltd.","Battery","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("2790","SPL-006348","Tanveer Muhammad Nafiul Hussain","Saif Powertec Ltd.","SPOT","Terminal Operation","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("2791","SPL-006349","Mosharof Hossain","Saif Powertec Ltd.","SPOT","Terminal Operation","Terminal Manager","");
INSERT INTO inv_employee VALUES("2792","SPL-006350","Md. Maruf Ali Biswas","Saif Powertec Ltd.","SPOT","Terminal Operation","Deputy Manager","");
INSERT INTO inv_employee VALUES("2793","SPL-006351","Monirul Haque","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2794","SPL-006352","Muhammad Ibrahim Rubal","Saif Powertec Ltd.","SPOT","Terminal Operation","Deputy Manager","");
INSERT INTO inv_employee VALUES("2795","SPL-006353","Md. Masud Rana","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2796","SPL-006354","Soliamamn Siddiki","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("2797","SPL-006355","Mohammad Saiful Alam Bhuiya","Saif Powertec Ltd.","SPOT","Terminal Operation","Manager","");
INSERT INTO inv_employee VALUES("2798","SPL-006356","Ratan Chandra Majumder","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2799","SPL-006357","Mohammad Jahed Hossen","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2800","SPL-006358","Monsur Alam","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2801","SPL-006359","Md. Solaiman","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2802","SPL-006360","Md. Monsur Alam","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2803","SPL-006361","Dipankar Chowdhury","Saif Powertec Ltd.","SPOT","Terminal Operation","CFS Shed Incharge","");
INSERT INTO inv_employee VALUES("2804","SPL-006362","Md. Salauddin Kadar","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2805","SPL-006363","Md. Saddam Hossen","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2806","SPL-006364","Ahsan Mahmud","Saif Powertec Ltd.","SPOT","Administration","Executive","");
INSERT INTO inv_employee VALUES("2807","SPL-006365","Nazrul Islam","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2808","SPL-006366","Md. Sahjahan","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2809","SPL-006367","Md. Omar Faruk","Saif Powertec Ltd.","SPOT","Terminal Operation","Officer","");
INSERT INTO inv_employee VALUES("2810","SPL-006368","Md. Jahirul Islam","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2811","SPL-006369","Md. Mohiuddin","Saif Powertec Ltd.","SPOT","Terminal Operation","Officer","");
INSERT INTO inv_employee VALUES("2812","SPL-006370","Md. Belal Uddin","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2813","SPL-006371","Md. Solaman","Saif Powertec Ltd.","SPOT","Terminal Operation","Store Officer","");
INSERT INTO inv_employee VALUES("2814","SPL-006372","Usathoai Marma","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2815","SPL-006373","Md. Jahangir Alam","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2816","SPL-006374","Md. Abu Taiub","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("2817","SPL-006375","Md. Easin Hossain","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2818","SPL-006376","Monir Hossain","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2819","SPL-006377","Md. Aminur Rasul","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("2820","SPL-006378","Md. Mohin Uddin","Saif Powertec Ltd.","SPOT","Mobile Harbour Crane","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2821","SPL-006379","Habib A Rasul Shahin","Saif Powertec Ltd.","SPOT","Mobile Harbour Crane","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2822","SPL-006380","Md. Faruk","Saif Powertec Ltd.","SPOT","Mobile Harbour Crane","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2823","SPL-006381","Md. Harun Miah","Saif Powertec Ltd.","SPOT","RMG","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2824","SPL-006382","Anowar Hossain Gazi","Saif Powertec Ltd.","SPOT","Mobile Harbour Crane","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2825","SPL-006383","Md. Nur Nabi","Saif Powertec Ltd.","SPOT","Mobile Harbour Crane","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2826","SPL-006384","Md. Abul Kasham","Saif Powertec Ltd.","SPOT","Mobile Harbour Crane","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2827","SPL-006385","Md. Salim Uddin","Saif Powertec Ltd.","SPOT","Mobile Harbour Crane","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2828","SPL-006386","Md. Shohel Rana","Saif Powertec Ltd.","SPOT","Mobile Harbour Crane","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2829","SPL-006387","Md. Didar  Alam","Saif Powertec Ltd.","SPOT","RMG","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2830","SPL-006388","Md. Shain Shak","Saif Powertec Ltd.","SPOT","RMG","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2831","SPL-006389","Md. Yeasin","Saif Powertec Ltd.","SPOT","RMG","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2832","SPL-006390","Sheikh Farid Bablu","Saif Powertec Ltd.","SPOT","RMG","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2833","SPL-006391","Md. Shahid","Saif Powertec Ltd.","SPOT","Mobile Harbour Crane","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2834","SPL-006392","Mohammed Kalam","Saif Powertec Ltd.","SPOT","RMG","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2835","SPL-006393","Md. Samsul Alam Babul","Saif Powertec Ltd.","SPOT","RMG","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2836","SPL-006394","Md. Firoz Alam","Saif Powertec Ltd.","SPOT","Mobile Harbour Crane","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2837","SPL-006395","Sree Ratan  Chandra Mojumdar","Saif Powertec Ltd.","SPOT","RMG","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2838","SPL-006396","Md. Sahab Uddin","Saif Powertec Ltd.","SPOT","RMG","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2839","SPL-006397","Md. Rasel","Saif Powertec Ltd.","SPOT","RMG","Mobile Harbor Crane Operator","");
INSERT INTO inv_employee VALUES("2840","SPL-006407","Md. Manjur Alam","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("2841","SPL-006408","Md. Solaiman Hossen","Saif Powertec Ltd.","SPOT","Terminal Operation","Photo copier","");
INSERT INTO inv_employee VALUES("2842","SPL-006409","Mohammad  Arman","Saif Powertec Ltd.","SPOT","Terminal Operation","Office Boy","");
INSERT INTO inv_employee VALUES("2843","SPL-006410","Md. Manju Sarkar","Saif Powertec Ltd.","SPOT","Terminal Operation","Office Boy","");
INSERT INTO inv_employee VALUES("2844","SPL-006411","Idris","Saif Powertec Ltd.","SPOT","Terminal Operation","Office Boy","");
INSERT INTO inv_employee VALUES("2845","SPL-006413","Giash Uddin Ahammed Samim","Saif Powertec Ltd.","SPOT","CCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("2846","SPL-006414","Md. Sala Uddin Sakib","Saif Powertec Ltd.","SPOT","Terminal Operation","Assistant Welfare Officer","");
INSERT INTO inv_employee VALUES("2847","SPL-006415","Helal Uddin","Saif Powertec Ltd.","SPOT","Terminal Operation","Radio And HHT Keeper","");
INSERT INTO inv_employee VALUES("2848","SPL-006416","Norul Kabir","Saif Powertec Ltd.","SPOT","CTMS","Photo copier","");
INSERT INTO inv_employee VALUES("2849","SPL-006417","Md. Jonaid","Saif Powertec Ltd.","SPOT","Terminal Operation","Documentation Staff","");
INSERT INTO inv_employee VALUES("2850","SPL-006418","Parag Dey","Saif Powertec Ltd.","SPOT","Strategic Planning And Terminal Operation","Trainee Officer","");
INSERT INTO inv_employee VALUES("2851","SPL-006419","Tuhin Ahmed","Saif Powertec Ltd.","SPOT","CTMS","Trainee Officer","");
INSERT INTO inv_employee VALUES("2852","SPL-006420","Kiron Das","Saif Powertec Ltd.","SPOT","Terminal Operation","Trainee Officer","");
INSERT INTO inv_employee VALUES("2853","SPL-006422","Rajib Barman","Saif Powertec Ltd.","SPOT","Terminal Operation","Trainee Officer","");
INSERT INTO inv_employee VALUES("2854","SPL-006423","Md. Rayhanul Kabir","Saif Powertec Ltd.","SPOT","Terminal Operation","Trainee Officer","");
INSERT INTO inv_employee VALUES("2855","SPL-006424","Md. Faruk Hosen","Saif Powertec Ltd.","SPOT","CCT Yard","RTG Checker","");
INSERT INTO inv_employee VALUES("2856","SPL-006425","Rakibul Hassan Chowdhury","Saif Powertec Ltd.","SPOT","Strategic Planning And Terminal Operation","Officer","");
INSERT INTO inv_employee VALUES("2857","SPL-006426","Md Rashedu Rahat","Saif Powertec Ltd.","SPOT","Operation","Deputy Manager","");
INSERT INTO inv_employee VALUES("2858","SPL-006428","Md. Faruk","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("2859","SPL-006429","Mohammed Younus","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("2860","SPL-006431","Mazba Uddin","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("2861","SPL-006432","Ripan Ahmed","Saif Powertec Ltd.","SPOT","CCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("2862","SPL-006433","Sawpan Deba  Nath","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("2863","SPL-006434","Md. Jahed Hossain","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("2864","SPL-006435","Md Nura Alam","Saif Powertec Ltd.","SPOT","Ship Planning","Keep Down Checker","");
INSERT INTO inv_employee VALUES("2865","SPL-006436","Md. Rafiqul Islam","Saif Powertec Ltd.","SPOT","CFS","Supervisor","");
INSERT INTO inv_employee VALUES("2866","SPL-006437","Khalekuzaman","Saif Powertec Ltd.","SPOT","CFS","Assistant Supervisor","");
INSERT INTO inv_employee VALUES("2867","SPL-006438","Md. Wahidur Rahman","Saif Powertec Ltd.","SPOT","CFS","Handover Clerk","");
INSERT INTO inv_employee VALUES("2868","SPL-006439","Mohammed Aslam","Saif Powertec Ltd.","SPOT","CFS","Handover Clerk","");
INSERT INTO inv_employee VALUES("2869","SPL-006440","A K M Hamidul Hoque","Saif Powertec Ltd.","SPOT","CFS","Handover Clerk","");
INSERT INTO inv_employee VALUES("2870","SPL-006441","Md. Faruk","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2871","SPL-006442","Mohammad Monjur Alam","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2872","SPL-006443","Md. Amir Hossain","Saif Powertec Ltd.","SPOT","CFS","Assistant Supervisor","");
INSERT INTO inv_employee VALUES("2873","SPL-006444","Md. Mostafa Kamal","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2874","SPL-006445","Md. Amdad Hossain","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2875","SPL-006446","Md. Nur Uddin Jahid","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2876","SPL-006447","Md. Shekh Farid","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2877","SPL-006448","Md. Omar Faruq","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2878","SPL-006449","Md. Anisul Hoque","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2879","SPL-006450","Ali Hossain Chowdhury","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2880","SPL-006451","Pabon Mazumder","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2881","SPL-006452","Md. Abu Taher","Saif Powertec Ltd.","SPOT","CCT Yard","ICD Checker","");
INSERT INTO inv_employee VALUES("2882","SPL-006453","Md. Abu Taher","Saif Powertec Ltd.","SPOT","CCT Yard","ICD Checker","");
INSERT INTO inv_employee VALUES("2883","SPL-006454","Md. Harunur Rashid","Saif Powertec Ltd.","SPOT","CCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("2884","SPL-006455","Mohammad Salauddin","Saif Powertec Ltd.","SPOT","CCT Yard","Keep Down Checker","");
INSERT INTO inv_employee VALUES("2885","SPL-006456","Akramul Hoque","Saif Powertec Ltd.","SPOT","CCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("2886","SPL-006457","Md. Nurul Alam","Saif Powertec Ltd.","SPOT","CFS","Carpenter","");
INSERT INTO inv_employee VALUES("2887","SPL-006458","Md. Hossain","Saif Powertec Ltd.","SPOT","CFS","Carpenter","");
INSERT INTO inv_employee VALUES("2888","SPL-006459","Md. Sayed Ahmeed","Saif Powertec Ltd.","SPOT","CFS","Jetty Sareng","");
INSERT INTO inv_employee VALUES("2889","SPL-006460","Md. Nuru Uddin","Saif Powertec Ltd.","SPOT","CFS","Mark Man","");
INSERT INTO inv_employee VALUES("2890","SPL-006461","Md. Sah Jahan","Saif Powertec Ltd.","SPOT","CFS","Mark Man","");
INSERT INTO inv_employee VALUES("2891","SPL-006462","Md. Amdadul Haque Khokon","Saif Powertec Ltd.","SPOT","NCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("2892","SPL-006463","Md. Mafizur Rahaman","Saif Powertec Ltd.","SPOT","CFS","Mark Man","");
INSERT INTO inv_employee VALUES("2893","SPL-006464","Sheikh Ahamed","Saif Powertec Ltd.","SPOT","CFS","Mark Man","");
INSERT INTO inv_employee VALUES("2894","SPL-006465","Abdul Aziz","Saif Powertec Ltd.","SPOT","CFS","Mark Man","");
INSERT INTO inv_employee VALUES("2895","SPL-006466","Md. Mosarraf Hossain","Saif Powertec Ltd.","SPOT","CFS","Office Boy","");
INSERT INTO inv_employee VALUES("2896","SPL-006467","Md. Ibrahim","Saif Powertec Ltd.","SPOT","CFS","Supervisor","");
INSERT INTO inv_employee VALUES("2897","SPL-006468","Md. Tipu","Saif Powertec Ltd.","SPOT","CFS","Mark Man","");
INSERT INTO inv_employee VALUES("2898","SPL-006469","Mohammad Jahidul Islam","Saif Powertec Ltd.","SPOT","CFS","Tally Clerk","");
INSERT INTO inv_employee VALUES("2899","SPL-006470","Md Sana Ullah","Saif Powertec Ltd.","SPOT","CCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("2900","SPL-006471","Md. Moynul  Islam","Saif Powertec Ltd.","SPOT","NCT Yard","Keep Down Checker","");
INSERT INTO inv_employee VALUES("2901","SPL-006472","Hajio Amin Akter","Saif Powertec Ltd.","SPOT","NCT Yard","RTG Checker","");
INSERT INTO inv_employee VALUES("2902","SPL-006473","Md. Salim Miah","Saif Powertec Ltd.","SPOT","CCT Yard","Keep Down Checker","");
INSERT INTO inv_employee VALUES("2903","SPL-006474","A.H.M. Abdul Kader","Saif Powertec Ltd.","SPOT","CCT Yard","RTG Checker","");
INSERT INTO inv_employee VALUES("2904","SPL-006475","Uzzal Biswas","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("2905","SPL-006476","Tarak Mohammad Sujan Chowduray","Saif Powertec Ltd.","SPOT","Ship Planning","Assistant Manager","");
INSERT INTO inv_employee VALUES("2906","SPL-006477","Susanta Chakma","Saif Powertec Ltd.","SPOT","Ship Planning","Assistant Ship Planner","");
INSERT INTO inv_employee VALUES("2907","SPL-006478","Md. Mohiuddin","Saif Powertec Ltd.","SPOT","Ship Planning","Ship And Yard Planner","");
INSERT INTO inv_employee VALUES("2908","SPL-006479","Md. Delowar Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2909","SPL-006480","Abdul Basher","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2910","SPL-006481","Nur Ahmed","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2911","SPL-006482","Md. Abu Taher","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2912","SPL-006483","Sujun Chowdhury","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2913","SPL-006484","Md. Abdul Salam","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2914","SPL-006485","Abu Taleb Chy","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2915","SPL-006486","Md. Mahmudur Rahman","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2916","SPL-006487","Nurul Afser","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2917","SPL-006488","Md. Ahidul Alam","Saif Powertec Ltd.","SPOT","NCT Yard","RTG Checker","");
INSERT INTO inv_employee VALUES("2918","SPL-006489","Aga Emdadul Hoque Chowdhury","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2919","SPL-006490","Md. Farhad Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2920","SPL-006491","Jubayer Md. Subuj","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("2921","SPL-006492","Md. Salah Uddin","Saif Powertec Ltd.","SPOT","Ship Planning","Senior Tracer","");
INSERT INTO inv_employee VALUES("2922","SPL-006493","Md. Mashiur Rahman","Saif Powertec Ltd.","SPOT","Ship Planning","RTG Checker","");
INSERT INTO inv_employee VALUES("2923","SPL-006494","Md. Amanat Ullah","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("2924","SPL-006495","Prakas Das","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("2925","SPL-006496","Suman Talukdar","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("2926","SPL-006497","Swapan Mazumder","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("2927","SPL-006498","Krishna Dey","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("2928","SPL-006499","Md. Nahidul Islam","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("2929","SPL-006500","Md. Emroul Qush","Saif Powertec Ltd.","SPOT","Ship Planning","RTG Checker","");
INSERT INTO inv_employee VALUES("2930","SPL-006501","Md. Babaul Haoladar","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("2931","SPL-006502","Md. Solaiman","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("2932","SPL-006503","Md. Faruk Azam","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("2933","SPL-006504","Abbas Uddin","Saif Powertec Ltd.","SPOT","CCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("2934","SPL-006505","Md. Jahangir Hossain","Saif Powertec Ltd.","SPOT","CCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("2935","SPL-006506","Md. Anis Ullah","Saif Powertec Ltd.","SPOT","CTMS","Radio And HHT Keeper","");
INSERT INTO inv_employee VALUES("2936","SPL-006507","Azim Uddin","Saif Powertec Ltd.","SPOT","CTMS","Radio And HHT Keeper","");
INSERT INTO inv_employee VALUES("2937","SPL-006509","Md. Aminur Rahman Sunny","Saif Powertec Ltd.","SPOT","CCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("2938","SPL-006510","Md. Ibrahim Khalil Sabuz","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("2939","SPL-006511","Manir Ahammad","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("2940","SPL-006512","Md. Alam Miah","Saif Powertec Ltd.","SPOT","Ship Planning","Senior Assistant Ship Supervisor","");
INSERT INTO inv_employee VALUES("2941","SPL-006513","Mohammad Elias","Saif Powertec Ltd.","SPOT","Ship Planning","Assistant Ship Supervisor","");
INSERT INTO inv_employee VALUES("2942","SPL-006514","Kazi Shakawat Alam","Saif Powertec Ltd.","SPOT","Ship Planning","Deputy Ship Planner","");
INSERT INTO inv_employee VALUES("2943","SPL-006515","Kazi Shaed Ullah","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2944","SPL-006516","Md. Gias Uddin","Saif Powertec Ltd.","SPOT","Ship Planning","Assistant Ship Supervisor","");
INSERT INTO inv_employee VALUES("2945","SPL-006517","Md. Nurul Islam","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2946","SPL-006518","Muhammad Abul Mansur","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2947","SPL-006519","A.K.M.Mahmudul Haque Tipu","Saif Powertec Ltd.","SPOT","Ship Planning","Assistant Ship Supervisor","");
INSERT INTO inv_employee VALUES("2948","SPL-006520","Mohammad Towhidul Islam","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2949","SPL-006521","Md Jainal Abedin","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2950","SPL-006522","Md. Iqbal Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Assistant Ship Supervisor","");
INSERT INTO inv_employee VALUES("2951","SPL-006523","Fazlul Halim Chowdhury","Saif Powertec Ltd.","SPOT","CCT Yard","Tracer","");
INSERT INTO inv_employee VALUES("2952","SPL-006524","Md. Amzul Hoque","Saif Powertec Ltd.","SPOT","Ship Planning","Senior Assistant Ship Supervisor","");
INSERT INTO inv_employee VALUES("2953","SPL-006525","Bipul Kanti Barua","Saif Powertec Ltd.","SPOT","Ship Planning","Assistant Ship Supervisor","");
INSERT INTO inv_employee VALUES("2954","SPL-006526","Shariful Islam","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2955","SPL-006527","Mohammed Anisuzzaman","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2956","SPL-006528","Mohammd Zakaria","Saif Powertec Ltd.","SPOT","CCT Yard","Keep Down Checker","");
INSERT INTO inv_employee VALUES("2957","SPL-006529","Md. Tofajjal Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Assistant Ship Supervisor","");
INSERT INTO inv_employee VALUES("2958","SPL-006530","Sumon Sen Gupta","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("2959","SPL-006531","Md. Abdur Rahim","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2960","SPL-006532","Mohammed Mostafizur Rahaman","Saif Powertec Ltd.","SPOT","Administration","Admin Assistant","");
INSERT INTO inv_employee VALUES("2961","SPL-006533","Md. Jashed","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2962","SPL-006534","Md. Rasel","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2963","SPL-006535","Md. Shakhawat Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2964","SPL-006536","Paritosh Majumder","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2965","SPL-006537","Md. Baktiar Uddin","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2966","SPL-006538","Md. Fakru Doula Chowdhury","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2967","SPL-006539","Shamsur Rahman","Saif Powertec Ltd.","SPOT","NCT Yard","Supervisor","");
INSERT INTO inv_employee VALUES("2968","SPL-006540","Md. Shahin Miah","Saif Powertec Ltd.","SPOT","Ship Planning","Checker","");
INSERT INTO inv_employee VALUES("2969","SPL-006541","Md. Siddik","Saif Powertec Ltd.","SPOT","Ship Planning","RTG Checker","");
INSERT INTO inv_employee VALUES("2970","SPL-006542","Md. Sahabuddin","Saif Powertec Ltd.","SPOT","Ship Planning","Keep Down Checker","");
INSERT INTO inv_employee VALUES("2971","SPL-006543","Suman Chandra Paul","Saif Powertec Ltd.","SPOT","Ship Planning","Assistant Ship Supervisor","");
INSERT INTO inv_employee VALUES("2972","SPL-006544","Muhammad Gias Uddin","Saif Powertec Ltd.","SPOT","Ship Planning","RTG Checker","");
INSERT INTO inv_employee VALUES("2973","SPL-006545","Sk Rasel Ahmed","Saif Powertec Ltd.","SPOT","Ship Planning","Checker","");
INSERT INTO inv_employee VALUES("2974","SPL-006547","Md. Zahangir","Saif Powertec Ltd.","SPOT","NCT Yard","Supervisor","");
INSERT INTO inv_employee VALUES("2975","SPL-006548","Md. Rokibul Hasan","Saif Powertec Ltd.","SPOT","Ship Planning","Keep Down Checker","");
INSERT INTO inv_employee VALUES("2976","SPL-006549","Md. Zia Uddin","Saif Powertec Ltd.","SPOT","NCT Yard","Empty Area Checker","");
INSERT INTO inv_employee VALUES("2977","SPL-006550","Md. Abdul Mannan","Saif Powertec Ltd.","SPOT","NCT Yard","Keep Down Checker","");
INSERT INTO inv_employee VALUES("2978","SPL-006551","Sheikh Md Zahidul Amin","Saif Powertec Ltd.","SPOT","NCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("2979","SPL-006552","Md. Jashim Uddin","Saif Powertec Ltd.","SPOT","NCT Yard","RTG Checker","");
INSERT INTO inv_employee VALUES("2980","SPL-006553","Sumon Darjee","Saif Powertec Ltd.","SPOT","Ship Planning","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("2981","SPL-006554","Md. Musa","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Tracer","");
INSERT INTO inv_employee VALUES("2982","SPL-006555","Sabuz Mazumder","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("2983","SPL-006556","Md. Elias","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("2984","SPL-006557","Shibu Prasade Day","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("2985","SPL-006558","Md. Mezbaul Shakil","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("2986","SPL-006559","Didarul Alam Joni","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Tracer","");
INSERT INTO inv_employee VALUES("2987","SPL-006560","S.M Shah Nawaz","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("2988","SPL-006561","Deloar Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Senior Tracer","");
INSERT INTO inv_employee VALUES("2989","SPL-006562","Kaisarul Islam","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("2990","SPL-006563","Md. Zahid Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Tracer","");
INSERT INTO inv_employee VALUES("2991","SPL-006564","Md. Faroque Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Tracer","");
INSERT INTO inv_employee VALUES("2992","SPL-006565","Mohammad Arshed","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("2993","SPL-006566","Bepan Kanti Das","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("2994","SPL-006567","Md. Shahidullah Mijan","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("2995","SPL-006568","Md. Khorshed Alam","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("2996","SPL-006569","Ripon Paul","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("2997","SPL-006570","Md. Abu Sadak Sojib","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("2998","SPL-006571","Aman Ullah","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("2999","SPL-006572","Abdullah Al Mamun","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3000","SPL-006573","Mohammad Moinuddin","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Tracer","");
INSERT INTO inv_employee VALUES("3001","SPL-006574","Yasir Arafat","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3002","SPL-006575","Md. Rabiul Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3003","SPL-006576","Md. Ismail","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3004","SPL-006577","Kamal Ahmad","Saif Powertec Ltd.","SPOT","NCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("3005","SPL-006578","Shafiul Azam Chowduary","Saif Powertec Ltd.","SPOT","NCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("3006","SPL-006579","Abdul Mannan","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3007","SPL-006580","Md. Ekhtiar Uddin Chowdhury","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Documentation Staff Trainee","");
INSERT INTO inv_employee VALUES("3008","SPL-006581","Md. Yashin","Saif Powertec Ltd.","SPOT","Ship Planning","Keep Down Checker","");
INSERT INTO inv_employee VALUES("3009","SPL-006582","Shaikh Nazrul Islam","Saif Powertec Ltd.","SPOT","Ship Planning","Checker","");
INSERT INTO inv_employee VALUES("3010","SPL-006583","Md. Rahel","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3011","SPL-006584","Md. Anwar Hossain","Saif Powertec Ltd.","SPOT","NCT Yard","Empty Area Checker","");
INSERT INTO inv_employee VALUES("3012","SPL-006585","Md. Sayed Nur","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3013","SPL-006586","Md. Jamal","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3014","SPL-006587","Md. Didarul Alam Arju","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3015","SPL-006588","Mohammad Elias Azam","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3016","SPL-006589","Md. Saiful Alam","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3017","SPL-006590","Md. Salim","Saif Powertec Ltd.","SPOT","NCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("3018","SPL-006591","Akramul Hoque Rubel","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3019","SPL-006592","Muhammad Abdur Rahim Chowdhury","Saif Powertec Ltd.","SPOT","NCT Yard","RTG Checker","");
INSERT INTO inv_employee VALUES("3020","SPL-006593","Isme Azam Rubel","Saif Powertec Ltd.","SPOT","NCT Yard","Deck And Crane Checker","");
INSERT INTO inv_employee VALUES("3021","SPL-006594","Abu Bakker","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3022","SPL-006595","Sheikh Md Titumir Akter","Saif Powertec Ltd.","SPOT","CTMS","Yard Checker","");
INSERT INTO inv_employee VALUES("3023","SPL-006596","Md. Ashraf Uddin","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3024","SPL-006597","Md. Emran Ahaead","Saif Powertec Ltd.","SPOT","CTMS","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3025","SPL-006598","S.M.Ifteker Pavel","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3026","SPL-006599","Mohammad Osman Gani","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3027","SPL-006600","Md. Shah Jalal Sumon","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3028","SPL-006601","Liton Mia","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3029","SPL-006602","Md. Kaisar Hamid","Saif Powertec Ltd.","SPOT","NCT Yard","Supervisor","");
INSERT INTO inv_employee VALUES("3030","SPL-006603","Md.Faisal","Saif Powertec Ltd.","SPOT","NCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("3031","SPL-006604","Md. Mojaher Sikder","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("3032","SPL-006605","Md. Eiran","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("3033","SPL-006606","Md. Elias","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("3034","SPL-006607","Md. Shahidul Islam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher Foreman","");
INSERT INTO inv_employee VALUES("3035","SPL-006608","Md. Halal Uddin Bhuiyan","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher Foreman","");
INSERT INTO inv_employee VALUES("3036","SPL-006609","Shohel Barua","Saif Powertec Ltd.","SPOT","CCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("3037","SPL-006610","Md. Abdul Mannan","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher Foreman","");
INSERT INTO inv_employee VALUES("3038","SPL-006611","Md. Abdul Rashid","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher Foreman","");
INSERT INTO inv_employee VALUES("3039","SPL-006612","Abdul Goni","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3040","SPL-006613","Abdur Shukkur","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3041","SPL-006614","Md. Humyun Bhuiyan","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("3042","SPL-006615","Md. Manir Uddin","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3043","SPL-006616","Md. Bazlur Rahaman","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3044","SPL-006617","Md Obydul Hoque","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3045","SPL-006618","Manir Ahamed","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3046","SPL-006619","Md. Abul Kashem","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3047","SPL-006620","Abu Toyab","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("3048","SPL-006621","Noor Mohammed","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3049","SPL-006622","Md. Humayun Kabir","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3050","SPL-006623","Hasan Ahmad","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3051","SPL-006624","Md. Sekander","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3052","SPL-006625","Nurul Alam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3053","SPL-006626","Md. Ibrahim","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3054","SPL-006627","Mohammed Mafizul Alam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3055","SPL-006628","Md. Abdud Duyan","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("3056","SPL-006629","Md. Mubinul Hoque","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3057","SPL-006630","Mohammad Anwar","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3058","SPL-006631","Abdul Manna","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3059","SPL-006632","Md. Mahfuzur Rahaman","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("3060","SPL-006633","Mohammad Mizanur Rahman","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","RTG SC Controller","");
INSERT INTO inv_employee VALUES("3061","SPL-006634","Md. Belal Hossain","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("3062","SPL-006635","Mohammed Samsuddin","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3063","SPL-006636","Abdullah Al-Momen","Saif Powertec Ltd.","SPOT","CCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("3064","SPL-006637","Mohammed Faruq","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3065","SPL-006638","Md. Shahedul Alam","Saif Powertec Ltd.","SPOT","NCT Yard","RTG SC Controller","");
INSERT INTO inv_employee VALUES("3066","SPL-006639","Md. Aminul Islam","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("3067","SPL-006640","Jaynal Abedin Rony","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("3068","SPL-006641","Sany Dutta","Saif Powertec Ltd.","SPOT","Ship Planning","Checker","");
INSERT INTO inv_employee VALUES("3069","SPL-006642","Liton Das","Saif Powertec Ltd.","SPOT","NCT Yard","Checker","");
INSERT INTO inv_employee VALUES("3070","SPL-006643","Md. Farid Nijami","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("3071","SPL-006644","Rajib Chakraborty","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("3072","SPL-006645","Md. Monjur Alam","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("3073","SPL-006646","Abdur Rashid","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("3074","SPL-006647","Md. Jasim","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("3075","SPL-006648","Sobrota Barua","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("3076","SPL-006649","Md. Alamgir","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3077","SPL-006650","Md. Zafarullah","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3078","SPL-006651","Md. Sekandor","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3079","SPL-006652","Md. Foysal","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3080","SPL-006653","Md. Akter Hossain","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3081","SPL-006654","Maimun Uddin Chy","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3082","SPL-006655","Md. Lokman","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3083","SPL-006656","Md. Alim Ullah","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3084","SPL-006657","Md. Ibrahim Khalil","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3085","SPL-006658","Md. Zahidur Rahman Zaker","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3086","SPL-006659","Md. Auiub Alam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3087","SPL-006660","Md. Mahbubul Alam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3088","SPL-006661","Md. Kausar","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3089","SPL-006662","Mohammod Arman","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3090","SPL-006663","Rifat Sultana","Saif Powertec Ltd.","Corporate","Administration","Front Desk Officer","");
INSERT INTO inv_employee VALUES("3091","SPL-006664","Farukh Ahmed Khan","Saif Powertec Ltd.","Corporate","Administration","Executive Director","");
INSERT INTO inv_employee VALUES("3092","SPL-006665","Laboni Yesmin","Saif Powertec Ltd.","Corporate","Administration","Front Desk Officer","");
INSERT INTO inv_employee VALUES("3093","SPL-006666","Azmi Akter","Saif Powertec Ltd.","Corporate","Administration","Front Desk Officer","");
INSERT INTO inv_employee VALUES("3094","SPL-006667","Ashiqur Rahman Ratul","Saif Powertec Ltd.","Battery","Commercial","Assistant Manager","");
INSERT INTO inv_employee VALUES("3095","SPL-006668","Tanzila Islam Lima","Saif Powertec Ltd.","Corporate","Legal","Executive","");
INSERT INTO inv_employee VALUES("3096","SPL-006669","Md. Ataur Rahman","Saif Powertec Ltd.","Battery","Service And WSS","Officer","");
INSERT INTO inv_employee VALUES("3097","SPL-006671","Morzina Akter Shiuly","Saif Powertec Ltd.","Corporate","Administration","Front Desk Officer","");
INSERT INTO inv_employee VALUES("3098","SPL-006672","Mst. Shila Akter Boby","Saif Powertec Ltd.","Corporate","Administration","Front Desk Officer","");
INSERT INTO inv_employee VALUES("3099","SPL-006673","Monjurul Alam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3100","SPL-006674","Nejam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3101","SPL-006675","Md. Sahabuddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3102","SPL-006676","Md. Abdul Mannan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3103","SPL-006677","Md. Alamgir","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3104","SPL-006678","Md. Azam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3105","SPL-006679","Md. Kamal Shekh","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3106","SPL-006680","Arifur Rahaman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3107","SPL-006681","Muhammad Saiful Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3108","SPL-006682","Bosir","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3109","SPL-006683","Ahamad Rashid","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3110","SPL-006684","Md. Abdul Motaleb","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3111","SPL-006686","Sahaudul Alam Bhuiyan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3112","SPL-006687","Nur Nobi","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3113","SPL-006688","Alamgir Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3114","SPL-006689","Md. Aktaruzzaman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3115","SPL-006690","Md. Ikram Ullah Sujan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3116","SPL-006691","Firoz Ahmmad","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3117","SPL-006692","Kamrul Hasan Manik","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3118","SPL-006693","Md. Saifu Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3119","SPL-006694","Md. Salim","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3120","SPL-006695","Muksud Ahammad","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3121","SPL-006696","Md. Munna Rubel","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3122","SPL-006697","Abdur Rahman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3123","SPL-006698","Abdur Rahim","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3124","SPL-006699","Md. Saiful Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3125","SPL-006700","Suronjan Kumar Das","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3126","SPL-006701","Md. Yousuf Talukhdar","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3127","SPL-006702","Nur Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3128","SPL-006703","Md. Omar Faruk","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3129","SPL-006704","Md. Juyel","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3130","SPL-006705","Md. Dalour Hossen","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3131","SPL-006706","Md. Monir Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3132","SPL-006707","Jewel Meah","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3133","SPL-006709","Md. Kuwshar","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3134","SPL-006710","Md. Shapon","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3135","SPL-006712","Md. Saraj Meah","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3136","SPL-006713","Bablu Barua","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3137","SPL-006714","Md. Ripon Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3138","SPL-006715","Md. Belal Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3139","SPL-006716","Mohammed Emon","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3140","SPL-006717","Sumon Chandra Mozumder","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3141","SPL-006718","Md Goljar Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3142","SPL-006719","Eashak","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3143","SPL-006720","Sojol Chandra","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3144","SPL-006721","Saiful Hasan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3145","SPL-006722","Md. Azad","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3146","SPL-006723","Md. Abdul Kader","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3147","SPL-006724","Abul Hashem Rayhan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3148","SPL-006725","Nuruzzaman Hridoy","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3149","SPL-006726","Md. Shak Kawsar Sami","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3150","SPL-006727","Mamunor Rashid","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3151","SPL-006729","Abdul Wahed","Saif Powertec Ltd.","Corporate","Human Resource Management","Manager","");
INSERT INTO inv_employee VALUES("3152","SPL-006730","Md. Nurul Alam","Saif Powertec Ltd.","SPOT","Terminal Operation","Technician","");
INSERT INTO inv_employee VALUES("3153","SPL-006731","Nandan Das","Saif Powertec Ltd.","SPOT","ITV","ITV Supervisor","");
INSERT INTO inv_employee VALUES("3154","SPL-006732","Md. Lokman","Saif Powertec Ltd.","SPOT","ITV","ITV Supervisor","");
INSERT INTO inv_employee VALUES("3155","SPL-006733","Ali Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Supervisor","");
INSERT INTO inv_employee VALUES("3156","SPL-006734","Md. Arshad Ali","Saif Powertec Ltd.","SPOT","ITV","ITV Supervisor","");
INSERT INTO inv_employee VALUES("3157","SPL-006735","Md. Siraj Mia","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3158","SPL-006736","Md. Anower Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3159","SPL-006737","Mohammed Mubin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3160","SPL-006738","Md. Maunudden","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3161","SPL-006739","Md. Ahsfak Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3162","SPL-006740","Romen Barua","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3163","SPL-006741","Minaz Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3164","SPL-006742","Mostafa Kamal","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3165","SPL-006743","Md. Ali Azam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3166","SPL-006744","Shahidul Islam Sohel","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3167","SPL-006745","Akhlasur Rahman Gulap","Saif Powertec Ltd.","SPOT","Operation","Lasher","");
INSERT INTO inv_employee VALUES("3168","SPL-006746","Mohammad Ali Bhuiyan","Saif Powertec Ltd.","SPOT","Operation","Lasher","");
INSERT INTO inv_employee VALUES("3169","SPL-006747","Kamrul Hasan","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("3170","SPL-006748","Md. Al Mamun Islam","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3171","SPL-006749","Juwel Barua Ashim","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3172","SPL-006750","Mohammad Mosharof Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3173","SPL-006751","Md. Jahangir Hossen","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3174","SPL-006752","Md. Shahadat Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3175","SPL-006753","Ali Hossen","Saif Powertec Ltd.","SPOT","ITV","FLT Operator","");
INSERT INTO inv_employee VALUES("3176","SPL-006754","Mohammad Abdul Kader","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3177","SPL-006755","Md. Shiraj Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3178","SPL-006756","Sohidul Islam Noman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3179","SPL-006757","Nuruzzaman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3180","SPL-006758","Mohammad Selim","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3181","SPL-006759","Md. Nur Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3182","SPL-006760","Md. Ismyel Hossain Suman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3183","SPL-006761","Md. Iaseen","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3184","SPL-006762","Md Jasim Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3185","SPL-006763","Md. Nasir Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3186","SPL-006764","Md. Khokon Sheikh","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3187","SPL-006765","Md. Hasan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3188","SPL-006766","Raju Ahmed","Saif Powertec Ltd.","SPOT","ITV","FLT Operator","");
INSERT INTO inv_employee VALUES("3189","SPL-006767","Md. Golam Rasul","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3190","SPL-006768","Mohammed Didarul Alam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3191","SPL-006769","Md. Najmul Haque","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3192","SPL-006770","Md. Nozroul Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3193","SPL-006771","Md. Solim Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3194","SPL-006772","Mohammad Taz Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3195","SPL-006773","Md. Jamal Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3196","SPL-006774","Md. Emdad Hossen","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3197","SPL-006775","Md. Mojibul Hoque","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3198","SPL-006777","Md. Rafique","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3199","SPL-006779","Md. Sifuddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3200","SPL-006780","Anwar Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3201","SPL-006781","Abdul Hamid","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3202","SPL-006782","Md. Alamgir","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3203","SPL-006783","Md. Didarul Alam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3204","SPL-006784","Md. Imran Hosen","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3205","SPL-006785","Md. Abu Shayed","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3206","SPL-006786","Hossen Md. Dedarul Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3207","SPL-006787","Rubel Das","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3208","SPL-006788","Md. Abdul Kader","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3209","SPL-006789","Md. Ali Sheikh","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3210","SPL-006790","Md. Sazzad","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3211","SPL-006791","Hasan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3212","SPL-006792","Md. Salah Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3213","SPL-006793","Mukter Ahmad","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3214","SPL-006794","Md. Mijanur Rhaman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3215","SPL-006795","Sree Satta Chandra Devnath","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3216","SPL-006796","Md. Mizanur Rahman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3217","SPL-006797","Nur Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3218","SPL-006798","Mafus Molla","Saif Powertec Ltd.","SPOT","Operation","Lasher","");
INSERT INTO inv_employee VALUES("3219","SPL-006799","Md. Kamal Hossen Hawlder","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3220","SPL-006801","Mokarram Bhuiyan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3221","SPL-006802","Nadim","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3222","SPL-006805","Md. Shah Alom Miah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3223","SPL-006806","Ferdaus Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3224","SPL-006809","Shyamuel Sarkar Pinku","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3225","SPL-006810","Md. Abdul Aziz","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3226","SPL-006811","Md. Juwel Miah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3227","SPL-006812","Mohammad Omar Faruque","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3228","SPL-006813","Md. Harunur Rasid","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3229","SPL-006814","Md. Gias Uddin Razib","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3230","SPL-006815","Md. Jahir Uddin Liton","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3231","SPL-006816","Md . Hafigul Hawldar","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3232","SPL-006817","Md. Jahidul Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3233","SPL-006818","Md. Rashed","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3234","SPL-006819","Kamal Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3235","SPL-006820","Md. Yousuf Hossen","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3236","SPL-006821","Md. Rifan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3237","SPL-006822","Md. Meah Khan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3238","SPL-006824","Md. Ikram","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3239","SPL-006825","Mosharaf Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3240","SPL-006828","Md. Nurul Afsar","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3241","SPL-006829","Md. Sahabuddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3242","SPL-006830","Md. Saiful Islam Emon","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3243","SPL-006831","Gazi Abul Manjur Mashud","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3244","SPL-006832","Md. Sawkat Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3245","SPL-006833","Mohammad Eleas","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3246","SPL-006834","Md. Ataur Rahman Riyed","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3247","SPL-006835","Md. Osman Goni","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3248","SPL-006836","Kamal Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3249","SPL-006837","Md. Saiful Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3250","SPL-006838","Md. Zahed","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3251","SPL-006839","Md. Achiur Rahman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3252","SPL-006840","Md. Sumon","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3253","SPL-006841","Md. Siful Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3254","SPL-006842","Md. Touhidul Alam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3255","SPL-006843","Md. Sahedul Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3256","SPL-006844","Shuvankar Majuder","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3257","SPL-006847","Md. Ali Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3258","SPL-006848","Rashel Ahmed","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3259","SPL-006850","Nurul Afsar","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3260","SPL-006851","Md. Forkan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3261","SPL-006852","Morshed Alam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3262","SPL-006853","Osman Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3263","SPL-006854","Mohammad Shamim","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3264","SPL-006855","Md. Alamgir","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3265","SPL-006856","Md. Didarul Alam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3266","SPL-006857","Md. Nur Achlam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3267","SPL-006858","Mohammad Kamruzzaman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3268","SPL-006859","Md. Jasim Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3269","SPL-006860","Md. Ali Akbar","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3270","SPL-006861","Abul Hassan","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3271","SPL-006862","Md. Abdul Nabi","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3272","SPL-006863","Md Alam Hossain","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3273","SPL-006864","Mohd Aminul Haque","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3274","SPL-006865","Md. Altaf Hossain","Saif Powertec Ltd.","SPOT","QGC and RTG","Training Instructor","");
INSERT INTO inv_employee VALUES("3275","SPL-006866","Md. Shahjahan","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3276","SPL-006867","Humayun Kabir","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3277","SPL-006868","Md Akram Hossain Akanda","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3278","SPL-006869","Noor Mohammad","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3279","SPL-006870","Zahirul Islam","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3280","SPL-006871","Md. Ayub Ali","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3281","SPL-006872","Md. Shohag","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3282","SPL-006873","Abdur Rashid","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3283","SPL-006874","Md. Sakil Ahmad","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3284","SPL-006875","Md. Mohsin","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3285","SPL-006876","Syed Minhajul Kabir","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3286","SPL-006877","Md. Rafiqul Islam Taluqdar","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3287","SPL-006878","Md Iqbal Hossain","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3288","SPL-006879","Khokan Barua","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3289","SPL-006880","Md. Kamrul Hasan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3290","SPL-006881","Khaja Mohiuddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3291","SPL-006882","Md. Main Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3292","SPL-006883","Md. Sanoar","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3293","SPL-006884","Md. Mokter Hossain","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3294","SPL-006885","Md. Anisur Rahman","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3295","SPL-006886","Md. Aktar","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3296","SPL-006887","Shek Mohammed","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3297","SPL-006888","Mohammad Ismail","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3298","SPL-006889","Didarul Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3299","SPL-006890","Md. Saiful Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3300","SPL-006891","Md. Anowarul Islam","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("3301","SPL-006893","Md. Helal Uddin","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3302","SPL-006894","Md. Shahinur Ali","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3303","SPL-006895","Suhel Ahmed","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3304","SPL-006896","Ruel Estrella Catan","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Ship And Yard Planner","");
INSERT INTO inv_employee VALUES("3305","SPL-006897","Md. Imam Hossain","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Deputy Manager","");
INSERT INTO inv_employee VALUES("3306","SPL-006898","Philip Gomes","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Shift In-Charge","");
INSERT INTO inv_employee VALUES("3307","SPL-006899","Md. Mahbub Khan","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3308","SPL-006900","Md. Riaz Hossan","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Shift In-Charge","");
INSERT INTO inv_employee VALUES("3309","SPL-006901","Md. Momin Ullah","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3310","SPL-006902","Md. Omar Faruk","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3311","SPL-006903","Md. Lutful Hoque","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3312","SPL-006904","Md. Saiful Islam","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3313","SPL-006905","Md. Ahasan Ullah","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3314","SPL-006906","Md. Shah Alam","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3315","SPL-006907","Md. Nazrul Islam","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3316","SPL-006908","SK. Riad Mahmud Alam","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3317","SPL-006909","Md. Mahin Uddin","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3318","SPL-006910","Mohammad Sayem Hussain","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3319","SPL-006911","Md. Rahmat Ullah","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3320","SPL-006912","Mark Julius Pratchard","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3321","SPL-006913","Md. Shahinul Alam","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Planning Manager","");
INSERT INTO inv_employee VALUES("3322","SPL-006914","Sheikh Mohammed Aurangjeb","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Senior Documentation Staff","");
INSERT INTO inv_employee VALUES("3323","SPL-006915","Mohin Uddin","Saif Powertec Ltd.","SPOT","CTMS","Documentation Staff Trainee","");
INSERT INTO inv_employee VALUES("3324","SPL-006916","Md. Ismail","Saif Powertec Ltd.","SPOT","Documentation","Officer","");
INSERT INTO inv_employee VALUES("3325","SPL-006918","Md. Nurul Alam","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Terminal Superintendent","");
INSERT INTO inv_employee VALUES("3326","SPL-006919","Md. Hadaytul Islam Shkder","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Senior Yard Supervisor","");
INSERT INTO inv_employee VALUES("3327","SPL-006920","Md.  Yousuf","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Assistant Yard Superintendent","");
INSERT INTO inv_employee VALUES("3328","SPL-006921","Md. Saiful Islam","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Yard Supervisor","");
INSERT INTO inv_employee VALUES("3329","SPL-006922","Sunil Das","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Yard Supervisor","");
INSERT INTO inv_employee VALUES("3330","SPL-006923","Md Mohiuddin","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Yard Supervisor","");
INSERT INTO inv_employee VALUES("3331","SPL-006924","Mohammed Jasim Uddin Sikder","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Yard Supervisor","");
INSERT INTO inv_employee VALUES("3332","SPL-006925","M. A. Kader Farid","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Yard Supervisor","");
INSERT INTO inv_employee VALUES("3333","SPL-006926","Md. Mostofa Khan","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Yard Supervisor","");
INSERT INTO inv_employee VALUES("3334","SPL-006927","Md Rabiul Awal","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Yard Supervisor","");
INSERT INTO inv_employee VALUES("3335","SPL-006928","Md. Akramul Hoque","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Yard Supervisor","");
INSERT INTO inv_employee VALUES("3336","SPL-006929","Md. Shamsul Alam Rony","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Senior Keep Down Checker","");
INSERT INTO inv_employee VALUES("3337","SPL-006930","Md. Sarwar Alam","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Terminal Superintendent","");
INSERT INTO inv_employee VALUES("3338","SPL-006931","Md. Kamal Miah","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Assistant Yard Superintendent","");
INSERT INTO inv_employee VALUES("3339","SPL-006932","Md. Abu Bakar Siddik","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("3340","SPL-006933","Humayun Kabir","Saif Powertec Ltd.","Corporate","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("3341","SPL-006934","Md. Sams Uddin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3342","SPL-006936","Anwar Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3343","SPL-006937","Md. Asif","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3344","SPL-006939","Hazrat Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3345","SPL-006940","Abdur Rahman","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3346","SPL-006941","Md. Zakaria Biswas","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3347","SPL-006942","Md Imtiaz Ahmmad Emon","Saif Powertec Ltd.","SPOT","Administration","Yard Checker","");
INSERT INTO inv_employee VALUES("3348","SPL-006946","Tokon","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("3349","SPL-006947","Md. Akter Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3350","SPL-006948","Md. Shakib Ahmed","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3351","SPL-006950","Ali Hasan Sujon","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("3352","SPL-006951","Md. Mahbubur Rahman","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("3353","SPL-006952","Md. Mizanur Rahman","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("3354","SPL-006953","Md. Fakrul Islam Parvez","Saif Powertec Ltd.","Corporate","Brand Communication","Brand Promoter","");
INSERT INTO inv_employee VALUES("3355","SPL-006954","Md. Towhidul Islam","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("3356","SPL-006955","Mohammed Mohiuddin","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3357","SPL-006956","Md. Hasan Mia Abul Kalam","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3358","SPL-006957","Abdur Rouf","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3359","SPL-006958","Abdul Sukur","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3360","SPL-006959","Mohammad Nashir Uddin","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3361","SPL-006960","Md. Abu Tayab","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3362","SPL-006961","Md. Abdus Salam","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3363","SPL-006962","Md.Jahir Hossen Babu","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3364","SPL-006963","Md. Mosiur Rahman","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3365","SPL-006964","Mahabub Alam","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3366","SPL-006966","Md. Salah Uddin","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3367","SPL-006967","Habibur Rahman Shekh","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3368","SPL-006968","Md. Hafij Sheikh","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3369","SPL-006969","Md. Harun Ar Rashid Gazi","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3370","SPL-006970","Md. Enamul Haque","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3371","SPL-006971","Mohammad Mahbubul Alam","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3372","SPL-006972","Shah Mun Tasin Farid","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3373","SPL-006973","Md. Siful Islam Shapan","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3374","SPL-006974","Md. Ahssan Ulla","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3375","SPL-006975","Nurun Nosir Chowdhury","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3376","SPL-006976","Farid Hosaain","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3377","SPL-006977","Md. Abul Kalam","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3378","SPL-006979","S.M. Awal Karim","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3379","SPL-006980","Md. Nazmul Hossain","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3380","SPL-006981","Md. Kamrul Hasan","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3381","SPL-006982","Md. Nasir Uddin","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3382","SPL-006983","Jakirul Islam","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3383","SPL-006984","Abul Hasem","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3384","SPL-006985","Md. Samsuddin","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3385","SPL-006986","Didarul Alam","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3386","SPL-006987","Md. Al Amin","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3387","SPL-006988","Syed Mizanur Rahman","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3388","SPL-006989","Md. Samsuzzaman","Saif Powertec Ltd.","Battery","Quality Assurance","Officer","");
INSERT INTO inv_employee VALUES("3389","SPL-006990","Mahfujul Islam","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3390","SPL-006991","A.S.M. Sayem","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3391","SPL-006992","Azmir Hossan","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3392","SPL-006994","Mohammed Fakir Alamgir","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3393","SPL-006995","Md. Khursid Alam","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3394","SPL-006996","Md. Nayem Shake","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3395","SPL-006997","Sajib Miah","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3396","SPL-006998","Md. Abdus Satter","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("3397","SPL-006999","Md. Nuruzzaman","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3398","SPL-007000","Mahammad Shah Alam","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3399","SPL-007001","Main Uddin","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3400","SPL-007002","Md. Rumel Akanda","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3401","SPL-007003","Tanvir Ahmed","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3402","SPL-007004","Tanvir Rahman","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3403","SPL-007005","Md. Salah Uddin","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3404","SPL-007006","Md. Khaled Hasan Mubin","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3405","SPL-007007","Nayem Hasan","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3406","SPL-007008","Md. Fahad Hossain","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3407","SPL-007009","Nazmul Karim","Saif Powertec Ltd.","Corporate","Administration","Assistant General Manager","");
INSERT INTO inv_employee VALUES("3408","SPL-007010","Md. Jabed","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3409","SPL-007011","Md. Abdul Sattar","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3410","SPL-007012","Md. Akter Hossan","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3411","SPL-007013","Anoweroul Momin Bhuyian","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3412","SPL-007014","Md. Minaz Khan","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3413","SPL-007015","Ikramul Islam","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3414","SPL-007016","Golam Rasul","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3415","SPL-007017","Sujan Hory","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3416","SPL-007018","Jobayer Hasan Shovu","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3417","SPL-007019","Md. Tuhin Hossain","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3418","SPL-007020","Md. Naim Hossan","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3419","SPL-007021","Md. Al Amin Hossain","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3420","SPL-007022","Md. Shamim Sk","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3421","SPL-007023","Md. Mashud Rana","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3422","SPL-007024","Mohammad Irfan Hassan","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3423","SPL-007025","Md. Tohidur Rahman","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3424","SPL-007026","Md. Ashikur Islam","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3425","SPL-007027","Sattajit Das","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3426","SPL-007028","Md. Ashik Rana","Saif Powertec Ltd.","SPOT","QGC","RTG Operator","");
INSERT INTO inv_employee VALUES("3427","SPL-007029","Yeasin Arafat","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("3428","SPL-007030","Md. Parves","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3429","SPL-007031","Md. Johirul Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3430","SPL-007032","Sayed Ahmad","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3431","SPL-007033","Md. Mizanur Rahman","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3432","SPL-007034","Methun Kumar","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3433","SPL-007035","Farid Uddin Akon","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("3434","SPL-007036","Poltu Haq Tarafder","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3435","SPL-007037","Md. Ali Hossain","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3436","SPL-007038","Md. Abdur Rahim","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3437","SPL-007039","Md. Nurul Islam","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3438","SPL-007040","Nur Islam Sohel","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3439","SPL-007041","Md. Eaqub","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3440","SPL-007042","Md. Parvez Ahamad","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3441","SPL-007043","Md. Sumon Islam","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3442","SPL-007044","Biplob Dash","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3443","SPL-007045","Forhad Miah","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3444","SPL-007046","Md. Kide Azam","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3445","SPL-007047","Abdul Aziz","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("3446","SPL-007048","Md. Elias Miah","Saif Powertec Ltd.","Battery","Administration","Supervisor","");
INSERT INTO inv_employee VALUES("3447","SPL-007049","Md. Rozab Ali Bishwos","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("3448","SPL-007050","Baizid Haider Chaudhury","Saif Powertec Ltd.","Corporate","IT","Manager","");
INSERT INTO inv_employee VALUES("3449","SPL-007051","Md. Anisul Haque Tarafder","Saif Powertec Ltd.","SPOT","Delivery","Manager","");
INSERT INTO inv_employee VALUES("3450","SPL-007052","Md. Mizanur Rahman","Saif Powertec Ltd.","SPOT","Delivery","Supervisor In-Charge","");
INSERT INTO inv_employee VALUES("3451","SPL-007053","Kazi Shamsuddin","Saif Powertec Ltd.","EHS and Maritime Law","EHS","Medical Assistant","");
INSERT INTO inv_employee VALUES("3452","SPL-007054","Md. Alamgir Hossain","Saif Powertec Ltd.","EHS and Maritime Law","EHS","Medical Assistant","");
INSERT INTO inv_employee VALUES("3453","SPL-007055","Utpal Biswas","Saif Powertec Ltd.","SPOT","Delivery","Labour In-Charge","");
INSERT INTO inv_employee VALUES("3454","SPL-007056","Md. Shafiqul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3455","SPL-007057","Md. Jahir Uddin","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3456","SPL-007058","Md. Shahjahan Hossain","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3457","SPL-007059","Md. Moshiur Rahman","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3458","SPL-007060","Sheik Asif Mahbub","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3459","SPL-007061","Md. Monirul Alam","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3460","SPL-007062","Md. Helal Uddin","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3461","SPL-007063","Md. Hafizor Rahman","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3462","SPL-007064","Mohammed Monjurul Alam Bappy","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3463","SPL-007065","Md. Arif Hossain","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3464","SPL-007066","S.M. Ashif Rahman","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3465","SPL-007067","Md. Abul Khair Bhuiyan","Saif Powertec Ltd.","SPOT","Delivery","Billing Assistant","");
INSERT INTO inv_employee VALUES("3466","SPL-007068","Md. Fazle Alam","Saif Powertec Ltd.","SPOT","Delivery","Billing Assistant","");
INSERT INTO inv_employee VALUES("3467","SPL-007069","Mohammed Tauhidul Islam Bhuyain","Saif Powertec Ltd.","SPOT","Delivery","Officer","");
INSERT INTO inv_employee VALUES("3468","SPL-007070","Mir Md. Abdur Rahman","Saif Powertec Ltd.","SPOT","Delivery","Labour Supervisor","");
INSERT INTO inv_employee VALUES("3469","SPL-007071","Md. Harun Ur Rashid","Saif Powertec Ltd.","SPOT","Delivery","Labour Supervisor","");
INSERT INTO inv_employee VALUES("3470","SPL-007072","Firujul Amin","Saif Powertec Ltd.","SPOT","Delivery","Labour Supervisor","");
INSERT INTO inv_employee VALUES("3471","SPL-007073","Md. Nurul Alam","Saif Powertec Ltd.","SPOT","Delivery","Labour Supervisor","");
INSERT INTO inv_employee VALUES("3472","SPL-007074","Dulal Chandra Voumik","Saif Powertec Ltd.","SPOT","Delivery","Labour Supervisor","");
INSERT INTO inv_employee VALUES("3473","SPL-007075","Air Mohammed","Saif Powertec Ltd.","SPOT","Delivery","Labour Supervisor","");
INSERT INTO inv_employee VALUES("3474","SPL-007076","Md. Mohosin Meah","Saif Powertec Ltd.","SPOT","Delivery","Labour Supervisor","");
INSERT INTO inv_employee VALUES("3475","SPL-007077","Md. Ali","Saif Powertec Ltd.","SPOT","Delivery","Driver","");
INSERT INTO inv_employee VALUES("3476","SPL-007078","Abdul Malek","Saif Powertec Ltd.","SPOT","Delivery","Driver","");
INSERT INTO inv_employee VALUES("3477","SPL-007079","Md Touhidul Alam","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3478","SPL-007080","Julfikar Ali","Saif Powertec Ltd.","SPOT","Administration","Peon","");
INSERT INTO inv_employee VALUES("3479","SPL-007082","Md. Helal","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("3480","SPL-007083","Md. Humayun Kabir","Saif Powertec Ltd.","SPOT","Delivery","Assistant Manager","");
INSERT INTO inv_employee VALUES("3481","SPL-007084","Md. Merazul Islam","Saif Powertec Ltd.","SPOT","Delivery","Billing Assistant","");
INSERT INTO inv_employee VALUES("3482","SPL-007086","Md. Harun-Ar-Rashid","Saif Powertec Ltd.","Battery","Service And WSS","Senior Officer","");
INSERT INTO inv_employee VALUES("3483","SPL-007087","A.T.M. Khaled Noor","Saif Powertec Ltd.","Battery","Marketing And Sales- Export And Corporate","General Manager","");
INSERT INTO inv_employee VALUES("3484","SPL-007089","Md. Reyazul Islam","Saif Powertec Ltd.","SPOT","Administration","Officer","");
INSERT INTO inv_employee VALUES("3485","SPL-007092","Md. Raju Uddin","Saif Powertec Ltd.","Corporate","Project","Carpenter","");
INSERT INTO inv_employee VALUES("3486","SPL-007093","Nozrul Islam","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3487","SPL-007094","Md. Shala Uddin","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3488","SPL-007095","Md. Omorfaruk","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3489","SPL-007096","Mohammad Forkan","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3490","SPL-007097","Md. Johbirul Haque","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3491","SPL-007098","Musa Kalimullah","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3492","SPL-007099","Md. Moniruzzaman","Saif Powertec Ltd.","SPOT","Quay Yard Supervisor","Assistant Terminal Suprintendent","");
INSERT INTO inv_employee VALUES("3493","SPL-007100","Md. Jahirul Islam","Saif Powertec Ltd.","SPOT","CTMS","Yard Supervisor","");
INSERT INTO inv_employee VALUES("3494","SPL-007101","Rakibul Hasan","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3495","SPL-007102","Md. Kutub Uddin","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3496","SPL-007103","Taposh Kumar Mondal","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3497","SPL-007104","Shimul Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3498","SPL-007105","Md. Alal Hossain","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3499","SPL-007106","Md. Tarikul Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3500","SPL-007107","Ashutosh Mondol","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3501","SPL-007108","Md. Sazzad Ahammad","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3502","SPL-007109","Md. Soab Akter","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3503","SPL-007110","Masum Sheikh","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3504","SPL-007111","Md. Mehadi Hassan","Saif Powertec Ltd.","SPOT","QGC","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3505","SPL-007112","Shariful Hoque","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3506","SPL-007113","Mohammad Rayhan","Saif Powertec Ltd.","SPOT","ITV","SC Operator","");
INSERT INTO inv_employee VALUES("3507","SPL-007114","Md. Azim Uddin","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3508","SPL-007115","Mohammed Faridul Alam","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3509","SPL-007116","Humayun Kabir","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3510","SPL-007117","Md. Raihan Nawaz Nishat","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3511","SPL-007118","Nazrul Islam Rubal","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3512","SPL-007119","Md. Ibrahim Khalil","Saif Powertec Ltd.","SPOT","Ship Planning","Checker","");
INSERT INTO inv_employee VALUES("3513","SPL-007120","Md. Shohel Rana","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3514","SPL-007121","Shahidul Haque","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3515","SPL-007122","Jahed Hossain","Saif Powertec Ltd.","SPOT","Terminal Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3516","SPL-007123","Toukiruzzaman Chowdhury","Saif Powertec Ltd.","SPOT","Terminal Operation","Assistant Billing Coordinator","");
INSERT INTO inv_employee VALUES("3517","SPL-007124","Md. Abu Syed","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Documentation Staff Trainee","");
INSERT INTO inv_employee VALUES("3518","SPL-007125","Md. Sarwar Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3519","SPL-007127","Md. Nizam Uddin","Saif Powertec Ltd.","Corporate","Administration","Executive","");
INSERT INTO inv_employee VALUES("3520","SPL-007128","Md. Milad Hussain","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3521","SPL-007129","Md. Abdul Barik","Saif Powertec Ltd.","Corporate","Administration","Admin Assistant","");
INSERT INTO inv_employee VALUES("3522","SPL-007130","Md. Azaharul Haque","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3523","SPL-007132","Md. Nazim Uddin","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3524","SPL-007133","Md. Somon","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3525","SPL-007134","Uzzwal Biswas","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3526","SPL-007136","Mainul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3527","SPL-007137","Md. Sumon Khan","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("3528","SPL-007138","Md. Imran Hossain Milon","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("3529","SPL-007139","Md. Shahin Musolli","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("3530","SPL-007140","Md. Sabbir Hosen Molla","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("3531","SPL-007141","Md. Babul Akter","Saif Powertec Ltd.","Corporate","Administration","Escort Officer","");
INSERT INTO inv_employee VALUES("3532","SPL-007142","Md. Nazrul Islam","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3533","SPL-007143","Hossain Arman","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3534","SPL-007144","Md. Meraz","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3535","SPL-007145","Md. Khalid Hasan","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("3536","SPL-007146","Md. Zakaria Islam","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("3537","SPL-007147","Md. Shahinur Rahman","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("3538","SPL-007148","Md. Lokman Hossain Molla","Saif Powertec Ltd.","Business Development","Business Development","Executive Director","");
INSERT INTO inv_employee VALUES("3539","SPL-007150","Muhammad Rasel","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("3540","SPL-007151","Sree Liton Chandra Bormon","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("3541","SPL-007152","Konok","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("3542","SPL-007153","Mohammad Liton","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("3543","SPL-007154","Md. Zahidul Islam","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("3544","SPL-007155","Tarique Rashid","Saif Powertec Ltd.","Corporate","Business Development","Assistant Manager","");
INSERT INTO inv_employee VALUES("3545","SPL-007156","Md. Matiar Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("3546","SPL-007157","Dilbar Khan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3547","SPL-007158","Md. Zahid Molla","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3548","SPL-007159","Md. Noor Amin Mondol","Saif Powertec Ltd.","SPOT","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("3549","SPL-007160","Md. Abul Khair","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3550","SPL-007161","Md. Nurer Rahman","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3551","SPL-007162","Jony Shaikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3552","SPL-007163","Md. Karim Uddin","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("3553","SPL-007165","Wahiduzzaman Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3554","SPL-007166","Md. Ataher Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Inspector","");
INSERT INTO inv_employee VALUES("3555","SPL-007167","Md. Raj Mamud","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("3556","SPL-007168","Md. Hazrat Ali","Saif Powertec Ltd.","SPOT","Delivery","Driver","");
INSERT INTO inv_employee VALUES("3557","SPL-007170","Mohammad Shahabuddin","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3558","SPL-007171","Md. Obaydul Haq","Saif Powertec Ltd.","Corporate","Administration","Security Inspector","");
INSERT INTO inv_employee VALUES("3559","SPL-007172","Md. Monare Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3560","SPL-007173","Md Sumon ","Saif Powertec Ltd.","SPOT","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("3561","SPL-007174","Md. Faruk Ahmad","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3562","SPL-007175","Md. Asik Sikder","Saif Powertec Ltd.","Corporate","IT","Officer","");
INSERT INTO inv_employee VALUES("3563","SPL-007177","Nur Mohammad Nuru","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("3564","SPL-007178","Md. Salim","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("3565","SPL-007180","Kazi Rabbi Hasan Shanto","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("3566","SPL-007181","Md. Abul Kashem","Saif Powertec Ltd.","Battery","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("3567","SPL-007182","Md. Zakiul Ala Prodhan","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("3568","SPL-007183","Md. Shamim Hossain","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3569","SPL-007184","Md. Mohiuddin","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3570","SPL-007185","Abu Bakar Siddik","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3571","SPL-007186","Md. Zahidul Islam","Saif Powertec Ltd.","Corporate","Project","Project Engineer","");
INSERT INTO inv_employee VALUES("3572","SPL-007187","Md Zahidur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("3573","SPL-007189","Md. Sabuj Hossain","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("3574","SPL-007190","Md Monowar Hossain","Saif Powertec Ltd.","Corporate","Project","Carpenter","");
INSERT INTO inv_employee VALUES("3575","SPL-007191","Md. Samim Hossain","Saif Powertec Ltd.","Corporate","Project","Helper","");
INSERT INTO inv_employee VALUES("3576","SPL-007192","Nazmul Haque","Saif Powertec Ltd.","SPOT","Strategic Planning And Terminal Operation","Executive Director","");
INSERT INTO inv_employee VALUES("3577","SPL-007193","Provas Sikder","Saif Powertec Ltd.","Corporate","Project","Site Engineer","");
INSERT INTO inv_employee VALUES("3578","SPL-007194","Arman Hossain","Saif Powertec Ltd.","Corporate","Administration","Officer","");
INSERT INTO inv_employee VALUES("3579","SPL-007195","Mohammed Salim Kabir","Saif Powertec Ltd.","SPOT","Terminal Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3580","SPL-007196","Md. Din Islam","Saif Powertec Ltd.","SPOT","Strategic Planning And Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("3581","SPL-007198","Razib Hasan","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3582","SPL-007199","Hasibul Islam","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3583","SPL-007201","Md. Abdul Jalil","Saif Powertec Ltd.","Battery","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("3584","SPL-007202","Arman","Saif Powertec Ltd.","Battery","Administration","Canteen Boy","");
INSERT INTO inv_employee VALUES("3585","SPL-007203","Md. Assaduzzaman","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3586","SPL-007204","Md. Shopon Ali","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("3587","SPL-007205","Md. Ibrahim Molla","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3588","SPL-007206","Md. Samsher Alam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3589","SPL-007207","Shakil Hawlader","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3590","SPL-007208","Sk. Nayon Yasin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3591","SPL-007209","Md. Nobel","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3592","SPL-007211","Md. Munnaf Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3593","SPL-007212","Md. Sohel Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3594","SPL-007213","Md. Najim Uddin Nirob","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3595","SPL-007214","Md. Rezon Ahmed","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3596","SPL-007215","Mizanur Rahman","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3597","SPL-007217","Rafiqul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3598","SPL-007218","Md. Rubel Miah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3599","SPL-007219","Md. Nazrul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3600","SPL-007221","Shirin Sultana","Saif Powertec Ltd.","Corporate","Administration","Officer","");
INSERT INTO inv_employee VALUES("3601","SPL-007223","Raihan","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("3602","SPL-007224","Md. Mamun","Saif Powertec Ltd.","SPOT","Administration","Peon","");
INSERT INTO inv_employee VALUES("3603","SPL-007225","Md. Nanto Hossain","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("3604","SPL-007226","Md. Mahfuzur Rahman","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("3605","SPL-007227","Shahjan","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("3606","SPL-007228","Md. Abdul Subahan","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("3607","SPL-007229","Sayed Usman Ali","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("3608","SPL-007230","Md. Saiful Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3609","SPL-007231","Md. Golam Kibriya","Saif Powertec Ltd.","Energy Business","Pre Sales","Application Engineer","");
INSERT INTO inv_employee VALUES("3610","SPL-007232","Abdul Ohed","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3611","SPL-007233","James Shimul Gomes","Saif Powertec Ltd.","Corporate","Administration","Executive","");
INSERT INTO inv_employee VALUES("3612","SPL-007234","Abul Kalam Azad","Saif Powertec Ltd.","Service And Energy Business","Maintenance","Senior Manager","");
INSERT INTO inv_employee VALUES("3613","SPL-007235","Sheikh Zahidul Islam","Saif Powertec Ltd.","SPOT","Operation","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("3614","SPL-007236","Md Ferozul Islam","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("3615","SPL-007238","Mohammad Obaidul Haque","Saif Powertec Ltd.","Spare Parts","Service","General Manager","");
INSERT INTO inv_employee VALUES("3616","SPL-007239","Md. Abir Hossain","Saif Powertec Ltd.","Battery","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("3617","SPL-007240","Md. Barak Ullah","Saif Powertec Ltd.","Battery","Store","Carpenter","");
INSERT INTO inv_employee VALUES("3618","SPL-007241","Khokon Chandra Das","Saif Powertec Ltd.","Battery","Store","Technician","");
INSERT INTO inv_employee VALUES("3619","SPL-007242","Halim Miah","Saif Powertec Ltd.","Battery","Quality Assurance","Technician","");
INSERT INTO inv_employee VALUES("3620","SPL-007243","Khyrul Alam Chowdhury","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("3621","SPL-007244","Sojib Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3622","SPL-007245","Md. Amiruzzaman","Saif Powertec Ltd.","Battery","MC","Technician","");
INSERT INTO inv_employee VALUES("3623","SPL-007246","Md. Rasel Rana","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("3624","SPL-007248","Md. Shahjahan Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3625","SPL-007249","Md. Sujon Mia","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3626","SPL-007250","Dipon Chandoro Das","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3627","SPL-007251","Sheenjoy Mondol","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3628","SPL-007252","Md. Jahangir Alam","Saif Powertec Ltd.","Battery","Store","Technician","");
INSERT INTO inv_employee VALUES("3629","SPL-007253","Swapan Kumar Ray","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3630","SPL-007254","Md. Romio Ripon","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3631","SPL-007255","Achinta Kumar Roy","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3632","SPL-007256","Md. Shoriful Islam Shaon","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3633","SPL-007257","Md. Rashidul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3634","SPL-007258","Nur Mohammad Haque","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3635","SPL-007260","Md. Asadullah","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("3636","SPL-007261","Md. Zahid Hasan","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("3637","SPL-007262","Md. Azizul Islam","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("3638","SPL-007263","Md. Ali Bepary","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("3639","SPL-007264","Md. Nazmul Mollah","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("3640","SPL-007265","Md. Mahinur Hasan","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("3641","SPL-007266","Abdul Hamid Sarker","Saif Powertec Ltd.","Battery","CMP","Technician","");
INSERT INTO inv_employee VALUES("3642","SPL-007267","Rakib Fakir","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3643","SPL-007268","Abinash Kumar","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3644","SPL-007269","Ram Prosad Buktoy","Saif Powertec Ltd.","Battery","Store","Carpenter","");
INSERT INTO inv_employee VALUES("3645","SPL-007270","Md. Mubarak Hossen","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3646","SPL-007271","Md. Ruhul Amin","Saif Powertec Ltd.","Battery","Gel And VRLA","Technician","");
INSERT INTO inv_employee VALUES("3647","SPL-007272","Md. Rana Hosen","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3648","SPL-007273","Abdul Halim Hossaini","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3649","SPL-007274","Md. Jowel","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3650","SPL-007275","Md. Bashir Howlader","Saif Powertec Ltd.","Battery","Store","Technician","");
INSERT INTO inv_employee VALUES("3651","SPL-007276","Md. Al-Amin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3652","SPL-007277","Boiddya Nath Deb","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3653","SPL-007278","Md. Imran Matubbar","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3654","SPL-007279","Subud Chandra Sarker","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3655","SPL-007280","Md. Ripon Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("3656","SPL-007282","Md. Sultan Ali","Saif Powertec Ltd.","SPOT","Administration","Peon","");
INSERT INTO inv_employee VALUES("3657","SPL-007283","Nur Nobi","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("3658","SPL-007284","Md. Angur","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("3659","SPL-007285","Md. Nipu","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("3660","SPL-007286","Mohammad Alamgir","Saif Powertec Ltd.","SPOT","Operation","Driver","");
INSERT INTO inv_employee VALUES("3661","SPL-007287","Sumon Mia","Saif Powertec Ltd.","Corporate","Human Resource Management","Executive","");
INSERT INTO inv_employee VALUES("3662","SPL-007288","Umme Kausar Sultana","Saif Powertec Ltd.","Corporate","Customer Care","Deputy Manager","");
INSERT INTO inv_employee VALUES("3663","SPL-007289","Md. Ahadul Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3664","SPL-007290","Rukun Uddin","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3665","SPL-007291","Md. Shakil Bhuiyan","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3666","SPL-007292","Md. Mydul Kabir Khan","Saif Powertec Ltd.","Energy Business","Marine","Manager","");
INSERT INTO inv_employee VALUES("3667","SPL-007293","Md. Akib Khan","Saif Powertec Ltd.","SPOT","RTG","Yard Checker","");
INSERT INTO inv_employee VALUES("3668","SPL-007294","Abu Sadat Md. Sayem","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3669","SPL-007295","Y A Moontasir","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("3670","SPL-007296","Md. Mahbub Alam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("3671","SPL-007297","Md. Samsul Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3672","SPL-007298","Muhammad Ashiquzzaman","Saif Powertec Ltd.","Corporate","Human Resource Management","Assistant General Manager","");
INSERT INTO inv_employee VALUES("3673","SPL-007299","A N M Inzamamul Huque Ornim","Saif Powertec Ltd.","Corporate","IT","IT Assistant","");
INSERT INTO inv_employee VALUES("3674","SPL-007301","Md. Masud","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3675","SPL-007302","Md. Rubel Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3676","SPL-007303","Md. Homaun Kabir Soarder","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3677","SPL-007305","Rakibul Hasan","Saif Powertec Ltd.","Corporate","Project","Electrician","");
INSERT INTO inv_employee VALUES("3678","SPL-007306","Md. Ala Uddin Imran","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3679","SPL-007307","Md. Salahuddin","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3680","SPL-007308","Md. Lutfor Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3681","SPL-007309","Md. Sohel Rana","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3682","SPL-007310","Nasrin Akter","Saif Powertec Ltd.","Corporate","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("3683","SPL-007311","Md. Ahshan Habib","Saif Powertec Ltd.","Service And Energy Business","Administration","Driver","");
INSERT INTO inv_employee VALUES("3684","SPL-007312","Abdur Rahim Papon","Saif Powertec Ltd.","Corporate","Administration","Officer","");
INSERT INTO inv_employee VALUES("3685","SPL-007314","Md Farid Uddin","Saif Powertec Ltd.","SPOT","Administration","Officer","");
INSERT INTO inv_employee VALUES("3686","SPL-007315","A B M Hasanuzzaman","Saif Powertec Ltd.","Battery","Sales And Marketing","Area Manager","");
INSERT INTO inv_employee VALUES("3687","SPL-007316","Asanur Sheikh","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3688","SPL-007317","Md Lokman Hossan","Saif Powertec Ltd.","SPOT","Operation","Tally Clerk","");
INSERT INTO inv_employee VALUES("3689","SPL-007318","Md. Tazul Islam","Saif Powertec Ltd.","Battery","Service And WSS","Senior Officer","");
INSERT INTO inv_employee VALUES("3690","SPL-007319","Tasmia Noor","Saif Powertec Ltd.","Corporate","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("3691","SPL-007320","Abdur Razzak","Saif Powertec Ltd.","Battery","Store","Senior Officer","");
INSERT INTO inv_employee VALUES("3692","SPL-007321","Tanzim Kisher Shogan","Saif Powertec Ltd.","Corporate","Administration","Officer","");
INSERT INTO inv_employee VALUES("3693","SPL-007322","Titas","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("3694","SPL-007323","Md. Azgar Munsi","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("3695","SPL-007324","Md Mukul Mollah","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("3696","SPL-007325","Delwar Hossain","Saif Powertec Ltd.","Energy and Mineral Resource","Administration","Assistant Manager","");
INSERT INTO inv_employee VALUES("3697","SPL-007327","Md Sahabuddin","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3698","SPL-007328","Md Khairul Islam","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("3699","SPL-007329","Md Akkas Mia","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3700","SPL-007331","Md Hasan","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("3701","SPL-007332","Md Masum Billah","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("3702","SPL-007333","Md Kamrul Hassan","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3703","SPL-007334","Md Yousuf","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3704","SPL-007335","Mohamad Hasan Murad","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("3705","SPL-007336","Md Saroar Islam","Saif Powertec Ltd.","SPOT","CTMS","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3706","SPL-007337","Md Umar Faruk","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("3707","SPL-007338","Babu Molla","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3708","SPL-007339","Khairul Islam","Saif Powertec Ltd.","Battery","Gel And VRLA","Senior Officer","");
INSERT INTO inv_employee VALUES("3709","SPL-007340","Md Bahauddin Bhuiyan","Saif Powertec Ltd.","Business Development","Business Development","Senior Manager","");
INSERT INTO inv_employee VALUES("3710","SPL-007341","Md Jalal Uddin","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3711","SPL-007342","Mohammed Babul","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3712","SPL-007343","A S A Mahedi Alam Khan","Saif Powertec Ltd.","Corporate","Legal","Assistant Manager","");
INSERT INTO inv_employee VALUES("3713","SPL-007344","Prodip Kumar Biswas","Saif Powertec Ltd.","Battery","Marketing And Sales- Export And Corporate","Assistant Manager","");
INSERT INTO inv_employee VALUES("3714","SPL-007345","Md. Masud","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3715","SPL-007346","Sala Uddin Kader Chowdhury","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3716","SPL-007347","Mohammad Nasir Uddin","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3717","SPL-007348","Md.Monir Hossain Mahmud","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("3718","SPL-007349","Md Monuar Hosen","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3719","SPL-007350","Md. Bulbul Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3720","SPL-007351","Ashis Kumar Sharan","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3721","SPL-007352","Moniruzzaman","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3722","SPL-007353","Md. Rouson Alam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3723","SPL-007354","Al Amin","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3724","SPL-007355","Md. Moyenul Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3725","SPL-007356","Shovon Sen","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3726","SPL-007357","Md. Farhan Masuk Limon","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("3727","SPL-007358","Md.Tanvir Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3728","SPL-007359","Md Mamun","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3729","SPL-007360","Md Amir Hossain","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3730","SPL-007361","Mohammad Zihad  Hossain","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3731","SPL-007362","Md Helal Mia","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3732","SPL-007363","Kalim Ullah","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3733","SPL-007364","Shajal Kumer Sharma","Saif Powertec Ltd.","Battery","Factory Operation","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("3734","SPL-007365","Md Shohel","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3735","SPL-007366","Monowar Hossain Bappi","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3736","SPL-007367","Md Razib","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3737","SPL-007368","Emam Hossan Manna","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3738","SPL-007369","Md Shaha Jamal Shapi","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3739","SPL-007371","Md Ayub Ali","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3740","SPL-007372","Mohammed Hassan","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3741","SPL-007373","Mohammed Imran Hossen","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3742","SPL-007374","Md.Belal Hossain","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3743","SPL-007375","Mohammad Akbar Hasan","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3744","SPL-007376","Md. Sohel","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3745","SPL-007377","Md. Rezaul Karim","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3746","SPL-007378","Md Rahmamat Ullah","Saif Powertec Ltd.","Sub Station","Administration","Driver","");
INSERT INTO inv_employee VALUES("3747","SPL-007379","Monjir Hossan","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3748","SPL-007380","Md Faruk","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3749","SPL-007381","Mohammed Hanif","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3750","SPL-007382","Ibrahim Hossen Sheikh Shahed","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3751","SPL-007383","Mohammad Rajo","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3752","SPL-007384","Rayhan Bepari","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3753","SPL-007385","Mohiuddin","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3754","SPL-007386","Abid Hossain Rubel","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3755","SPL-007387","Md. Nurul Alam","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3756","SPL-007388","Jahangir Alam","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3757","SPL-007389","Md. Nazim Uddin","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3758","SPL-007390","Md. Mohiuddin","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3759","SPL-007391","Md Elias","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3760","SPL-007392","Md Deloyar Hossen","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3761","SPL-007393","Emdadul Haque Riaz","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3762","SPL-007394","Md Abu Taiyab","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3763","SPL-007395","Md Shohel","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3764","SPL-007396","Fakhrul Islam","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3765","SPL-007397","Md Alauddin","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3766","SPL-007398","Md. Abdul Alim","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3767","SPL-007399","Md Juweel","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3768","SPL-007400","Mohammad. Azizur Rohoman","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3769","SPL-007401","Feroz Mahmud Pabel","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3770","SPL-007402","Md. Nazrul Islam","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3771","SPL-007403","Md. Shahidullah","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3772","SPL-007404","Md Shahid","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3773","SPL-007405","Md. Alamgir","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3774","SPL-007406","Mohammad Osman","Saif Powertec Ltd.","SPOT","ITV","Trailer Operator","");
INSERT INTO inv_employee VALUES("3775","SPL-007407","Manik Chandra Majumder","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("3776","SPL-007408","Md Sazzat Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3777","SPL-007409","Abdul Latif Zahid","Saif Powertec Ltd.","Battery","Service And WSS","General Manager","");
INSERT INTO inv_employee VALUES("3778","SPL-007410","Md Ajam Khan","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3779","SPL-007411","Stalin Khisha","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("3780","SPL-007412","Mohammad Main Uddin","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3781","SPL-007413","Tareq Hasan","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3782","SPL-007414","Tarok Mondol","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("3783","SPL-007415","Mohammad Nayeem Miah","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3784","SPL-007416","Ryhan Uddin","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("3785","SPL-007417","Md. Rasel Khan","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3786","SPL-007418","Kabir Hossain","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3787","SPL-007419","Mohammad Jasim Uddin","Saif Powertec Ltd.","SPOT","RTG","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3788","SPL-007420","Md. Mosharaf Hossain Liton","Saif Powertec Ltd.","SPOT","RTG","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3789","SPL-007421","Sheak Sohidul Islam","Saif Powertec Ltd.","Battery","Service And WSS","Junior Officer","");
INSERT INTO inv_employee VALUES("3790","SPL-007422","Mohammad Easin Maraj","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("3791","SPL-007423","Md Kamal Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3792","SPL-007424","Md Hannan","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3793","SPL-007425","Mohammad Sajjad Hosen","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("3794","SPL-007426","Osman Goni","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3795","SPL-007427","Md Alamgir Dewan","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3796","SPL-007428","Md Habibur Rhaman Sawpan","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("3797","SPL-007429","Mohammad Shahidul Alam Miah","Saif Powertec Ltd.","Renewable Energy","Management","Chief Operating Officer","");
INSERT INTO inv_employee VALUES("3798","SPL-007430","Md. Hujaifa","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3799","SPL-007431","Md. Kamruzzaman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3800","SPL-007432","Yasin Arafat","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3801","SPL-007433","Md. Noor Ahammed Miah","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3802","SPL-007434","Md. Abul Hossain","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3803","SPL-007435","Akram Hossain","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("3804","SPL-007436","Sahin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3805","SPL-007437","Md Sultan Hossain","Saif Powertec Ltd.","Corporate","Brand Communication","Brand Promoter","");
INSERT INTO inv_employee VALUES("3806","SPL-007438","Tanveer Qureshee","Saif Powertec Ltd.","Corporate","IT","Web Designer","");
INSERT INTO inv_employee VALUES("3807","SPL-007439","Al-Shajid Abdullah","Saif Powertec Ltd.","SPOT","Administration","Deputy General Manager","");
INSERT INTO inv_employee VALUES("3808","SPL-007440","Md. Shofiqul Islam","Saif Powertec Ltd.","Battery","Service And WSS","Service Technician","");
INSERT INTO inv_employee VALUES("3809","SPL-007441","Asim Kumar Biswas","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("3810","SPL-007442","Md. Rahamat Ali","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("3811","SPL-007443","Mahir Haiyan Bishal","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3812","SPL-007444","Md Redowanur Rahman","Saif Powertec Ltd.","SPOT","Administration","Officer","");
INSERT INTO inv_employee VALUES("3813","SPL-007445","Omer Faruk Reyad","Saif Powertec Ltd.","SPOT","Delivery","Peon","");
INSERT INTO inv_employee VALUES("3814","SPL-007446","Md Taslim Uddin","Saif Powertec Ltd.","SPOT","Delivery","Delivery Checker","");
INSERT INTO inv_employee VALUES("3815","SPL-007447","Md Abdul Mannan","Saif Powertec Ltd.","Battery","Sales And Marketing","Chief Marketing Officer","");
INSERT INTO inv_employee VALUES("3816","SPL-007448","Md Jubayer Hosain","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Officer","");
INSERT INTO inv_employee VALUES("3817","SPL-007449","Md Rafiqur Rashid","Saif Powertec Ltd.","SPOT","Operation","Trainee Officer","");
INSERT INTO inv_employee VALUES("3818","SPL-007450","Ashraful Islam","Saif Powertec Ltd.","SPOT","Terminal Operation","Trainee Officer","");
INSERT INTO inv_employee VALUES("3819","SPL-007451","Md Khalid Zaman","Saif Powertec Ltd.","SPOT","Terminal Operation","Trainee Officer","");
INSERT INTO inv_employee VALUES("3820","SPL-007452","Md Ibrahim Rana","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Trainee Officer","");
INSERT INTO inv_employee VALUES("3821","SPL-007453","Md Mahmudul Hassan","Saif Powertec Ltd.","SPOT","Administration","Trainee Officer","");
INSERT INTO inv_employee VALUES("3822","SPL-007454","F M Mahedi Hasan","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Junior Engineer","");
INSERT INTO inv_employee VALUES("3823","SPL-007455","Md. Anisur Rahman","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("3824","SPL-007456","Md. Khairul Islam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("3825","SPL-007457","Sheikh Hasibur Rahman","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("3826","SPL-007458","Mithun Sen Gupta","Saif Powertec Ltd.","CTED-CTG","QGC Maintanence","Trainee Engineer","");
INSERT INTO inv_employee VALUES("3827","SPL-007459","Md. Shakran Habib","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Junior Engineer","");
INSERT INTO inv_employee VALUES("3828","SPL-007460","Md. Jayed Biswas","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Junior Engineer","");
INSERT INTO inv_employee VALUES("3829","SPL-007461","Md. Suman Fakir","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Mechanic","");
INSERT INTO inv_employee VALUES("3830","SPL-007462","Khukon Chowdhury","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("3831","SPL-007463","Nayan Dewanjee","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("3832","SPL-007464","Md. Sazzad Hossain","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("3833","SPL-007465","Md Robel Hossen","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("3834","SPL-007466","Md. Kaiyum Hossain","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("3835","SPL-007467","Md Amjat Hossain Bagmar","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("3836","SPL-007468","Md Anik Islam","Saif Powertec Ltd.","Corporate","EHS","Executive","");
INSERT INTO inv_employee VALUES("3837","SPL-007469","Salim","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("3838","SPL-007470","Md Sohag Mia","Saif Powertec Ltd.","Corporate","Brand Communication","Brand Promoter","");
INSERT INTO inv_employee VALUES("3839","SPL-007471","Nayan Mia","Saif Powertec Ltd.","Corporate","Brand Communication","Brand Promoter","");
INSERT INTO inv_employee VALUES("3840","SPL-007472","Md Sahid","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("3841","SPL-007473","Md Jahangir Alam","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("3842","SPL-007474","Jamal Uddin","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Mechanic","");
INSERT INTO inv_employee VALUES("3843","SPL-007475","Md Tarikul Islam Khokon","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("3844","SPL-007476","Md Shah Alam","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("3845","SPL-007477","Saydul Islam","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Assistant Mechanic","");
INSERT INTO inv_employee VALUES("3846","SPL-007478","Md Alauddin","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("3847","SPL-007479","Md Mehedi Hasan Akash","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("3848","SPL-007480","Sumon Bhakta","Saif Powertec Ltd.","Battery","MC","Executive","");
INSERT INTO inv_employee VALUES("3849","SPL-007481","Abu Hasan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3850","SPL-007482","Md Nazrul Islam","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("3851","SPL-007483","Md Morsed Bapari","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("3852","SPL-007484","Md Golam Rabbi","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Junior Technician","");
INSERT INTO inv_employee VALUES("3853","SPL-007485","Gopal Sarker","Saif Powertec Ltd.","Battery","Commercial","Assistant General Manager","");
INSERT INTO inv_employee VALUES("3854","SPL-007486","Tapos Kumer Datta","Saif Powertec Ltd.","SPOT","Finance And Accounts","Deputy General Manager","");
INSERT INTO inv_employee VALUES("3855","SPL-007487","Md Alif Khan","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3856","SPL-007488","Md Koushik Ahmed","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3857","SPL-007489","Md Rezaul Karim","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("3858","SPL-007490","Md Rafiul Islam Tusar","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3859","SPL-007491","Md Ikbal Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Officer","");
INSERT INTO inv_employee VALUES("3860","SPL-007492","Nowshed Alam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Mechanic","");
INSERT INTO inv_employee VALUES("3861","SPL-007493","Md Arifur Rahman","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Mechanic","");
INSERT INTO inv_employee VALUES("3862","SPL-007494","Md. Rezaul Karim Chy","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("3863","SPL-007495","Rejaul Karim","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("3864","SPL-007496","Md. Shohel Mia","Saif Powertec Ltd.","Battery","Store","Helper","");
INSERT INTO inv_employee VALUES("3865","SPL-007497","Md Hanif","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("3866","SPL-007498","Md Robel","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("3867","SPL-007499","Md. Salauddin","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("3868","SPL-007500","Kazi Anamul Haque","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Harbour Crane Operator","");
INSERT INTO inv_employee VALUES("3869","SPL-007501","Md Toslim Uddin","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("3870","SPL-007502","Emran Hossain","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("3871","SPL-007503","Nahian Naower","Saif Powertec Ltd.","Corporate","Enterprise Resource Planning","Executive","");
INSERT INTO inv_employee VALUES("3872","SPL-007504","Md Fotiq Miah","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3873","SPL-007505","Md Moniruzzaman","Saif Powertec Ltd.","Battery","RAndD","Deputy Manager","");
INSERT INTO inv_employee VALUES("3874","SPL-007506","Shohel Rana","Saif Powertec Ltd.","Battery","Gel And VRLA","Manager","");
INSERT INTO inv_employee VALUES("3875","SPL-007507","Armina Rahman","Saif Powertec Ltd.","Battery","Commercial","Assistant Manager","");
INSERT INTO inv_employee VALUES("3876","SPL-007508","Md Abdul Halim Molla","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3877","SPL-007509","Md Edris","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("3878","SPL-007510","Md Ashequr Rahman","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3879","SPL-007511","Md Easin Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3880","SPL-007512","Rostom Kazi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3881","SPL-007513","Rabbi","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3882","SPL-007514","Md Aktarul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3883","SPL-007515","Md Shakil Raihan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3884","SPL-007516","Md Mohshin Reza","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3885","SPL-007517","Mahmudul","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3886","SPL-007518","Md Harun-Or-Rashid","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3887","SPL-007519","Md Jasim Shikder","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("3888","SPL-007520","Md Sujan Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3889","SPL-007521","Md Safayat Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3890","SPL-007522","Md Nuruzzaman","Saif Powertec Ltd.","SPOT","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("3891","SPL-007523","Md Mahfuzur Rahman","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3892","SPL-007524","Arafat Mahmud","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3893","SPL-007525","Sahidul Sarder","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3894","SPL-007526","Md Mamun Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3895","SPL-007527","Md Rubel Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3896","SPL-007528","Md Azim Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3897","SPL-007529","Md Sagir Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3898","SPL-007530","Md Asadujjaman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3899","SPL-007531","Md. Shariful Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3900","SPL-007532","Rasel Mia","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("3901","SPL-007533","Md. Shahidul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Technician","");
INSERT INTO inv_employee VALUES("3902","SPL-007534","Md. Imam Hasan (Mamun)","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("3903","SPL-007535","HM Moniruzzaman","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("3904","SPL-007536","Md Nurul Hoda","Saif Powertec Ltd.","SPOT","Operation","Officer","");
INSERT INTO inv_employee VALUES("3905","SPL-007537","Md Jahidur Rahman Molla","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3906","SPL-007538","Md. Masud Rana","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3907","SPL-007539","Jubayet Parvej","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3908","SPL-007540","Md Jowel Hossan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3909","SPL-007541","Md Abdul Hannan Mia","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("3910","SPL-007542","Md Asadul","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3911","SPL-007543","Md. Zakir Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3912","SPL-007544","Masum Fakir","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3913","SPL-007545","Shariful Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3914","SPL-007546","Md Shahid","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3915","SPL-007547","Md Shakil Islam Bhuyain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("3916","SPL-007548","Md Nasimul Hasan","Saif Powertec Ltd.","Battery","Service And WSS","Deputy Manager","");
INSERT INTO inv_employee VALUES("3917","SPL-007549","Shanti Ranjan Howlader","Saif Powertec Ltd.","Sub Station","Project","Deputy Manager","");
INSERT INTO inv_employee VALUES("3918","SPL-007550","Md. Sumon Mia","Saif Powertec Ltd.","Battery","Service And WSS","Senior Officer","");
INSERT INTO inv_employee VALUES("3919","SPL-007551","Md. Salauddin Gazi","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("3920","SPL-007552","Md. Nurul Islam","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("3921","SPL-007553","Md. Hasibur Rahman Jihad","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Documentation Staff Trainee","");
INSERT INTO inv_employee VALUES("3922","SPL-007554","Md. Ali Ahmad","Saif Powertec Ltd.","SPOT","ITV","ITV Operator","");
INSERT INTO inv_employee VALUES("3923","SPL-007555","Abdul Zabbar","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3924","SPL-007556","Mohd. Harun","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3925","SPL-007557","Humayun Kabir","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3926","SPL-007558","Md. Hanif","Saif Powertec Ltd.","SPOT","QGC","QGC Operator","");
INSERT INTO inv_employee VALUES("3927","SPL-007559","Md. Rafique","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher Foreman","");
INSERT INTO inv_employee VALUES("3928","SPL-007560","Md. Nazimuddin","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher Foreman","");
INSERT INTO inv_employee VALUES("3929","SPL-007561","Md. Rafique","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher Foreman","");
INSERT INTO inv_employee VALUES("3930","SPL-007562","Md. Nazimuddin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher Foreman","");
INSERT INTO inv_employee VALUES("3931","SPL-007563","Abdul Halim","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher Foreman","");
INSERT INTO inv_employee VALUES("3932","SPL-007564","Md. Faruk Hossain","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher Foreman","");
INSERT INTO inv_employee VALUES("3933","SPL-007565","Md. Dulal","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3934","SPL-007566","Sumbu Das","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3935","SPL-007567","Md. Helal","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3936","SPL-007568","Md. Younus","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3937","SPL-007569","Noor Moksud Khan","Saif Powertec Ltd.","Corporate","Finance And Accounts","Manager","");
INSERT INTO inv_employee VALUES("3938","SPL-007570","Md Shafiqul Islam","Saif Powertec Ltd.","Battery","Service And WSS","Manager","");
INSERT INTO inv_employee VALUES("3939","SPL-007571","Md Abdul Jalil Mondol","Saif Powertec Ltd.","Corporate","Legal","Director","");
INSERT INTO inv_employee VALUES("3940","SPL-007572","Md Raton Ali Molla","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("3941","SPL-007573","Md. Nezam Uddin Rakib","Saif Powertec Ltd.","CTED-CTG","Administration","Peon","");
INSERT INTO inv_employee VALUES("3942","SPL-007574","Jakir Hossain","Saif Powertec Ltd.","SPOT","Administration","Officer","");
INSERT INTO inv_employee VALUES("3943","SPL-007575","Md Sahadat Hossain Bhuiyan","Saif Powertec Ltd.","SPOT","Finance And Accounts","Officer","");
INSERT INTO inv_employee VALUES("3944","SPL-007576","Md. Jahangir Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3945","SPL-007577","Abu Sauem","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3946","SPL-007578","Md. Rahmat Ullah","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3947","SPL-007579","Md. Azad","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3948","SPL-007580","Mohammad Ismail","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3949","SPL-007581","Md. Musa","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3950","SPL-007582","Shahadat Hossen","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3951","SPL-007583","Md. Amran Hossen","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3952","SPL-007584","Saiful Islam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3953","SPL-007585","Sumon Das","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3954","SPL-007586","Md. Sabuj","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3955","SPL-007587","Md. Elias","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3956","SPL-007588","Md. Ibrahim Khalil","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3957","SPL-007589","Md. Elias","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3958","SPL-007590","Md. Sultan","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3959","SPL-007591","Moqbul Ahamed","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3960","SPL-007592","Md. Tipu Sultan","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3961","SPL-007593","Md. Abdur Rahim","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3962","SPL-007594","Md. Nasu Meah","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3963","SPL-007595","Md. Lokman","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3964","SPL-007596","Elias","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3965","SPL-007597","Md. Ratan","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3966","SPL-007598","Md. Manjur Alam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3967","SPL-007599","Abdul Hakim","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3968","SPL-007600","Afsar Uddin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3969","SPL-007601","Nurul Islam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3970","SPL-007602","Md. Azizur Rahaman Khan","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3971","SPL-007603","Md. Kanchan","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3972","SPL-007604","Ashutos Das Teto","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3973","SPL-007605","Khokan","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3974","SPL-007606","Md. Jane Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3975","SPL-007607","Md. Shahidul Islam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3976","SPL-007608","Sazal Chowdhury","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3977","SPL-007609","Md. Eliash","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3978","SPL-007610","Md. Abu Bakar Siddik","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3979","SPL-007611","Md. Ismail","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3980","SPL-007612","Md. Sabug","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3981","SPL-007613","Md. Kabir","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3982","SPL-007614","Md. Nazrul Islam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3983","SPL-007615","Md. Pervij","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3984","SPL-007616","Rashid","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3985","SPL-007617","Salamat Ali","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3986","SPL-007618","Md. Elias","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3987","SPL-007619","Anowar Hossin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3988","SPL-007620","Mohammad Ali Hossain","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3989","SPL-007621","Md. Ryhan","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3990","SPL-007622","Md. Musa","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3991","SPL-007623","Md. Jahidul Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3992","SPL-007624","Ali Mea","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3993","SPL-007625","Md. Norul Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3994","SPL-007626","Hanif Meah","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3995","SPL-007627","Md. Omar Farooq","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3996","SPL-007628","Md. Abdul Sukkur","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3997","SPL-007629","Mohammad Salim","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3998","SPL-007630","Mohamed Saha Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("3999","SPL-007631","Md. Mufizur Rahman","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4000","SPL-007632","Foejul Islam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4001","SPL-007633","Md. Mizanur Rahman","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4002","SPL-007634","Mohammad Jahangir Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4003","SPL-007635","Mohammed Hosain","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4004","SPL-007636","Rahul Das","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4005","SPL-007637","Titu Das","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4006","SPL-007638","Balal","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4007","SPL-007639","Md. Mosiafigur Rahman","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4008","SPL-007640","Zakim Ahmed","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4009","SPL-007641","Jantu Das","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4010","SPL-007642","Salahuddin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4011","SPL-007643","Mohammed Rashedul Hoque","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4012","SPL-007644","Raju Mia","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4013","SPL-007645","Md. Faruk","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4014","SPL-007646","Md. Rasel","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4015","SPL-007647","Md. Bacchu","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4016","SPL-007648","Md. Makshud Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4017","SPL-007649","Md. Jaman Uddin","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4018","SPL-007650","Md. Auwal","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4019","SPL-007651","Md. Abdur Rashid","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4020","SPL-007652","Zahangir Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4021","SPL-007653","Md. Jahangir Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4022","SPL-007654","Md. Musa","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4023","SPL-007655","Sahid Ullah","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4024","SPL-007656","Md. Nur Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4025","SPL-007657","Md. Elias","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4026","SPL-007658","Sahab Uddin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4027","SPL-007659","Nurul Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4028","SPL-007660","Mohammed Ilias","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4029","SPL-007661","Zamir Uddin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4030","SPL-007662","Md. Gias Uddin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4031","SPL-007663","Md. Manjurul Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4032","SPL-007664","Md. Shajahan","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4033","SPL-007665","Mohammad Belal Uddin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4034","SPL-007666","Md. Munsur Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4035","SPL-007667","Jahangir Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4036","SPL-007668","Md. Saiful","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4037","SPL-007669","Md. Mamun Sikder","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4038","SPL-007670","Babul","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4039","SPL-007671","Md. Abdul Kuddus","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4040","SPL-007672","Md. Yasin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4041","SPL-007673","Harunur Rosid","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4042","SPL-007674","Md. Selim","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4043","SPL-007675","Md. Rasal","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4044","SPL-007676","Md. Badsah","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4045","SPL-007677","Md. Mojibur Rahman","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4046","SPL-007678","Md. Nur Alam","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4047","SPL-007679","Md. Abul Hossain","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4048","SPL-007680","Md. Abdul Halim","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4049","SPL-007681","Md. Liton","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4050","SPL-007682","Md. Helal Uddin","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4051","SPL-007683","Md. Aiyob Ali","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4052","SPL-007684","Abul Kasem","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4053","SPL-007685","Md. Hosan","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4054","SPL-007686","Md. Repon","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4055","SPL-007687","Md. Ala Uddin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4056","SPL-007688","Fayez Ahamed","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4057","SPL-007689","Md. Bellal","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4058","SPL-007690","Md. Monchur","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4059","SPL-007691","Mosharaf Ali","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4060","SPL-007692","Md. Jahirul Islam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4061","SPL-007693","Md. Abdul Hai","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4062","SPL-007694","Rabiul Alam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4063","SPL-007695","Sala Uddin","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4064","SPL-007696","Md. Anam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4065","SPL-007697","Nur Hossain","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4066","SPL-007698","Md. Abdur Rohim","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4067","SPL-007699","Md. Bosir Uddin","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4068","SPL-007700","Ruhul Amin","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4069","SPL-007701","Md. Ali Jabed","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4070","SPL-007702","Jahangir Alam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4071","SPL-007703","Md. Masud","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4072","SPL-007704","Jafar Ahmed","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4073","SPL-007705","Md. Jahangir Alam","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4074","SPL-007706","Mohammad Forkan","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4075","SPL-007707","Md. Ibrahim Khalil","Saif Powertec Ltd.","SPOT","CCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4076","SPL-007708","Md Hasibur Rahman","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4077","SPL-007709","Md Abul Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4078","SPL-007710","Md Masum Kazi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4079","SPL-007711","Md Rezaul Islam","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4080","SPL-007712","Md Ripon Mia","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4081","SPL-007713","Rubel Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4082","SPL-007714","Md Ashraf Faruk","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4083","SPL-007715","Md Shahin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4084","SPL-007716","Md Mahabul Haque","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4085","SPL-007717","Md Najmul Hossen","Saif Powertec Ltd.","Battery","Store","Assistant","");
INSERT INTO inv_employee VALUES("4086","SPL-007718","Md Sharif Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4087","SPL-007719","Tareq Hasan","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4088","SPL-007720","Md Touhidul Alam","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4089","SPL-007721","Md. Mahedi Hasan","Saif Powertec Ltd.","Sub Station","Operation","Trainee Engineer","");
INSERT INTO inv_employee VALUES("4090","SPL-007722","Md. Shefatuzzaman","Saif Powertec Ltd.","Sub Station","Operation","Junior Engineer","");
INSERT INTO inv_employee VALUES("4091","SPL-007723","Kazi Md Masud Rana","Saif Powertec Ltd.","SPOT","Operation","Door Closer","");
INSERT INTO inv_employee VALUES("4092","SPL-007724","Md Rijon Hossain","Saif Powertec Ltd.","SPOT","Operation","Peon","");
INSERT INTO inv_employee VALUES("4093","SPL-007725","Md Showkat Alam Talukder","Saif Powertec Ltd.","Battery","Sales Operation","Senior Manager","");
INSERT INTO inv_employee VALUES("4094","SPL-007726","Md Asad","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("4095","SPL-007727","Md Monwar Hossain","Saif Powertec Ltd.","Battery","Service And WSS","Executive","");
INSERT INTO inv_employee VALUES("4096","SPL-007728","Delour Hasan Sayed","Saif Powertec Ltd.","Battery","Service And WSS","Executive","");
INSERT INTO inv_employee VALUES("4097","SPL-007729","Atiqur Rahman Bhuiyan","Saif Powertec Ltd.","Corporate","IT","Executive","");
INSERT INTO inv_employee VALUES("4098","SPL-007730","Md. Nurullah","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4099","SPL-007731","Md. Abdul Khaleque","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4100","SPL-007732","Md. Shahidullah","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4101","SPL-007733","Asim Kumar Gupta","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4102","SPL-007734","Md. Abdul Hai","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4103","SPL-007735","Md. Kamal Uddin","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4104","SPL-007736","Md. Abul Hoshom","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4105","SPL-007737","Md. Mamtaz Ali","Saif Powertec Ltd.","SPOT","NCT Lasher","Lasher","");
INSERT INTO inv_employee VALUES("4106","SPL-007738","Md. Ayub Hossen","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("4107","SPL-007739","Md Nazrul Islam","Saif Powertec Ltd.","SPOT","Delivery","Delivery Supervisor","");
INSERT INTO inv_employee VALUES("4108","SPL-007740","Shubrato Chandra","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4109","SPL-007741","Azad Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4110","SPL-007742","Masum Kha","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4111","SPL-007743","Md. Abdur Rahman Robin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4112","SPL-007744","Md Nazmul Haque","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4113","SPL-007745","Kawsar Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4114","SPL-007746","Md Shahinur Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4115","SPL-007747","Md Ariful Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4116","SPL-007748","Aniket Chowdhury","Saif Powertec Ltd.","CTED-CTG","Maintenance","Semi Mechanic","");
INSERT INTO inv_employee VALUES("4117","SPL-007749","Md Nur Uddin","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("4118","SPL-007750","Sundi Emon Boyragi","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4119","SPL-007751","Md Shohel Miah","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("4120","SPL-007752","Moinul Bari Tushar","Saif Powertec Ltd.","Corporate","Operation","Manager","");
INSERT INTO inv_employee VALUES("4121","SPL-007753","Md. Jowel Hossen","Saif Powertec Ltd.","Battery","Service And WSS","Officer","");
INSERT INTO inv_employee VALUES("4122","SPL-007754","Md. Ziauddin","Saif Powertec Ltd.","SPOT","NCT Yard","Empty Area Checker","");
INSERT INTO inv_employee VALUES("4123","SPL-007755","Md. Sala Uddin","Saif Powertec Ltd.","SPOT","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("4124","SPL-007756","Md. Shimul Hossan Molla","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("4125","SPL-007757","Md. Mariful Islam","Saif Powertec Ltd.","Battery","Service And WSS","Officer","");
INSERT INTO inv_employee VALUES("4126","SPL-007758","Md. Shahadat Hossain","Saif Powertec Ltd.","Battery","Finance And Accounts","Senior Manager","");
INSERT INTO inv_employee VALUES("4127","SPL-007759","Shahad Boyn","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4128","SPL-007760","Md. Mukul Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4129","SPL-007761","Towhid Miah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4130","SPL-007762","Md. Mojahid Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4131","SPL-007763","Md. Najim Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4132","SPL-007764","Tanvir Ahmed","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4133","SPL-007765","Md. Shagor Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4134","SPL-007766","Md Shafiqul Islam","Saif Powertec Ltd.","Battery","Administration","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("4135","SPL-007767","Sonya Akter Rima","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4136","SPL-007768","Md. Akash Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4137","SPL-007769","Md. Kamrul Hasan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4138","SPL-007770","Shahidul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4139","SPL-007771","Md. Ripon Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4140","SPL-007772","Akram Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4141","SPL-007773","Shuvro Das","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4142","SPL-007774","Khandaker Tanzin Ahmed","Saif Powertec Ltd.","Battery","Service And WSS","Trainee Officer","");
INSERT INTO inv_employee VALUES("4143","SPL-007775","Md Mahbubul Alam","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4144","SPL-007776","Shakaet Ullah","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("4145","SPL-007777","Md Ashrafuzzaman Ripon","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4146","SPL-007778","Mohammad Motaher Hossain","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4147","SPL-007779","Md Mahfuz Alam","Saif Powertec Ltd.","Battery","Service And WSS","Senior Officer","");
INSERT INTO inv_employee VALUES("4148","SPL-007780","Md Morad Shaikh","Saif Powertec Ltd.","Corporate","Administration","Assistant Carpenter","");
INSERT INTO inv_employee VALUES("4149","SPL-007781","Asif Bhuya","Saif Powertec Ltd.","Battery","Quality Assurance","Executive","");
INSERT INTO inv_employee VALUES("4150","SPL-007782","Jannatul Ferdose Flora","Saif Powertec Ltd.","Battery","Purchase And Procurement","Executive","");
INSERT INTO inv_employee VALUES("4151","SPL-007783","Loman Munshi","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("4152","SPL-007784","Sheikh Kabir Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4153","SPL-007785","Murshida Khanam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4154","SPL-007786","Md Robiul Awal ","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4155","SPL-007787","Zahirul Islam","Saif Powertec Ltd.","Corporate","Enterprise Resource Planning","Senior Manager","");
INSERT INTO inv_employee VALUES("4156","SPL-007788","Md Mizanur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("4157","SPL-007789","Md Raihan Ali Sorkar","Saif Powertec Ltd.","Battery","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("4158","SPL-007790","Md Saiful Islam","Saif Powertec Ltd.","Battery","Maintenance","Officer","");
INSERT INTO inv_employee VALUES("4159","SPL-007791","Md Mizanur Rahman","Saif Powertec Ltd.","Battery","Maintenance","Senior Officer","");
INSERT INTO inv_employee VALUES("4160","SPL-007792","Arif Mahmud","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4161","SPL-007793","Md Monir Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4162","SPL-007794","Md Arif","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4163","SPL-007795","Md Shanto Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4164","SPL-007796","Sumaiya Akter Bithi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4165","SPL-007797","Ujjal Halder","Saif Powertec Ltd.","Corporate","IT","Officer","");
INSERT INTO inv_employee VALUES("4166","SPL-007798","Md Aminul Islam","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("4167","SPL-007799","Abdul Hye Alhadi","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4168","SPL-007800","Md Mohashin Ali","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4169","SPL-007801","Riazul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4170","SPL-007802","Shake Rasel","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4171","SPL-007803","Abdu Aziz  Molla","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4172","SPL-007804","Minhaj  Bhuiyan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4173","SPL-007805","Mahamudul  Hasan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4174","SPL-007806","Ronich Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4175","SPL-007807","Tariful Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4176","SPL-007808","Md Rubel","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4177","SPL-007809","Md Ashik Babu","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4178","SPL-007810","Saidul Reja Juel","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4179","SPL-007811","Sumon","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4180","SPL-007812","Mosa Mola","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("4181","SPL-007813","Md Mamun Sharker","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4182","SPL-007814","Saiful Hasan","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("4183","SPL-007815","Swapan Mazumder","Saif Powertec Ltd.","SPOT","Ship Planning","Tracer","");
INSERT INTO inv_employee VALUES("4184","SPL-007816","Md. Belal Hossain Miah","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("4185","SPL-007817","Md Hazrat Ali","Saif Powertec Ltd.","SPOT","Finance And Accounts","Deputy Manager","");
INSERT INTO inv_employee VALUES("4186","SPL-007818","Mithun Sen Gupta","Saif Powertec Ltd.","CTED-CTG","QGC Maintanence","Trainee Engineer","");
INSERT INTO inv_employee VALUES("4187","SPL-007819","Raesh Sheik","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4188","SPL-007820","Mohimenul  Islam","Saif Powertec Ltd.","Corporate","QMS","Trainee Officer","");
INSERT INTO inv_employee VALUES("4189","SPL-007821","Showmmya  Sarathi  Chowdhury","Saif Powertec Ltd.","SPOT","Administration","Trainee Officer","");
INSERT INTO inv_employee VALUES("4190","SPL-007822","Md Mahmudul Hasan","Saif Powertec Ltd.","Corporate","Human Resource Management","Officer","");
INSERT INTO inv_employee VALUES("4191","SPL-007823","Hasan Shikder","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("4192","SPL-007824","Bhuiya Saiful Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4193","SPL-007825","Shemul Bapary","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4194","SPL-007826","Riajul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4195","SPL-007827","Mohammad Easud Mia","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("4196","SPL-007828","Md Sorowar","Saif Powertec Ltd.","Corporate","Administration","Security Officer","");
INSERT INTO inv_employee VALUES("4197","SPL-007829","Md Al Amin","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4198","SPL-007830","Masum Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4199","SPL-007831","Arafat Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4200","SPL-007832","Md Razu Ahmed","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4201","SPL-007833","Md Riaz Miah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4202","SPL-007834","Abu Bakkar","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4203","SPL-007835","Oasman Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4204","SPL-007836","Roni Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4205","SPL-007837","Md Salauddin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4206","SPL-007838","Md Nurul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4207","SPL-007839","Md Delowar Hossen","Saif Powertec Ltd.","SPOT","Administration","Security Officer","");
INSERT INTO inv_employee VALUES("4208","SPL-007840","Md Rahim Uddin","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("4209","SPL-007841","Md Tomizul Islam","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("4210","SPL-007842","Md Raihan Shorif","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4211","SPL-007843","Turki Molla","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4212","SPL-007844","Md Abu Hanif","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4213","SPL-007845","Md Shahajan Bhuyan","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Junior Technician","");
INSERT INTO inv_employee VALUES("4214","SPL-007846","Md Jasim","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Assistant Foreman","");
INSERT INTO inv_employee VALUES("4215","SPL-007847","Md lsmail Hossain Munjur Bhuiya","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Junior Technician","");
INSERT INTO inv_employee VALUES("4216","SPL-007848","Rony Ahmed","Saif Powertec Ltd.","SPOT","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("4217","SPL-007849","Md Abu Taher","Saif Powertec Ltd.","SPOT","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("4218","SPL-007850","Md Johurul Islam Shahin","Saif Powertec Ltd.","SPOT","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("4219","SPL-007851","Md Mustakim Mia","Saif Powertec Ltd.","Corporate","Administration","Technician","");
INSERT INTO inv_employee VALUES("4220","SPL-007852","Md Hossain Bapary","Saif Powertec Ltd.","Corporate","Administration","Auto Technician","");
INSERT INTO inv_employee VALUES("4221","SPL-007853","Md Khokan Shikdar","Saif Powertec Ltd.","Ignite Workshop","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("4222","SPL-007854","Md Arif","Saif Powertec Ltd.","Ignite Workshop","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("4223","SPL-007855","Sobuj Shikder","Saif Powertec Ltd.","Ignite Workshop","Service","Technician","");
INSERT INTO inv_employee VALUES("4224","SPL-007856","Md Hasan Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4225","SPL-007857","Robel Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4226","SPL-007858","Md Anisur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4227","SPL-007859","Ariful Sheikh","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4228","SPL-007860","Md Zamrul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4229","SPL-007861","Md Ebrahim Kazi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4230","SPL-007862","Md Azizul Shaikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4231","SPL-007863","Md Mizanur Rahman","Saif Powertec Ltd.","SPOT","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4232","SPL-007864","Arun Jodder","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Service Engineer","");
INSERT INTO inv_employee VALUES("4233","SPL-007865","Antor Chandra Das","Saif Powertec Ltd.","Ignite Workshop","Service","Technician","");
INSERT INTO inv_employee VALUES("4234","SPL-007866","Ashraf Hossain","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("4235","SPL-007867","Md Rubel Mia","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("4236","SPL-007868","Md. Alauddin","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4237","SPL-007869","Md. Riazul Islam","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("4238","SPL-007870","Md Shahadat Hossain","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("4239","SPL-007871","Hridoy Mia","Saif Powertec Ltd.","Battery","Administration","Cook Helper","");
INSERT INTO inv_employee VALUES("4240","SPL-007872","Shahariar Hossain","Saif Powertec Ltd.","Battery","Charging","Deputy Manager","");
INSERT INTO inv_employee VALUES("4241","SPL-007873","Md Salah Uddin Abbasi","Saif Powertec Ltd.","Business Development","Business Development","Manager","");
INSERT INTO inv_employee VALUES("4242","SPL-007874","Md Saiful Islam","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("4243","SPL-007875","Jasim Uddin","Saif Powertec Ltd.","SPOT","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4244","SPL-007876","Md Akter Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4245","SPL-007877","Md Juwel","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4246","SPL-007878","Md Uzzal Khan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4247","SPL-007879","Mamun Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4248","SPL-007880","Md Enamul Kabir","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4249","SPL-007881","Md Raj Sheikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4250","SPL-007882","Abdul Jabbr","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4251","SPL-007883","Arifin  Khan","Saif Powertec Ltd.","Corporate","Human Resource Management","Officer","");
INSERT INTO inv_employee VALUES("4252","SPL-007884","Md Jahidul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Assistant Manager","");
INSERT INTO inv_employee VALUES("4253","SPL-007885","Md Munna Amin","Saif Powertec Ltd.","SPOT","Administration","Technician","");
INSERT INTO inv_employee VALUES("4254","SPL-007886","Md Shariful Islam","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("4255","SPL-007887","Apu Das","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("4256","SPL-007888","Md Masud Rana","Saif Powertec Ltd.","SPOT","Administration","Peon","");
INSERT INTO inv_employee VALUES("4257","SPL-007889","Md Motiur Rahman","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("4258","SPL-007890","Lelin Roy","Saif Powertec Ltd.","Corporate","Administration","Electrician","");
INSERT INTO inv_employee VALUES("4259","SPL-007891","Easin Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4260","SPL-007892","Masudur Rahaman","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4261","SPL-007893","Md Shohel Rana","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4262","SPL-007894","Md Mizanur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4263","SPL-007895","Shaon Islam Shohel","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4264","SPL-007896","Md Shohidul Islam Mridha","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4265","SPL-007897","Mahfuz Ahmed","Saif Powertec Ltd.","Battery","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("4266","SPL-007898","Md Efthaer Bhuiyan","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("4267","SPL-007899","Md Jobayer Hossain Khan","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4268","SPL-007900","Md Mahfojul Hassin","Saif Powertec Ltd.","SPOT","Operation","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4269","SPL-007901","Md Shihabul Hasan","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4270","SPL-007902","Rimon khan","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4271","SPL-007903","Shihabul Hasan","Saif Powertec Ltd.","SPOT","QGC","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4272","SPL-007904","Shamim","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4273","SPL-007905","Md Tuhin Hossain","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4274","SPL-007906"," Md Tipu Sultan","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4275","SPL-007907","Md Robiul Islam","Saif Powertec Ltd.","SPOT","Operation","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4276","SPL-007908","Md Rashadul Islam","Saif Powertec Ltd.","SPOT","QGC","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4277","SPL-007909","Md Mahmud Hasan","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4278","SPL-007910","Md Kazi Kamrul Hassan","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("4279","SPL-007911","Md Kaisar Uddin Kasfi","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("4280","SPL-007912","Md Shahjahan Chy","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("4281","SPL-007913","Md Nahim Shahria","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("4282","SPL-007914","Md Mozibur Rahman","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("4283","SPL-007915","Md Monsor Alam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("4284","SPL-007916"," Md Abdur Rahman Robin","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Junior Engineer","");
INSERT INTO inv_employee VALUES("4285","SPL-007917","Raju Majumder","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("4286","SPL-007918","Bimal Chakma","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("4287","SPL-007919","Avishek Chowdhury","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("4288","SPL-007920","Md Jahir Uddin","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("4289","SPL-007921"," Nur Mohammed","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("4290","SPL-007922"," Md Rashedul Islam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("4291","SPL-007923","Ibrahim Khalil","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Senior Mechanic","");
INSERT INTO inv_employee VALUES("4292","SPL-007924","Md Jahangir Alam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("4293","SPL-007925","Md Nuralam","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("4294","SPL-007926"," Sri Prieolal  Chondro Sarkar","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("4295","SPL-007927","Mohammad Romjan Ali","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("4296","SPL-007928","Sujan Shaikh","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("4297","SPL-007929","Subodh Kumer Voumik","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("4298","SPL-007930","Md Mamaun","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("4299","SPL-007931","Abdul Aziz","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("4300","SPL-007932","Md Abdullah Mamun","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("4301","SPL-007933","Md Nahim Uddin","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("4302","SPL-007934","Md Sirazul Islam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("4303","SPL-007935","Md Jahidul Islam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("4304","SPL-007936","Akter Hossain","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("4305","SPL-007937","Shantha Chandra Das","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("4306","SPL-007938","Md Sazzad Hossain","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Junior Engineer","");
INSERT INTO inv_employee VALUES("4307","SPL-007939","Md Kamal","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("4308","SPL-007940","Ashok Barua","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("4309","SPL-007941","Md Sumon Molla","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4310","SPL-007942","Md Mohasin Ali","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4311","SPL-007943","Md Jibon Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4312","SPL-007944","Md Manik Alam","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4313","SPL-007945","Md Babul Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4314","SPL-007946"," Md Shahid Sarker","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4315","SPL-007947"," Md Bukhari Sheikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4316","SPL-007948","Abdul Aziz Tuhin","Saif Powertec Ltd.","Corporate","Legal","Officer","");
INSERT INTO inv_employee VALUES("4317","SPL-007949","Md Sajibor Rahman","Saif Powertec Ltd.","Ignite Workshop","Service","Junior Technician","");
INSERT INTO inv_employee VALUES("4318","SPL-007950","Razia Sultana Neela","Saif Powertec Ltd.","Corporate","Administration","Front Desk Officer","");
INSERT INTO inv_employee VALUES("4319","SPL-007951","Sinthia Rahman Nisha","Saif Powertec Ltd.","Corporate","Administration","Senior Officer","");
INSERT INTO inv_employee VALUES("4320","SPL-007952","Abu Naim","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("4321","SPL-007953","Md Al Amin Hosein","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("4322","SPL-007954","Istiaque Ahamed","Saif Powertec Ltd.","Battery","Sales And Marketing","Area Manager","");
INSERT INTO inv_employee VALUES("4323","SPL-007955","Md Mahfuzer Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("4324","SPL-007956","Sakib Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4325","SPL-007957","Md Raijul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4326","SPL-007958","Md Mofizur Rahman","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4327","SPL-007959","Monayem Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4328","SPL-007960","Rasel Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4329","SPL-007961","Abu Nasim","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4330","SPL-007962","Sirajum Muneer","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4331","SPL-007963","Md Al Amin","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("4332","SPL-007964","Didar Hossain","Saif Powertec Ltd.","SPOT","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("4333","SPL-007965","Sharfaraz Ali Haider","Saif Powertec Ltd.","SPOT","Administration","Officer","");
INSERT INTO inv_employee VALUES("4334","SPL-007966","A Rahman","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4335","SPL-007967","Subrata Halder","Saif Powertec Ltd.","SPOT","IT","Officer","");
INSERT INTO inv_employee VALUES("4336","SPL-007968","Tanjina Biswas","Saif Powertec Ltd.","Corporate","Administration","Officer","");
INSERT INTO inv_employee VALUES("4337","SPL-007969","Delowar Hossain","Saif Powertec Ltd.","Corporate","Commercial","Executive Director","");
INSERT INTO inv_employee VALUES("4338","SPL-007970","Md Jubaer Ahmed Tushar","Saif Powertec Ltd.","Ignite Workshop","Service","Officer","");
INSERT INTO inv_employee VALUES("4339","SPL-007971","Md Shah Alam","Saif Powertec Ltd.","SPOT","Terminal Operation","Executive","");
INSERT INTO inv_employee VALUES("4340","SPL-007972","Md Khurshed Alam","Saif Powertec Ltd.","SPOT","Administration","Senior Officer","");
INSERT INTO inv_employee VALUES("4341","SPL-007973","Jonayed","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("4342","SPL-007974","Md Ajijul Haque","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("4343","SPL-007975","Yasin Mollik","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("4344","SPL-007976","Md Emam Hasan Sagor","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("4345","SPL-007977","Omar Faroque","Saif Powertec Ltd.","SPOT","Administration","Executive","");
INSERT INTO inv_employee VALUES("4346","SPL-007978","Maruf Hossain","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("4347","SPL-007979","Md Rakib Hossin","Saif Powertec Ltd.","Energy Business","Administration","Driver","");
INSERT INTO inv_employee VALUES("4348","SPL-007980","Md Joynal","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4349","SPL-007981","Md Yousuf Nobi","Saif Powertec Ltd.","Sub Station","Administration","Driver","");
INSERT INTO inv_employee VALUES("4350","SPL-007982","Mollick Enamul Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4351","SPL-007983","Ibrahim Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4352","SPL-007984","Md Rafiqul Islam Mintu","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4353","SPL-007985","Syed Nirob Ali","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4354","SPL-007986","Khairul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4355","SPL-007987","Md Shoreful Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4356","SPL-007988","Akash Parr","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4357","SPL-007989","Md Kashem Shaikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4358","SPL-007990","Md Meher Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4359","SPL-007991","Sheikh Golam Rasul","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4360","SPL-007992","Md Firoz Alam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4361","SPL-007993","Md Emam Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4362","SPL-007994","Md Mahabbat Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4363","SPL-007995","Md Rasel Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4364","SPL-007996","Md Nazmul Kabir","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4365","SPL-007997","Tareq","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4366","SPL-007998","Md Abdus Salam Milon","Saif Powertec Ltd.","Ignite Workshop","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("4367","SPL-007999","Md Al Amin Shikder","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("4368","SPL-008000","Md Zakir Hossain","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("4369","SPL-008001","Md Liton","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4370","SPL-008002","Md Parvez Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4371","SPL-008003","Md Rasel Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4372","SPL-008004","Kamrul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4373","SPL-008005","Asasan Habib","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4374","SPL-008006","Md Sobur Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4375","SPL-008007","Md Tobur Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4376","SPL-008008","Kamal Uddin","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4377","SPL-008009","Md Yeasin Ali","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4378","SPL-008010","Md Zalal Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4379","SPL-008011","Alamin","Saif Powertec Ltd.","Corporate","Administration","Cook","");
INSERT INTO inv_employee VALUES("4380","SPL-008012","Farhana Moinul Nishi","Saif Powertec Ltd.","Corporate","Human Resource Management","Officer","");
INSERT INTO inv_employee VALUES("4381","SPL-008013","Sumaiya Rahman Ratri","Saif Powertec Ltd.","Corporate","Customer Care","Officer","");
INSERT INTO inv_employee VALUES("4382","SPL-008014","Mostafa Nur Masud","Saif Powertec Ltd.","SPOT","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("4383","SPL-008015","Md Rakib Talukder","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4384","SPL-008016","Md Alamin Sheikh","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4385","SPL-008017","Ali Hasan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4386","SPL-008018","Bayjid Molla","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4387","SPL-008019","Md Faruk Hosan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4388","SPL-008020","Md Raihan Sikder","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4389","SPL-008021","Md Wazid Hera","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4390","SPL-008022","Md Zaber Ahmed","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4391","SPL-008023","Md Kamrul Hasan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4392","SPL-008024","Md Zahedul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4393","SPL-008025","Md Rajib Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4394","SPL-008026","Rasel Molla","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4395","SPL-008027","Rabbi Nur Hasan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4396","SPL-008028","Md Ibrahim Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4397","SPL-008029","Md Anamul Hosen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4398","SPL-008030","Md Al Amin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4399","SPL-008031","Moin Uddin","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4400","SPL-008032","Md Sagor Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4401","SPL-008033","Md Badsha Ali","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4402","SPL-008034","Md Shamim Hawlader","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4403","SPL-008035","Md Didar Hosen","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4404","SPL-008036","Md Rajib","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4405","SPL-008037","Md Rahen Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4406","SPL-008038","Md Shakil Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4407","SPL-008039","Md Hridoy Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4408","SPL-008040","Md Tarikul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4409","SPL-008041","Md Arman Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4410","SPL-008042","Raj Mathiyas Purification","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4411","SPL-008043","Md Shamim Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4412","SPL-008044","Sajit Robi Dash","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("4413","SPL-008045","Anisur Rahaman","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4414","SPL-008046","Jubel Meena","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4415","SPL-008047","Md Rajib","Saif Powertec Ltd.","Ignite Workshop","Service","Junior Technician","");
INSERT INTO inv_employee VALUES("4416","SPL-008048","Md Tanvir Ahmed","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4417","SPL-008049","Md Helal Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4418","SPL-008050","Lalu Biswas","Saif Powertec Ltd.","SPOT","CTMS","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4419","SPL-008051","Sumon Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4420","SPL-008052","Sumon Kumar Biswas","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4421","SPL-008053","Pranto Kumar Sarma","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4422","SPL-008054","Mohammed Jobayer Hosen","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4423","SPL-008055","Md Younus","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("4424","SPL-008056","Hossain Imam Chowdhury","Saif Powertec Ltd.","Corporate","Administration","Manager","");
INSERT INTO inv_employee VALUES("4425","SPL-008057","Shahnawaz Hossain Ahmed","Saif Powertec Ltd.","Business Development","Business Development","Manager","");
INSERT INTO inv_employee VALUES("4426","SPL-008058","Nur Hossain","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("4427","SPL-008059","Md Alamgir Hossain","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4428","SPL-008060","Md Anwar Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4429","SPL-008061","Md Arif Hossain","Saif Powertec Ltd.","SPOT","Administration","Officer","");
INSERT INTO inv_employee VALUES("4430","SPL-008062","Md lmdadul Haque","Saif Powertec Ltd.","SPOT","Ship Planning","Yard Checker","");
INSERT INTO inv_employee VALUES("4431","SPL-008063","Shoekat Hossain","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4432","SPL-008064","Md Riajul Islam","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4433","SPL-008065","Md Samiul Islam","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4434","SPL-008066","Md Sobuj Hossan","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4435","SPL-008067","Md Shohag Shaikh","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4436","SPL-008068","Ekramul Islam","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4437","SPL-008069","Md Enamul Moral","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4438","SPL-008070","Md Kamal Hossin","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4439","SPL-008071","Mamun Rana","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4440","SPL-008072","Abul Hasnat","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4441","SPL-008073","Md Javed Hossain","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4442","SPL-008074","Mohammad Shajjad Alam","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4443","SPL-008075","Md Wazed Alam","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4444","SPL-008076"," Md Hasan Murad","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4445","SPL-008077"," Iqbal Hasan","Saif Powertec Ltd.","SPOT","CTMS","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4446","SPL-008078","Uzzal Kabiraj","Saif Powertec Ltd.","Renewable Energy","Operation","Site Engineer","");
INSERT INTO inv_employee VALUES("4447","SPL-008079","Sabak Burua","Saif Powertec Ltd.","Ignite Workshop","Service","Junior Technician","");
INSERT INTO inv_employee VALUES("4448","SPL-008080","Md Ruhul Amin","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4449","SPL-008081","Kabir Hossain","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("4450","SPL-008082","Sukanto Biswas","Saif Powertec Ltd.","Battery","Sales And Marketing","Area Manager","");
INSERT INTO inv_employee VALUES("4451","SPL-008083","Md Rabiul Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4452","SPL-008084","Azad Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4453","SPL-008085","Shohan Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4454","SPL-008086","Md Obaydullah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4455","SPL-008087","Mehedi Hasan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4456","SPL-008088","Dalen Tripura","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4457","SPL-008089","Howlader Mostakim","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4458","SPL-008090","Saimum Hasan Shanto","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4459","SPL-008091","Md Oliullah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4460","SPL-008092","Md Al Amin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4461","SPL-008093","Ariful Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4462","SPL-008094","Md Abdul Kader","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4463","SPL-008095","Md Moklesur Rahaman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4464","SPL-008096","Md Anowar Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4465","SPL-008097","Md Imran","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4466","SPL-008098","Md Emran","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4467","SPL-008099","Md Raju Shorif","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4468","SPL-008100","Antor Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4469","SPL-008101","Sowrab Majumder","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4470","SPL-008102","Md Tanjimul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4471","SPL-008103","Md. Nezam Uddin Rakib","Saif Powertec Ltd.","CTED-CTG","Administration","Peon","");
INSERT INTO inv_employee VALUES("4472","SPL-008104","Md Muzammel Hosen","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4473","SPL-008105","Md Yasin","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("4474","SPL-008106","Amal Kumar Nath","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4475","SPL-008107","Md Shablu Mia","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("4476","SPL-008108","Mintu Sheikh","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4477","SPL-008109","Md Sajlb Hasan","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4478","SPL-008110","Md Jahangir Hossain","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4479","SPL-008111","Md Rafiul Islam Ridoy","Saif Powertec Ltd.","Battery","Charging","Officer","");
INSERT INTO inv_employee VALUES("4480","SPL-008112","Md Salauddin","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("4481","SPL-008113","Md Samiuzzaman","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Junior Technician","");
INSERT INTO inv_employee VALUES("4482","SPL-008114","Md Abdul Hamid","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("4483","SPL-008115","Tutul Khan","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4484","SPL-008116","Dulal Roy","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4485","SPL-008117","Md Saiful Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4486","SPL-008118","Nur Mohammed Tuhin","Saif Powertec Ltd.","Battery","Service And WSS","Senior Officer","");
INSERT INTO inv_employee VALUES("4487","SPL-008119","Belal Hossen","Saif Powertec Ltd.","Battery","Service And WSS","Helper","");
INSERT INTO inv_employee VALUES("4488","SPL-008120","Md Mohin Uddin","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("4489","SPL-008121","Sabbir Khan Juwel","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4490","SPL-008122","Tofayel Ahmed","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("4491","SPL-008123","Shidul Hasan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4492","SPL-008124","Ziaur Rahaman","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4493","SPL-008125","Md Rasel Molla","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4494","SPL-008126","Mollik Shohel","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4495","SPL-008127","Rajip Hasan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4496","SPL-008128","Mohammed Tafiqul Islam","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("4497","SPL-008129","Md Shamim Reza","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4498","SPL-008130","Md Alauddin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4499","SPL-008131","Mohammad Rezaul Karim","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4500","SPL-008132","Al Amin Sarker","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4501","SPL-008133","Md Shahin Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4502","SPL-008134","Md Shamim Ahmod","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4503","SPL-008135","Md Mofazzel Hossin","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4504","SPL-008136","Md Mucha Akon","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4505","SPL-008137","Md Naimul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4506","SPL-008138","Abdul Mamun","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4507","SPL-008139","Md Kamal Sheikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4508","SPL-008140","Md Ashik Ali","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("4509","SPL-008141","Habibur Rahaman","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("4510","SPL-008142","Md Rofiqul Islam","Saif Powertec Ltd.","Corporate","Commercial","Security Officer","");
INSERT INTO inv_employee VALUES("4511","SPL-008143","Md Nurul Islam","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4512","SPL-008144","Monoronjon Sarder","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4513","SPL-008145","Sheikh Asraful Alam","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("4514","SPL-008146","Shamol Rozario","Saif Powertec Ltd.","Battery","Administration","Cook","");
INSERT INTO inv_employee VALUES("4515","SPL-008147","Md Tanver Hossin","Saif Powertec Ltd.","Battery","Service And WSS","Officer","");
INSERT INTO inv_employee VALUES("4516","SPL-008148","Md Sohag","Saif Powertec Ltd.","Battery","Service And WSS","Junior Technician","");
INSERT INTO inv_employee VALUES("4517","SPL-008149","Abdul Hamid","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4518","SPL-008150","Rakib Hasan","Saif Powertec Ltd.","SPOT","Terminal Operation","Peon","");
INSERT INTO inv_employee VALUES("4519","SPL-008151","Md Shajjad Alam","Saif Powertec Ltd.","SPOT","Delivery","Peon","");
INSERT INTO inv_employee VALUES("4520","SPL-008152","Md Ismail","Saif Powertec Ltd.","SPOT","Administration","Cook","");
INSERT INTO inv_employee VALUES("4521","SPL-008153","Anarul","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("4522","SPL-008154","Md Kamal Hossain","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("4523","SPL-008155","Suman","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("4524","SPL-008156","Md Abu Taleb","Saif Powertec Ltd.","Ignite Workshop","Service","Technician","");
INSERT INTO inv_employee VALUES("4525","SPL-008157","Md Arif","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("4526","SPL-008158","Md Mahabur Molla","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("4527","SPL-008159","Md Monir Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4528","SPL-008160","Md lmran Sikder","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4529","SPL-008161","Md Lutas","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4530","SPL-008162","Rezaul Islam Miraj","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4531","SPL-008163","Md Altaf Hossain Khan","Saif Powertec Ltd.","Business Development","Business Development","Director","");
INSERT INTO inv_employee VALUES("4532","SPL-008164","Md Rakib Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4533","SPL-008165","Sakil Howlader","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4534","SPL-008166","Md Jahidul Islam Sowan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4535","SPL-008167"," Md Tareq","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4536","SPL-008168","Md Sakil Ahmed","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4537","SPL-008169","Md Mahbur Hossan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4538","SPL-008170","Md Bulbul Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4539","SPL-008171","Md Zanu Mia","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4540","SPL-008172","Md Tanbin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4541","SPL-008173","Ayon Sarker Santo","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4542","SPL-008174","Md Humayun Kabir","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4543","SPL-008175","Monirujaman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4544","SPL-008176","Tamjidur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4545","SPL-008177","Mahamud Hasan Suzan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4546","SPL-008178","Md Maznu Pramanik","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4547","SPL-008179","Md Hafizul Sarker","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4548","SPL-008180","Rayagual Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4549","SPL-008181","Palash Chandra Dey","Saif Powertec Ltd.","Business Development","Business Development","Assistant Manager","");
INSERT INTO inv_employee VALUES("4550","SPL-008182","Md Liakot Ali Ripon","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("4551","SPL-008183","Md Rizon","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4552","SPL-008184","Khairul Anwar Chowdhury","Saif Powertec Ltd.","SPOT","Human Resource Management","Manager","");
INSERT INTO inv_employee VALUES("4553","SPL-008185","Md Eamdadul Haque","Saif Powertec Ltd.","Battery","Service And WSS","Executive","");
INSERT INTO inv_employee VALUES("4554","SPL-008186","Md Sohel Rana","Saif Powertec Ltd.","Battery","Service And WSS","Executive","");
INSERT INTO inv_employee VALUES("4555","SPL-008187","Md Riaz","Saif Powertec Ltd.","Ignite Workshop","Service","Junior Technician","");
INSERT INTO inv_employee VALUES("4556","SPL-008188","Md Masum Billah","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4557","SPL-008189","Mahummad Mainul Islam","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("4558","SPL-008190","Mohammad Abdul Mannan","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("4559","SPL-008191","Eskander Alam","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("4560","SPL-008192","Md Sayful Islam","Saif Powertec Ltd.","SPOT","Administration","Door Closer","");
INSERT INTO inv_employee VALUES("4561","SPL-008193","Md A Malek","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("4562","SPL-008194","Md Arman Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4563","SPL-008195","Santo Sarkar","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4564","SPL-008196","Faisal Gazi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4565","SPL-008197","Md Golam Kadir","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4566","SPL-008198","Md Habibullah Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4567","SPL-008199","Md Mehedi Hasan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4568","SPL-008200","Mohammad Sadeq","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4569","SPL-008201","Md Rashed Uddin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4570","SPL-008202","Salman Ali","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4571","SPL-008203","Minhas Uddin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4572","SPL-008204","Md Samir Khan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4573","SPL-008205","Tuhin Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4574","SPL-008206","Rasel Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4575","SPL-008207","Md Shahadat Hosen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4576","SPL-008208","Md Solaiman Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4577","SPL-008209","Sree Proshanto Biswas","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4578","SPL-008210","Rakib Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4579","SPL-008211","Shahin Molla","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4580","SPL-008212","Shuvo Ranjan Tripura","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4581","SPL-008213","Md Jahedul","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4582","SPL-008214","Md Rahman Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4583","SPL-008215","Md Hasanur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4584","SPL-008216","Md Rashedul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4585","SPL-008217","Mohammad Kafil Uddin","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("4586","SPL-008218","Md Aslam Hossain","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("4587","SPL-008219","Md Rasel Mia","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("4588","SPL-008220","Md Mahfuzur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Deputy General Manager","");
INSERT INTO inv_employee VALUES("4589","SPL-008221","Md Jahid Hasan","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4590","SPL-008222","Md Alamgir Dewan","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4591","SPL-008223","Md Mosaraf Hossein","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4592","SPL-008224","Mohammad Salim Uddin Chowdhury","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4593","SPL-008225","Md Balal Hossain","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Technician","");
INSERT INTO inv_employee VALUES("4594","SPL-008226","Md Jahid Hassan","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4595","SPL-008227","Md Aminul Islam Shahin","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4596","SPL-008228","Md Fajlul Karim Bepari","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4597","SPL-008229","Md Sonju Miah","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4598","SPL-008230","Md Masud Rana","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4599","SPL-008231","Dolan Das Dilip","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("4600","SPL-008232","Md Jakaria Moni","Saif Powertec Ltd.","SPOT","Operation","Checker","");
INSERT INTO inv_employee VALUES("4601","SPL-008233","Mizanur Rahman","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","SAE","");
INSERT INTO inv_employee VALUES("4602","SPL-008234","Md Mujibur Rahman Helal","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4603","SPL-008235","Dulal Mia","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4604","SPL-008236","Md Sohel Jamodder","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4605","SPL-008237","Al Mamun","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4606","SPL-008238","Bishwajit Mistry","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4607","SPL-008239","Imran Howlader","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Technician","");
INSERT INTO inv_employee VALUES("4608","SPL-008240","Md Tofazzal Hossan","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4609","SPL-008241","Anowara Hossain","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4610","SPL-008242","Md Zahurul Islam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Branch Manager","");
INSERT INTO inv_employee VALUES("4611","SPL-008243","Md Aminul Islam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4612","SPL-008244","Md Arif Billha","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4613","SPL-008245","Md Aminul Islam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Divisional Manager","");
INSERT INTO inv_employee VALUES("4614","SPL-008246","Ashiqul Islam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Technician","");
INSERT INTO inv_employee VALUES("4615","SPL-008247","Al Amin","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4616","SPL-008248","Nuruddin","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Technician","");
INSERT INTO inv_employee VALUES("4617","SPL-008249","Md Ashraful Islam","Saif Powertec Ltd.","Renewable Energy","Operation","Supervisor","");
INSERT INTO inv_employee VALUES("4618","SPL-008250","Md Tajul Islam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4619","SPL-008251","Shyamal Kuamar Mondal","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4620","SPL-008252","Gobinda Boirage","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4621","SPL-008253","Md Nazrul Islam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4622","SPL-008254","Biplob Kumar Dhar","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Branch Manager","");
INSERT INTO inv_employee VALUES("4623","SPL-008255","Md Alamgir Kabir","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Technician","");
INSERT INTO inv_employee VALUES("4624","SPL-008256","Md Motasim Billah","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4625","SPL-008257","Nur Mohammad","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4626","SPL-008258","Sabuj Sutradhor","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4627","SPL-008259","Md Alauddin","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4628","SPL-008260","Mubarok Mia","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Technician","");
INSERT INTO inv_employee VALUES("4629","SPL-008261","Shawkat Hasan Jony","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Technician","");
INSERT INTO inv_employee VALUES("4630","SPL-008262","Md Shafiqul Islam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Technician","");
INSERT INTO inv_employee VALUES("4631","SPL-008263","Muhmmad Nacher Uddin Ahmad","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4632","SPL-008264","Abdul Malek","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Technician","");
INSERT INTO inv_employee VALUES("4633","SPL-008265","Md Habibur Rahman","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4634","SPL-008266","Md Alal Hossain","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","BG-CO","");
INSERT INTO inv_employee VALUES("4635","SPL-008267","Md Alamin Mondol","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Technician","");
INSERT INTO inv_employee VALUES("4636","SPL-008268","Md Aeounis Ali","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4637","SPL-008269","Md Khairul Islam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4638","SPL-008270","Md Firoz Hossain","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4639","SPL-008271","Golam Mostofa","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4640","SPL-008272","Md Rasel Hossain","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4641","SPL-008273","Md Limon Miah","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4642","SPL-008274","Md Morshaduzaman","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4643","SPL-008275","Md Azmot Talukdar","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4644","SPL-008276","Md Nazrul Islam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Project In-charge","");
INSERT INTO inv_employee VALUES("4645","SPL-008277","Ashish Mallik","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4646","SPL-008278","Md Mahabub Alam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Auditor","");
INSERT INTO inv_employee VALUES("4647","SPL-008279","Md Mokhlesur Rahman","Saif Powertec Ltd.","Renewable Energy","Operation","Supervisor","");
INSERT INTO inv_employee VALUES("4648","SPL-008280","Md Kaykokbad","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Auditor","");
INSERT INTO inv_employee VALUES("4649","SPL-008281","Md Abdus Samad","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Auditor","");
INSERT INTO inv_employee VALUES("4650","SPL-008282","Md Jamirul Islam","Saif Powertec Ltd.","Renewable Energy","Kabikha Project","Field Assistant","");
INSERT INTO inv_employee VALUES("4651","SPL-008283","Md Saiful Islam","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("4652","SPL-008284","Md Jamal","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("4653","SPL-008285","Md Shahadat Hossain","Saif Powertec Ltd.","Battery","Sales And Marketing","Area Manager","");
INSERT INTO inv_employee VALUES("4654","SPL-008286","Shawkat Ali Choudhury","Saif Powertec Ltd.","Business Development","Business Development","Executive Director","");
INSERT INTO inv_employee VALUES("4655","SPL-008287","Md Yousuf Iqbal Chowdhury","Saif Powertec Ltd.","Business Development","Business Development","Executive Director","");
INSERT INTO inv_employee VALUES("4656","SPL-008288","Md Rabin Sheikh","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("4657","SPL-008289","Md Zahid Hassan Pavel","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("4658","SPL-008290","Md Manik","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4659","SPL-008291","Md Mahbub Alam","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4660","SPL-008292","Md Alamgir Dewan","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4661","SPL-008293","Md Shafiqul Islam","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4662","SPL-008294","Vijoy Khoradi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4663","SPL-008295","Md Sumon Mollah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4664","SPL-008296","Md Seim","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4665","SPL-008297","Md Asad Babu","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4666","SPL-008298","Md Asadul Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4667","SPL-008299","Md Ashik Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4668","SPL-008300","Md Lemon","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4669","SPL-008301","Baizid","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4670","SPL-008302","Sajib","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4671","SPL-008303","Rahadul Mollah","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4672","SPL-008304","Md Mostafa Morol","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4673","SPL-008305","Joynal Abedin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4674","SPL-008306","Dhurbo Kumar Mondal","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4675","SPL-008307","Md Mahfuj Kazi","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4676","SPL-008308","Sojib Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4677","SPL-008309","Sakibul Hasan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4678","SPL-008310","Alam Hossin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4679","SPL-008311","Md Jony Ahmad","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4680","SPL-008312","Zibon Madber","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("4681","SPL-008313","Md Ashik Ali","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("4682","SPL-008314","Md Mehedi Hasan","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4683","SPL-008315","Rony Das","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4684","SPL-008316","Md Shaidul Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4685","SPL-008317","Md Rubel Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4686","SPL-008318","Delowar Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4687","SPL-008319","Md Safiqul Islam","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4688","SPL-008320","Md Emon Hossen","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4689","SPL-008321","Md Sujan Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4690","SPL-008322","Aminur Rahman Khan","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4691","SPL-008323","Md Sobuj Ahamed","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4692","SPL-008324","Khairul Islam","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4693","SPL-008325","Hasimur Rahman","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4694","SPL-008326","Sujoy Kumar","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4695","SPL-008327","Md lmran Hossain","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4696","SPL-008328","Md Enamul Haquea","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4697","SPL-008329","Raihan Hossain","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4698","SPL-008330","Md Momin Molla","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4699","SPL-008331","Md Abdur Rahman","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4700","SPL-008332","Alamin Gazi","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4701","SPL-008333","Narayan Chandra Das","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4702","SPL-008334","Yeasin Khan","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4703","SPL-008335","Mohammad Masud Saheed","Saif Powertec Ltd.","Corporate","Administration","Executive Director","");
INSERT INTO inv_employee VALUES("4704","SPL-008340","Md Mozibur Rahman","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("4705","SPL-008341","Md Mizanur Rahman","Saif Powertec Ltd.","SPOT","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4706","SPL-008342","Al Amin Babo","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4707","SPL-008343","Nadim","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4708","SPL-008344","Md Sabbir Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4709","SPL-008345","Khan Mahmud  Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4710","SPL-008346","Kawser","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4711","SPL-008347","Raju Ahmed","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4712","SPL-008348","Ali Azam Rashed","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4713","SPL-008349","Md Salim Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4714","SPL-008350","Md Mafijul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4715","SPL-008351","Aksadul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4716","SPL-008352","Md Noman Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4717","SPL-008353","Shahin Sardar","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4718","SPL-008354","Md Saiful Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4719","SPL-008355","Md Samim Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4720","SPL-008356","Md Rabbi Kazi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4721","SPL-008357","Momin Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4722","SPL-008358","Md Arif","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4723","SPL-008359","Saharia Ahmed Roni","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4724","SPL-008360","Shakil Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4725","SPL-008361","Asaduzzaman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4726","SPL-008362","Hemal Shikder","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4727","SPL-008363","Md Ashraf Hossain Bikash","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4728","SPL-008364","Abdullah Al Mamun","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4729","SPL-008365","Md Ferozul  Islam","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("4730","SPL-008366","Md Ariful Islam","Saif Powertec Ltd.","Sub Station","Operation","Junior Technician","");
INSERT INTO inv_employee VALUES("4731","SPL-008367","Afjal Hossain Opu","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("4732","SPL-008368","Md Jahidur Rahaman","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("4733","SPL-008369","Anichur Rahman Shimul ","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4734","SPL-008370","Nazim Uddin ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4735","SPL-008371","Md Ibrahim ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4736","SPL-008372","Md Jihad Mondal ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4737","SPL-008373","Md Kawsar Hossain ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4738","SPL-008374","Md Kawsar Fakir","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4739","SPL-008375","Md Mahbubur Rahman ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4740","SPL-008376","Md Monir Hossain ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4741","SPL-008377","Md Riyad Sheikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4742","SPL-008378","Md Sabuj","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4743","SPL-008379","Md Shakhawat Hossain Mukul ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4744","SPL-008380","Md Zakaria","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4745","SPL-008381","Musa Ahmed Khan","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4746","SPL-008382","Md Rubel Raj","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4747","SPL-008383","Sohaibur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4748","SPL-008384","Md. Emam Hossain","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Supervisor","");
INSERT INTO inv_employee VALUES("4749","SPL-008385","Md Kawsar ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4750","SPL-008386","Md Rafiqul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4751","SPL-008387","Md Rayhan Ali ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4752","SPL-008388","Md Shahinur Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4753","SPL-008389","Md Solaiman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4754","SPL-008390","Suxa Mia ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4755","SPL-008391","Shahed Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4756","SPL-008392","Shakowat Hossan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4757","SPL-008393","Md Abul Hasham","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4758","SPL-008394","Abu Nayem","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4759","SPL-008395","Manik Hossan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4760","SPL-008396","Md Evrahim Talukder","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4761","SPL-008397","Md Hanif","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4762","SPL-008398","Md Imran hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4763","SPL-008399","Sk Md. Abu Sufian","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Junior Engineer","");
INSERT INTO inv_employee VALUES("4764","SPL-008400","Md Zahid Molla","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4765","SPL-008401","Naim Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4766","SPL-008402","Nazmul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4767","SPL-008403","Sapon Chandra Biswas","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4768","SPL-008404","Abdur Rahim Papon","Saif Powertec Ltd.","Corporate","Administration","Officer","");
INSERT INTO inv_employee VALUES("4769","SPL-008405","Md Monirul Islam","Saif Powertec Ltd.","Corporate","Enterprise Resource Planning","Manager","");
INSERT INTO inv_employee VALUES("4770","SPL-008406","Abu  Sufean","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("4771","SPL-008409","Md  Abdul Hakim","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("4772","SPL-008410","Md Karim Hawlader","Saif Powertec Ltd.","Battery","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("4773","SPL-008411","Md Minazul Islam","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("4774","SPL-008412","Md Rayhan Hosen","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("4775","SPL-008413","Orun Hasda","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("4776","SPL-008414","Md Hasanur Jaman Foysal","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("4777","SPL-008415","Md Salam howlader","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4778","SPL-008416","Ramzan khan","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4779","SPL-008417","Bepul Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4780","SPL-008418","Md Abul Kalam","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4781","SPL-008419","Md Raju Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4782","SPL-008420","Md Rasel Mia ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4783","SPL-008421","Md Sajol Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4784","SPL-008422","Sojib Bapari","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4785","SPL-008423","Md Sultan Nur Uddin","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4786","SPL-008424","Sohag hossen ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4787","SPL-008425","Md Zakir Hossain","Saif Powertec Ltd.","SPOT","Operation","RST Operator","");
INSERT INTO inv_employee VALUES("4788","SPL-008426","Suzauddin Moni","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("4789","SPL-008427","Mijanur Molla","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("4790","SPL-008428","Shahadat Hossen","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("4791","SPL-008429","Irfan Uddin Ahmed","Saif Powertec Ltd.","Corporate","Human Resource Management","Officer","");
INSERT INTO inv_employee VALUES("4792","SPL-008430","Md Habibur Rahman","Saif Powertec Ltd.","Battery","EHS","Senior Officer","");
INSERT INTO inv_employee VALUES("4793","SPL-008431","Md Hasibul Kobir","Saif Powertec Ltd.","SPOT","Operation","Executive","");
INSERT INTO inv_employee VALUES("4794","SPL-008432","Md Jahidul Islam","Saif Powertec Ltd.","SPOT","Terminal Operation","Executive","");
INSERT INTO inv_employee VALUES("4795","SPL-008433","Md Merin Islam","Saif Powertec Ltd.","SPOT","Operation","Executive","");
INSERT INTO inv_employee VALUES("4796","SPL-008434","Sandip Das","Saif Powertec Ltd.","SPOT","EHS","Executive","");
INSERT INTO inv_employee VALUES("4797","SPL-008435","Nasaruddin","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("4798","SPL-008436","Habib A Rasul Shahin","Saif Powertec Ltd.","SPOT","RMG","RMG Operator","");
INSERT INTO inv_employee VALUES("4799","SPL-008437","Md Faruk Hossin","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("4800","SPL-008438","Md Shariful Islam","Saif Powertec Ltd.","Battery","Service And WSS","Executive","");
INSERT INTO inv_employee VALUES("4801","SPL-008439","Abu Nasim","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4802","SPL-008440","Sheshir Rozario","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("4803","SPL-008441","Md Jakarul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4804","SPL-008442","Monir Hossen","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4805","SPL-008443","Akash Par","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4806","SPL-008444","Aman Uddoula Mojumdar","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4807","SPL-008445","Anamul Hoque","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4808","SPL-008446","Jesayo Rema","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4809","SPL-008447","Md Asif","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4810","SPL-008448","Md Sabuj Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4811","SPL-008449","Md Sajib Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4812","SPL-008450","Md Milon Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4813","SPL-008451","Rashidul Islam","Saif Powertec Ltd.","SPOT","EHS","Executive","");
INSERT INTO inv_employee VALUES("4814","SPL-008452","Md. Waliullah","Saif Powertec Ltd.","Corporate","Project","Officer","");
INSERT INTO inv_employee VALUES("4815","SPL-008453","Md Taiab Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4816","SPL-008454","Md Yusuf","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4817","SPL-008455","Mohammed Arafatul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4818","SPL-008456","Rabbi Nur Hasan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4819","SPL-008457","Shakwhat Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4820","SPL-008458","SK Golam Rasul","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4821","SPL-008459","Sk Yeamin Ridoy","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4822","SPL-008460","Wasim Akram","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4823","SPL-008461","Abdul Bari Shah Imon","Saif Powertec Ltd.","Battery","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("4824","SPL-008462","Md Fardous Mahmud","Saif Powertec Ltd.","Battery","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("4825","SPL-008463","Torikul Molla","Saif Powertec Ltd.","Corporate","Administration","Gardener","");
INSERT INTO inv_employee VALUES("4826","SPL-008464","Md Mahmudul Hasan","Saif Powertec Ltd.","Corporate","Administration","Gardener","");
INSERT INTO inv_employee VALUES("4827","SPL-008465","Md Mahe Alam ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("4828","SPL-008466","Md Ratul Islam","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Junior Engineer","");
INSERT INTO inv_employee VALUES("4829","SPL-008467","Md Mahafijur Rahman","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("4830","SPL-008468","Anik Das","Saif Powertec Ltd.","SPOT","Terminal Operation","Cleaner","");
INSERT INTO inv_employee VALUES("4831","SPL-008469","Md Hasan Mia","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("4832","SPL-008470","Md Faruk","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("4833","SPL-008471","Abdullah Al Mamum","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4834","SPL-008472","Md Abdul Halim","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4835","SPL-008473","Md Azizul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4836","SPL-008474","Md Joynal Hawlader","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4837","SPL-008475","Md Mikail Sheikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4838","SPL-008476","Md Moshiur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4839","SPL-008477","Md Musabbir","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4840","SPL-008478","Md Nayem","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4841","SPL-008479","Md Rashed","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4842","SPL-008480","Md Reajul Haque","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4843","SPL-008481","Md Shakawat Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4844","SPL-008482","Rabbi Sheikh","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4845","SPL-008483","Rana Islam Joy","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4846","SPL-008484","Rashed","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4847","SPL-008485","Rifat","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4848","SPL-008486","Rokon Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4849","SPL-008487","Saymon Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4850","SPL-008488","Md Mahamud Hasan","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("4851","SPL-008489","Md. Zahidul Islam","Saif Powertec Ltd.","Battery","Marketing And Sales- Export And Corporate","Assistant Manager","");
INSERT INTO inv_employee VALUES("4852","SPL-008490","Md. Saddam Hossen","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("4853","SPL-008491","Md Moniruzzaman","Saif Powertec Ltd.","CTED-CTG","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("4854","SPL-008492","Md Kamruzzaman","Saif Powertec Ltd.","CTED-CTG","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("4855","SPL-008493","AKM Rafiqul Haque","Saif Powertec Ltd.","Power and Energy","Operation","Executive Director","");
INSERT INTO inv_employee VALUES("4856","SPL-008494","Mohammed Morshed Alam","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("4857","SPL-008495","Md Aman Ullah","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("4858","SPL-008496","Md Mostakim","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("4859","SPL-008497","Hasmat Ali","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("4860","SPL-008498","Md Abul Khair","Saif Powertec Ltd.","CTED-Dhaka","Mechanical","Deputy Manager","");
INSERT INTO inv_employee VALUES("4861","SPL-008499","Md. Jakir Shak","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Mechanic","");
INSERT INTO inv_employee VALUES("4862","SPL-008500","Md Abu Bakar Akanda","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4863","SPL-008501","Md Azim Uddin","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4864","SPL-008502","Easin Howlater","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("4865","SPL-008503","Md Forhad Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4866","SPL-008504","Md Hasan Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4867","SPL-008505","Md Emran Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4868","SPL-008506","Md Jwel  Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4869","SPL-008507","Md Jwel Howlader","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4870","SPL-008508","Md Kurshid Alam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4871","SPL-008509","Md Masud Rana","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4872","SPL-008510","Nure Alam Siddiki","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4873","SPL-008511","Md Rahat","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4874","SPL-008512","Md Robin Molla","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4875","SPL-008513","Ronich Khan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4876","SPL-008514","Saon Talukder","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4877","SPL-008515","Md Shahadat Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4878","SPL-008516","Md Shakil Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4879","SPL-008517","Md. Zafor Sadeque","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Trainee Engineer","");
INSERT INTO inv_employee VALUES("4880","SPL-008518","Md Mizanur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4881","SPL-008519","Md Nur E Alam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4882","SPL-008520","Md Ashraful Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4883","SPL-008521","Md Rakib Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4884","SPL-008522","Md Sanowar Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4885","SPL-008523","Ryhan Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4886","SPL-008524","Subrata Tripura","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4887","SPL-008525","Md Din Islam Bepary","Saif Powertec Ltd.","Power and Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("4888","SPL-008526","Sajib Khan","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4889","SPL-008527","A Alim","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("4890","SPL-008528","Md Nuruzzaman","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("4891","SPL-008529","Md Ferdaus Khan","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("4892","SPL-008530","Sree Nayan Kumar Das","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("4893","SPL-008531","Nabodip Chandro Ray","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("4894","SPL-008532","Asif Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4895","SPL-008533","Azgor Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4896","SPL-008534","Hasan Sheikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4897","SPL-008535","Hossen Ahmod","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4898","SPL-008536","Md Ayat Khandokar","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4899","SPL-008537","Md Morsed Alam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4900","SPL-008538","Md Shahid  Babu Liyon","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4901","SPL-008539","Md Mahedi Hassan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4902","SPL-008540","Sayed Md Sabbir Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4903","SPL-008541","Md Tarek Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4904","SPL-008542","Md Sakib","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4905","SPL-008543","Md Jubaer Molla","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4906","SPL-008544","Md Mizanur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4907","SPL-008545","Rasel Sharder","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4908","SPL-008546","Aslam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4909","SPL-008547","Md Naimul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4910","SPL-008548","Md Safikul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4911","SPL-008549","Md Gaffar Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4912","SPL-008550","Md. Joynal Abedin","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Semi Mechanic","");
INSERT INTO inv_employee VALUES("4913","SPL-008551","Mohammed Romzan Ali","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("4914","SPL-008552","Md Moniruzzaman","Saif Powertec Ltd.","CTED-CTG","Maintenance","Supervisor","");
INSERT INTO inv_employee VALUES("4915","SPL-008553","Md Kawsar Mahmud","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("4916","SPL-008554","Md Sujon Islam","Saif Powertec Ltd.","Battery","Maintenance","Officer","");
INSERT INTO inv_employee VALUES("4917","SPL-008555","Mohan Chandra Das","Saif Powertec Ltd.","Ignite Workshop","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("4918","SPL-008556","Mohammod  Moshior Rahman","Saif Powertec Ltd.","Battery","Service And WSS","Executive","");
INSERT INTO inv_employee VALUES("4919","SPL-008557","Arifur Rahman Bhuiyan","Saif Powertec Ltd.","SPOT","Delivery","Medical Assistant","");
INSERT INTO inv_employee VALUES("4920","SPL-008558","Md Shajedul Islam","Saif Powertec Ltd.","Business Development","Business Development","Manager","");
INSERT INTO inv_employee VALUES("4921","SPL-008559","Md Mahedi Hasan Rony","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4922","SPL-008560","Kazi Enamul Hak","Saif Powertec Ltd.","SPOT","Operation","Lasher","");
INSERT INTO inv_employee VALUES("4923","SPL-008561","Ahmed Sayed Al Fatah","Saif Powertec Ltd.","Power and Energy","Business Development","Assistant General Manager","");
INSERT INTO inv_employee VALUES("4924","SPL-008562","Md Arifur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4925","SPL-008563","Md Asraful Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4926","SPL-008564","Ayatul  Haq","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4927","SPL-008565","Md Shohel Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4928","SPL-008566","Md Sohel Rana","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4929","SPL-008567","Abdul Aziz Emon","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4930","SPL-008568","Md Jamal Uddin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4931","SPL-008569"," Md Sabbir Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4932","SPL-008570","Abul Kalam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4933","SPL-008571","Kaisar Arafat","Saif Powertec Ltd.","Corporate","Human Resource Management","Senior Officer","");
INSERT INTO inv_employee VALUES("4934","SPL-008572","Md Helal Uddin","Saif Powertec Ltd.","SPOT","Ship Planning","SC Operator","");
INSERT INTO inv_employee VALUES("4935","SPL-008573","Md Imran","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("4936","SPL-008574","Md Kaisar Hosen","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("4937","SPL-008575","Md Mamunur Rashid","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("4938","SPL-008576","Mohammad Sazzad Hossain","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("4939","SPL-008577","Md Tarek Aziz","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("4940","SPL-008578","Md Anisul Haque","Saif Powertec Ltd.","Corporate","IT","Deputy Manager","");
INSERT INTO inv_employee VALUES("4941","SPL-008579","Md Jahangir Alam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Helper","");
INSERT INTO inv_employee VALUES("4942","SPL-008580","Kazi Ashikur Rahaman Ashik","Saif Powertec Ltd.","SPOT","Documentation","Officer","");
INSERT INTO inv_employee VALUES("4943","SPL-008581","Md Helal Uddin","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("4944","SPL-008582","Md Rimon Sharker","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("4945","SPL-008583","Syed Sabbir Ahmmed","Saif Powertec Ltd.","SPOT","Administration","Peon","");
INSERT INTO inv_employee VALUES("4946","SPL-008584","Md Rasidul  Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4947","SPL-008585","Md  Shakhawat Hossain","Saif Powertec Ltd.","SPOT","Operation","Lasher","");
INSERT INTO inv_employee VALUES("4948","SPL-008586","Zaker Hossan","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4949","SPL-008587","Zaker Hossan","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("4950","SPL-008588","Hriday Roy","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4951","SPL-008589","Md Sajib","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4952","SPL-008590","Md Badsha Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4953","SPL-008591","Md Mitul Miya","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4954","SPL-008592","Md Samsher Alam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4955","SPL-008593","Md Saddam Hosen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4956","SPL-008594","Sanjidul Islam","Saif Powertec Ltd.","SPOT","Documentation","Officer","");
INSERT INTO inv_employee VALUES("4957","SPL-008595","Nuruzzaman Khan","Saif Powertec Ltd.","Renewable Energy","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("4958","SPL-008596","Md. Shohidul Islam","Saif Powertec Ltd.","Renewable Energy","Operation","Senior Manager","");
INSERT INTO inv_employee VALUES("4959","SPL-008597","Muhammad Rakib Hasan","Saif Powertec Ltd.","Renewable Energy","Sales And Marketing","Deputy General Manager","");
INSERT INTO inv_employee VALUES("4960","SPL-008598","Md Mehedi Hasan","Saif Powertec Ltd.","Renewable Energy","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("4961","SPL-008599","Md. Habibur Rahman","Saif Powertec Ltd.","Renewable Energy","Sales And Marketing","Deputy Manager","");
INSERT INTO inv_employee VALUES("4962","SPL-008600","Sajal Kumar Biswas","Saif Powertec Ltd.","Renewable Energy","Service And Maintanance","Senior Manager","");
INSERT INTO inv_employee VALUES("4963","SPL-008601","Md Fotiq Miah","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4964","SPL-008602","Shohel Bin Hoque","Saif Powertec Ltd.","Business Development","Oil and Gas","General Manager","");
INSERT INTO inv_employee VALUES("4965","SPL-008603","Rubel Ahmed","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("4966","SPL-008604","Maznunur Rahman","Saif Powertec Ltd.","Corporate","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("4967","SPL-008605","Maznunur Rahman","Saif Powertec Ltd.","Corporate","Finance And Accounts","Senior Officer","");
INSERT INTO inv_employee VALUES("4968","SPL-008606","Shahidul Haque","Saif Powertec Ltd.","SPOT","SC","SC Operator","");
INSERT INTO inv_employee VALUES("4969","SPL-008607","Md Golam Rasul","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("4970","SPL-008608","Mustak Ahamad Mahsin","Saif Powertec Ltd.","Battery","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("4971","SPL-008609","Naeem Mia ","Saif Powertec Ltd.","SPOT","Operation","Lasher","");
INSERT INTO inv_employee VALUES("4972","SPL-008610","Shamsur Rahman","Saif Powertec Ltd.","SPOT","NCT Yard","Supervisor","");
INSERT INTO inv_employee VALUES("4973","SPL-008611","Md Emon Hossen","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("4974","SPL-008612","Md. Morshed Hossen Shuvo","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("4975","SPL-008613","Faridul Islam","Saif Powertec Ltd.","SPOT","Operation","Supervisor","");
INSERT INTO inv_employee VALUES("4976","SPL-008614","Anarul","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("4977","SPL-008615","Tanzina Hoque","Saif Powertec Ltd.","Renewable Energy","Finance And Accounts","Deputy General Manager","");
INSERT INTO inv_employee VALUES("4978","SPL-008616","Md Selim Islam","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("4979","SPL-008617","Md Anis Molla","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4980","SPL-008618","Md Nizam Uddin","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("4981","SPL-008619","Md Sagar Shieq","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("4982","SPL-008620","Murshid Alam","Saif Powertec Ltd.","Battery","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("4983","SPL-008621","Khondoker Raian Fazlay Alahi","Saif Powertec Ltd.","Corporate","Commercial","Executive","");
INSERT INTO inv_employee VALUES("4984","SPL-008622","Md Jahidul Huq Palash","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("4985","SPL-008623","Md Al Amin","Saif Powertec Ltd.","Sub Station","Administration","Driver","");
INSERT INTO inv_employee VALUES("4986","SPL-008624","Nahidor Rahman","Saif Powertec Ltd.","SPOT","Terminal Operation","Billing Assistant","");
INSERT INTO inv_employee VALUES("4987","SPL-008625","Md Asadullah","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4988","SPL-008626","Hasan Sharif","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4989","SPL-008627","Imran Biswas","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4990","SPL-008628","Md Sahidul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4991","SPL-008629","Shirajul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4992","SPL-008630","Md Tarikul Islam ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("4993","SPL-008631","Hridoy Kumar Karmoker","Saif Powertec Ltd.","Battery","Assembly","Officer","");
INSERT INTO inv_employee VALUES("4994","SPL-008632","Md Shariful Islam Khan ","Saif Powertec Ltd.","SPOT","Administration","Officer","");
INSERT INTO inv_employee VALUES("4995","SPL-008633","Nur Islam Sohel","Saif Powertec Ltd.","SPOT","FLT","FLT Operator","");
INSERT INTO inv_employee VALUES("4996","SPL-008634","Mohammad Shah Alam","Saif Powertec Ltd.","SPOT","RTG","RTG Operator","");
INSERT INTO inv_employee VALUES("4997","SPL-008635","Abu Siddeque ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("4998","SPL-008636","Munne Akhter ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("4999","SPL-008637","Md Saiful ISlam ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5000","SPL-008638","Jakir Mia","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5001","SPL-008639","Golam Mostofa ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5002","SPL-008640","Md Siddik Mia","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5003","SPL-008641","Abdullah Al Mamun","Saif Powertec Ltd.","Corporate","Enterprise Resource Planning","Programmer","");
INSERT INTO inv_employee VALUES("5004","SPL-008642","Firoz Alam ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5005","SPL-008643","Md Hanif ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5006","SPL-008644","Md Sohid Ullah ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5007","SPL-008645","Md Kamal Talukdar ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5008","SPL-008646","Md Suruz Ali","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5009","SPL-008647","Abdur Rahim ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5010","SPL-008648","Adhori Akter","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5011","SPL-008649","Sajeda Begum ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5012","SPL-008650","Hasina Begum ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5013","SPL-008651","Mousumi Akter","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5014","SPL-008652","Md Helal Uddin ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5015","SPL-008653","Asma Khatun ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5016","SPL-008654","Shilpy ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5017","SPL-008655","Bithi Akter ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5018","SPL-008656","Mst Khadija Begum ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5019","SPL-008657","Md Babul Haolader ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5020","SPL-008658","Mst Alema ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5021","SPL-008659","Mojida Begum ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5022","SPL-008660","Lucky Begum ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5023","SPL-008661","Mohin Uddin ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5024","SPL-008662","Shamsul Haq Farazi","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5025","SPL-008663","Abul Hossain ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5026","SPL-008664","Khalilur Rahman ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5027","SPL-008665","Md Liton Mia ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5028","SPL-008666","Md Dulal Mia ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5029","SPL-008667","Md Ranju Mia","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5030","SPL-008668","Mst Jinora ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5031","SPL-008669","Taslima Khatun","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5032","SPL-008670","Sovash Babu ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5033","SPL-008671","Md Tariqul Islam Mazumder ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5034","SPL-008672","Md Abdul Momin ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5035","SPL-008673","Md Aminul Islam ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5036","SPL-008674","Md Delowar Hossain ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5037","SPL-008675","Md Earul Khan ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5038","SPL-008676","Mura Mia","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5039","SPL-008677","Sabbir Hossain Molla","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5040","SPL-008678","Md Satter Miah","Saif Powertec Ltd.","SPOT","Administration","Peon","");
INSERT INTO inv_employee VALUES("5041","SPL-008679","Md Feroj Ahmed","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5042","SPL-008680","Md Mokul Hossain ","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("5043","SPL-008681","Md Mubarak Mia ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5044","SPL-008682","Md Rabbi Hasan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5045","SPL-008683","Md Rezaul karim","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5046","SPL-008684","Md Saiful Islam ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5047","SPL-008685","Md Sayful Sheikh","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5048","SPL-008686","Md Shipon Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5049","SPL-008687","Md Shipon Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5050","SPL-008688","Md Sohan Pk","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5051","SPL-008689","Mehedi Hasan Musa ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5052","SPL-008690","Rokon Mia ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5053","SPL-008691","Rubel ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5054","SPL-008692","Bhola Nath Dey ","Saif Powertec Ltd.","Business Development","Business Development","Advisor","");
INSERT INTO inv_employee VALUES("5055","SPL-008693","Md Elius ","Saif Powertec Ltd.","CTED-CTG","Maintenance","Semi Mechanic","");
INSERT INTO inv_employee VALUES("5056","SPL-008694","Md Sala Uddin ","Saif Powertec Ltd.","CTED-CTG","Maintenance","Semi Mechanic","");
INSERT INTO inv_employee VALUES("5057","SPL-008695","Sk Abdul Farhad","Saif Powertec Ltd.","SPOT","Delivery","Supervisor","");
INSERT INTO inv_employee VALUES("5058","SPL-008696","Md Sagar Shieq","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("5059","SPL-008697","Md Azimul Hayat","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5060","SPL-008698","Md Elius ","Saif Powertec Ltd.","CTED-CTG","Maintenance","Semi Mechanic","");
INSERT INTO inv_employee VALUES("5061","SPL-008699","Md Elias Howlader ","Saif Powertec Ltd.","SPOT","Documentation","Officer","");
INSERT INTO inv_employee VALUES("5062","SPL-008700","Md Elias Mamun ","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5063","SPL-008701","Md Yeasin Rabin ","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("5064","SPL-008702","Mohammed Tanim Khan ","Saif Powertec Ltd.","SPOT","CTMS","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5065","SPL-008703","Md Shah Ali Khan ","Saif Powertec Ltd.","SPOT","Terminal Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5066","SPL-008704","Shawrid Akand ","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5067","SPL-008705","Rajib Chakraborty","Saif Powertec Ltd.","SPOT","NCT Yard","Yard Checker","");
INSERT INTO inv_employee VALUES("5068","SPL-008706","Md Al Imran","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5069","SPL-008707","Md Azad Sheikh","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5070","SPL-008708","Foysal Sarder","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5071","SPL-008709","Md Jahid Hosen","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5072","SPL-008710","Md Masum Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5073","SPL-008711","Md Nur Hossen Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5074","SPL-008712","Md Rakeb Molla","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("5075","SPL-008713","Reaz Shak","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5076","SPL-008714","Md Sabbir Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5077","SPL-008715","Md Saykat Hosen","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5078","SPL-008716","Shahinur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5079","SPL-008717","Md Shamim Reza","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5080","SPL-008718","Md Shohag Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5081","SPL-008719","Md Sofiyar Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5082","SPL-008720","Md Sujan Mia","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5083","SPL-008721","Md Ikramul Islam ","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5084","SPL-008722","Md Anik Fakir ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5085","SPL-008723","Md Anowarul Islam ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5086","SPL-008724","Md Ashraful Islam ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5087","SPL-008725","Muhammad Minar Alam","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5088","SPL-008726","Faisal Sheikh Imdadul ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5089","SPL-008727","Md Habibur Rahman ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5090","SPL-008728","Jahed Talukder ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5091","SPL-008729","Md Mitul Mia ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5092","SPL-008730","Md Nahid Hosen ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5093","SPL-008731","Md Rasel Khan ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5094","SPL-008732","Md Rezaul Korim ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5095","SPL-008733","Md Safaet Jumman ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5096","SPL-008734","Md Saiful Islam ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5097","SPL-008735","Md Yousup","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5098","SPL-008736","Ebadul Madbar","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("5099","SPL-008737","Md Razib ","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("5100","SPL-008738","Md Nazrul Islam ","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("5101","SPL-008739","Md Sontu Ali","Saif Powertec Ltd.","Battery","Gel And VRLA","Technician","");
INSERT INTO inv_employee VALUES("5102","SPL-008740","Nurul Amin","Saif Powertec Ltd.","Battery","Gel And VRLA","Technician","");
INSERT INTO inv_employee VALUES("5103","SPL-008741","Rasel Mia","Saif Powertec Ltd.","Battery","Gel And VRLA","Technician","");
INSERT INTO inv_employee VALUES("5104","SPL-008742","Aktarul Islam","Saif Powertec Ltd.","Battery","Gel And VRLA","Technician","");
INSERT INTO inv_employee VALUES("5105","SPL-008743","Md Sharif Hossain","Saif Powertec Ltd.","Battery","Gel And VRLA","Technician","");
INSERT INTO inv_employee VALUES("5106","SPL-008744","Kawsar Miah","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5107","SPL-008745","Md Biplob Hosen","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5108","SPL-008746","Md Rasel Mia","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5109","SPL-008747","Md Shamim Mia","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5110","SPL-008748","Md Sneha Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5111","SPL-008749","Nemai Chandro Roy","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5112","SPL-008750","Sonaton Chandra Dev Sharma","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5113","SPL-008751","Arafat Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5114","SPL-008752","Md Hadul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5115","SPL-008753","Raju Rana","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5116","SPL-008754","Sowpon Kumar","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5117","SPL-008755","Tanmoy Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5118","SPL-008756","Torun Hasda","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5119","SPL-008757","Yeasin Mia Shimul","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5120","SPL-008758","Md Zobaidur Rahman","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5121","SPL-008759","Md Giashuddin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5122","SPL-008760","Md Jahid","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5123","SPL-008761","Md Musa","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5124","SPL-008762","Md Rafiqul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5125","SPL-008763","Sobuj Mollah","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5126","SPL-008764","Mohammad Faisal Hasan","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Deputy General Manager","");
INSERT INTO inv_employee VALUES("5127","SPL-008765","Dabbroto Kundu","Saif Powertec Ltd.","Battery","Quality Assurance","Officer","");
INSERT INTO inv_employee VALUES("5128","SPL-008766","Md Ariful Islam","Saif Powertec Ltd.","Corporate","QMS","Officer","");
INSERT INTO inv_employee VALUES("5129","SPL-008767","Ashini Sharma","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5130","SPL-008768","Khokon Sarker","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5131","SPL-008769","Sumon","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5132","SPL-008770","Polas Ray","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5133","SPL-008771","Saidul","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5134","SPL-008772","Emon ","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5135","SPL-008773","Md Karim Mia","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5136","SPL-008774","Md Rezaul Karim","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5137","SPL-008775","Md Shahadat Hossin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5138","SPL-008776","Md Shahadat","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5139","SPL-008777","Sabuj Mia ","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("5140","SPL-008778","Bodruddoja","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5141","SPL-008779","Delowar Hossain","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5142","SPL-008780","Md Abul Kasem","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5143","SPL-008781","Md Tarikul Islam Rabbi","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5144","SPL-008782","Md Al- Amin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5145","SPL-008783","Md Aminur Rashid Sizan ","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5146","SPL-008784","Ali Azam Khan","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5147","SPL-008785","Apu Chandra Das","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5148","SPL-008786","Md Jamsed Ali","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5149","SPL-008787","Atul Chandra Roy","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5150","SPL-008788","Md Junayut Karim","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5151","SPL-008789","Md Nahid Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5152","SPL-008790","Md Nannu Mia","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5153","SPL-008791","Ridoy Mia","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5154","SPL-008792","Md Sumon Ali","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5155","SPL-008793","Md Takirul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5156","SPL-008794","Md Tipu Sultan","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5157","SPL-008795","Md Alamin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5158","SPL-008796","Md Enait Hossen","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5159","SPL-008797","Md Liton Ahamed","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5160","SPL-008798","Md Manik Hossain","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5161","SPL-008799","Md Masud Rana","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5162","SPL-008800","Rabbi Hossen","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5163","SPL-008801","Rabbin Seikh","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5164","SPL-008802","Md Nabed Hossen","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5165","SPL-008803","Md Sahin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5166","SPL-008804","Md Tariqul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5167","SPL-008805","Alamgir Hosen","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5168","SPL-008806","Joni Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5169","SPL-008807","Md Al Amin","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5170","SPL-008808","Md Habib Ulla","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5171","SPL-008809","Md Motalib","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5172","SPL-008810","Md Raju Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5173","SPL-008811","Md Sabirul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5174","SPL-008812","Md Tanvir Miah","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5175","SPL-008813","Rakibul Islam","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5176","SPL-008814","Shorif Howlader","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5177","SPL-008815","Md Mizanur Rahman","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5178","SPL-008816","Md Toufiq Ahmed","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5179","SPL-008817","Md Bappi","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5180","SPL-008818","Md Nasir Uddin","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5181","SPL-008819","Md Hafij Uddin","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5182","SPL-008820","Md Reazul Islam","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5183","SPL-008821","Masum Mia","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5184","SPL-008822","Mithun Kumar Das","Saif Powertec Ltd.","Battery","Store","Technician","");
INSERT INTO inv_employee VALUES("5185","SPL-008823","Md Shakhawat Alam","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5186","SPL-008824","Md Sabbir Masud Rayhan","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5187","SPL-008825","Md Yousuf","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5188","SPL-008826","Mishan Sushil","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5189","SPL-008827","Shaymol Chandra Haolader","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("5190","SPL-008828","Shanti Mazumder","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("5191","SPL-008829","Mohammad Mohsin Ali","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5192","SPL-008830","Sherajul Islam","Saif Powertec Ltd.","Battery","Store","Technician","");
INSERT INTO inv_employee VALUES("5193","SPL-008831","Abdur Rahman Bulbul","Saif Powertec Ltd.","Battery","Store","Technician","");
INSERT INTO inv_employee VALUES("5194","SPL-008832","Mohammed Shah Noor","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5195","SPL-008833","Gouranga Chandra Roy","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5196","SPL-008834","Rajib Dey","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Technical Helper","");
INSERT INTO inv_employee VALUES("5197","SPL-008835","Md Al Amin","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5198","SPL-008836","Md Emran Hossen","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5199","SPL-008837","Daren Costa","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("5200","SPL-008838","Md Milon Rana","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5201","SPL-008839","Md Jahirul Islam","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5202","SPL-008840","Jogesh Chandra Das","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("5203","SPL-008841","Md Habib Miah","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("5204","SPL-008842","Md Hossen Mollah","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("5205","SPL-008843","Md Nur Alam","Saif Powertec Ltd.","Battery","Charging","Technician","");
INSERT INTO inv_employee VALUES("5206","SPL-008844","Md Kanchon Ali","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("5207","SPL-008845","Md Mostakin","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("5208","SPL-008846","Md Sujon Ali","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5209","SPL-008847","Md Omar Ali","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5210","SPL-008848","Md Riffat Uddin ","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5211","SPL-008849","Md Wasim Mondol","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5212","SPL-008850","Md Rasel Rana","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5213","SPL-008851","Rupam Chakma","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5214","SPL-008852","Ripon Chandro","Saif Powertec Ltd.","Battery","Assembly","Technician","");
INSERT INTO inv_employee VALUES("5215","SPL-008853","Md Samsul Haq","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("5216","SPL-008854","Md Younus ","Saif Powertec Ltd.","Battery","Administration","Peon","");
INSERT INTO inv_employee VALUES("5217","SPL-008855","Md Yeasin Sarker","Saif Powertec Ltd.","Battery","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5218","SPL-008856","Shaiful Islam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5219","SPL-008857","Md Ariful Islam ","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("5220","SPL-008858","Rasal Howlader","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5221","SPL-008859","Imjath Hossen","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5222","SPL-008860","Md Imran Hossain","Saif Powertec Ltd.","CTED-CTG","Maintenance","Traniee Engineer","");
INSERT INTO inv_employee VALUES("5223","SPL-008861","Md Rokunurzzaman","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5224","SPL-008862","Md Shameen Azad Munna","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5225","SPL-008863","Muhammad Arman Kibria ","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5226","SPL-008864","Muhammad Nurul Alam","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5227","SPL-008865","Sumit Mutsuddy","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5228","SPL-008866","Shoriful Islam","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5229","SPL-008867","Shuvro Chandro","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5230","SPL-008868","Md Ahasan Tarak","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5231","SPL-008869","Md. Faruk","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("5232","SPL-008870","Md Main Uddin Meem","Saif Powertec Ltd.","Business Development","Oil and Gas","Assistant Manager","");
INSERT INTO inv_employee VALUES("5233","SPL-008871","Sohel Lal ","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5234","SPL-008872","Shahin Mahmud","Saif Powertec Ltd.","EHS and Maritime Law","EHS","Executive","");
INSERT INTO inv_employee VALUES("5235","SPL-008873","Nur Mohammad","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("5236","SPL-008874","Shafiqul Islam","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("5237","SPL-008875","Md Shahin Mridha","Saif Powertec Ltd.","SPOT","Administration","Peon","");
INSERT INTO inv_employee VALUES("5238","SPL-008876","Mst Anna Khatun","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5239","SPL-008877","Md Abu Sayed Roni ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5240","SPL-008878","Ahsun Ullah Babu","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5241","SPL-008879","Mohammad Arafatul Islam ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5242","SPL-008880","Md Asad Mia Manu","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5243","SPL-008881","Kajal Sheikh","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5244","SPL-008882","Md Musa Akon ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5245","SPL-008883","Md Nesar Uddin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5246","SPL-008884","Razib Shaikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5247","SPL-008885","Rima Akhter ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5248","SPL-008886","Md Shafiqul Islam Bhuyan ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5249","SPL-008887","Md Sumon Miah ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5250","SPL-008888","Md Ahatasamul","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("5251","SPL-008889","Bazlur Rahman ","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("5252","SPL-008890","Akbor Hossain Sarkar ","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("5253","SPL-008891","Md Habibur Rahman ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5254","SPL-008892","Md Monjur Hossain ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5255","SPL-008893","Firoz Kabir","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5256","SPL-008894","Howlader Mostakim ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5257","SPL-008895","Md Miraj ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5258","SPL-008896","Md Monjur Alam","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("5259","SPL-008897","Md Rezaul Karim ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5260","SPL-008898","Md Saidur Rahman ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5261","SPL-008899","Md Sakibul Hasan ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5262","SPL-008900","Md Shariyatullah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5263","SPL-008901","Md. Shamim Jubair","Saif Powertec Ltd.","SPOT","CTMS","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5264","SPL-008902","Md Nayem Sarker","Saif Powertec Ltd.","SPOT","Terminal Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5265","SPL-008903","Md Sourov Hossain","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("5266","SPL-008904","Rabbi ","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5267","SPL-008905","Md Rakib Hasan","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5268","SPL-008906","Touhid Khan","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5269","SPL-008907","Md Arafat Ali ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5270","SPL-008908","Chan Mia Kazi ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5271","SPL-008909","Md Ahasan Ul Karim ","Saif Powertec Ltd.","Battery","Planning And Coordination","Senior Manager","");
INSERT INTO inv_employee VALUES("5272","SPL-008910","Md Abul Kalam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5273","SPL-008911","Sala Uddin ","Saif Powertec Ltd.","Battery","Service And WSS","Technician","");
INSERT INTO inv_employee VALUES("5274","SPL-008912","Md Shamsuddin ","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("5275","SPL-008913","Ashik Ahmad Jaber","Saif Powertec Ltd.","Battery","Service And WSS","Senior Technician","");
INSERT INTO inv_employee VALUES("5276","SPL-008914","Fakir Fahad ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5277","SPL-008915","Aliza Ibn Azmol ","Saif Powertec Ltd.","Energy and Mineral Resource","Administration","Officer","");
INSERT INTO inv_employee VALUES("5278","SPL-008916","Gias Uddin Molla ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5279","SPL-008917","Md Habibur Rahman ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5280","SPL-008918","Md Mamun ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5281","SPL-008919","Md Mostafizar Rahman ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5282","SPL-008920","Omar Faruk ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5283","SPL-008921","Rasel Hossain ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5284","SPL-008922","Md Shakil Khan ","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5285","SPL-008923","Md Shihab Hossain ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5286","SPL-008924","Md Anikur Rahman ","Saif Powertec Ltd.","CTED-CTG","Administration","Driver","");
INSERT INTO inv_employee VALUES("5287","SPL-008925","Mohammad Hossain Murad ","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("5288","SPL-008926","Md Khorshed Alam ","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("5289","SPL-008927","Rony Bahadur Roy ","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("5290","SPL-008928","Manas Roy","Saif Powertec Ltd.","SPOT","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("5291","SPL-008929","Md. Sakib Uddin","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technician","");
INSERT INTO inv_employee VALUES("5292","SPL-008930","Muhammad Furkan ","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("5293","SPL-008931","Md Jabed","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("5294","SPL-008932","Ali Hayder","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5295","SPL-008933","AI Mamun Farazi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5296","SPL-008934","Md Jasim Uddin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5297","SPL-008935","Md Nahidul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5298","SPL-008936","Md Rasel Hasan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5299","SPL-008937","Md Rashedul Islam Rashed","Saif Powertec Ltd.","SPOT","Finance And Accounts","Assistant Manager","");
INSERT INTO inv_employee VALUES("5300","SPL-008938","Sree Mohesh Biswas","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5301","SPL-008939","Md Yasin Sorkar","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5302","SPL-008940","Nasir Akon","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("5303","SPL-008941","Rabiul Haque","Saif Powertec Ltd.","Battery","Plate Preparation","Technician","");
INSERT INTO inv_employee VALUES("5304","SPL-008942","T.M. Al Sadik","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5305","SPL-008943","Adnan Rafiq","Saif Powertec Ltd.","SPOT","Operation","Officer","");
INSERT INTO inv_employee VALUES("5306","SPL-008944","Abu Hanif Rubel ","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("5307","SPL-008945","Mahamud Hossain","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("5308","SPL-008946","Mamun Hossain","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("5309","SPL-008947","Md Rasel Hossain ","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("5310","SPL-008948","Md Al Amin Hossen","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5311","SPL-008949","S M Shahrior Pervez ","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5312","SPL-008950","Anthony Rozario","Saif Powertec Ltd.","Corporate","Oil and Gas","Cook","");
INSERT INTO inv_employee VALUES("5313","SPL-008951","Fazlur Rahman","Saif Powertec Ltd.","Corporate","Oil and Gas","Cleaner","");
INSERT INTO inv_employee VALUES("5314","SPL-008952","Md Ebrahim ","Saif Powertec Ltd.","Corporate","Oil and Gas","Laundry Man","");
INSERT INTO inv_employee VALUES("5315","SPL-008953","Ashis Filip Biswas","Saif Powertec Ltd.","Corporate","Oil and Gas","Senior Laundry Man","");
INSERT INTO inv_employee VALUES("5316","SPL-008954","Constanstain Panedy","Saif Powertec Ltd.","Corporate","Oil and Gas","Senior Waiter","");
INSERT INTO inv_employee VALUES("5317","SPL-008955","Maruf Ahmed ","Saif Powertec Ltd.","Corporate","Oil and Gas","Waiter","");
INSERT INTO inv_employee VALUES("5318","SPL-008956","Abdul Hannan ","Saif Powertec Ltd.","Corporate","Oil and Gas","Housekeeper","");
INSERT INTO inv_employee VALUES("5319","SPL-008957","Md Monirul Islam ","Saif Powertec Ltd.","Corporate","Oil and Gas","Dish Washer","");
INSERT INTO inv_employee VALUES("5320","SPL-008958","Azimul Haque","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5321","SPL-008959","Md Nazim Mahmud","Saif Powertec Ltd.","Corporate","Oil and Gas","Dish Washer","");
INSERT INTO inv_employee VALUES("5322","SPL-008960","Md Rasel ","Saif Powertec Ltd.","Corporate","Oil and Gas","Head Cook","");
INSERT INTO inv_employee VALUES("5323","SPL-008961","Rony Rogario","Saif Powertec Ltd.","Corporate","Oil and Gas","Cook","");
INSERT INTO inv_employee VALUES("5324","SPL-008962","Shahadat Hossain","Saif Powertec Ltd.","Corporate","Oil and Gas","Housekeeper","");
INSERT INTO inv_employee VALUES("5325","SPL-008963","Md Shahin Alam","Saif Powertec Ltd.","Corporate","Oil and Gas","In-Charge","");
INSERT INTO inv_employee VALUES("5326","SPL-008964","Shahadat Hossen","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Helper","");
INSERT INTO inv_employee VALUES("5327","SPL-008965","Mir Mohammad","Saif Powertec Ltd.","CTED-CTG","Store","Store Officer","");
INSERT INTO inv_employee VALUES("5328","SPL-008966","Md Faruk","Saif Powertec Ltd.","SPOT","Terminal Operation","Driver","");
INSERT INTO inv_employee VALUES("5329","SPL-008967","Razon Chandra Saha","Saif Powertec Ltd.","RILSC","Research and Innovation","General Manager","");
INSERT INTO inv_employee VALUES("5330","SPL-008968","Md Nasir Uddin","Saif Powertec Ltd.","Business Development","Business Development","General Manager","");
INSERT INTO inv_employee VALUES("5331","SPL-008969","Mohammad Rubel","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Lathe Man","");
INSERT INTO inv_employee VALUES("5332","SPL-008970","Md Sajid Kamal","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5333","SPL-008971","Abdul Mannan","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5334","SPL-008972","Md Akibul Hasan Vuiya","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5335","SPL-008973","Md lmran Hossain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5336","SPL-008974","Md Jahedul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5337","SPL-008975","Md Sajib Bapari","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5338","SPL-008976","Md Arif Hossen","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5339","SPL-008977","Md Faizul Islam","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5340","SPL-008978","Md Liton Hossain","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5341","SPL-008979","Md Ridoy Uddin","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5342","SPL-008980","Mohammed Soduj","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5343","SPL-008981","Mohammad Arif","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5344","SPL-008982","Mohammad Nuru Miah","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5345","SPL-008983","Aminul Haque","Saif Powertec Ltd.","SPOT","EHS","Executive","");
INSERT INTO inv_employee VALUES("5346","SPL-008984","Md Nayon Ali","Saif Powertec Ltd.","SPOT","Terminal Operation","Executive","");
INSERT INTO inv_employee VALUES("5347","SPL-008985","Bodruddoja","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5348","SPL-008986","Delowar Hossain","Saif Powertec Ltd.","CTED-CTG","QGC and RTG","Technical Helper","");
INSERT INTO inv_employee VALUES("5349","SPL-008990","Lokman Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5350","SPL-008991","Md. Mohosin Meah","Saif Powertec Ltd.","SPOT","Delivery","Labour Supervisor","");
INSERT INTO inv_employee VALUES("5351","SPL-008992","Md Arifur Rahman","Saif Powertec Ltd.","Corporate","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("5352","SPL-008993","Md Hanif Maze","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5353","SPL-008994","Md Rakib","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5354","SPL-008995","Sayful Boyaty","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5355","SPL-008996","Masud Parvej","Saif Powertec Ltd.","Corporate","Commercial","Manager","");
INSERT INTO inv_employee VALUES("5356","SPL-008997","Sahab Uddin","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("5357","SPL-008998","Khandoker Ibnul Hassan","Saif Powertec Ltd.","Corporate","Human Resource Management","Executive","");
INSERT INTO inv_employee VALUES("5358","SPL-008999","Noman Sikder","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5359","SPL-009000","Tahmibuil Huda Ishraq","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5360","SPL-009001","Md Khairul Islam","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5361","SPL-009002","Moyna","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5362","SPL-009003","Morjina","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5363","SPL-009004","Mohidul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5364","SPL-009005","Shohel Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5365","SPL-009006","Md Abul Hossain","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("5366","SPL-009007","Emon Hossen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5367","SPL-009008","Md Habibur Rahman","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5368","SPL-009009","Md Nayem Hossen","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5369","SPL-009010","Md Motiyar Rahman Chani","Saif Powertec Ltd.","Corporate","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5370","SPL-009011","Md Nayem","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5371","SPL-009012","Md Jewel","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5372","SPL-009013","Boshir Uddin","Saif Powertec Ltd.","SPOT","Operation","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("5373","SPL-009014","Sazzad Parvez","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("5374","SPL-009015","Md Sanoar Hossain","Saif Powertec Ltd.","Corporate","Administration","Helper","");
INSERT INTO inv_employee VALUES("5375","SPL-009016","Shahed Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5376","SPL-009017","Tanvir Ahmed","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5377","SPL-009018","Md Ali Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5378","SPL-009019","Md Sohel Shorder","Saif Powertec Ltd.","Corporate","Administration","Assistant Carpenter","");
INSERT INTO inv_employee VALUES("5379","SPL-009020","Md Al Amin","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5380","SPL-009021","Alhas","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5381","SPL-009022","Bayzid Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5382","SPL-009023","Dharni Mohan Tripura","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5383","SPL-009024","Md Shariful Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5384","SPL-009025","Md Sojib Bapari","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5385","SPL-009026","Md Jamal Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5386","SPL-009027","Md Rasel","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5387","SPL-009028","Md Shohag","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5388","SPL-009029","Shaiket Rahman","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5389","SPL-009030","Rosul Munshi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5390","SPL-009031","Md Samim Rana","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5391","SPL-009032","Md Abu Jafar","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5392","SPL-009033","Md Monir Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5393","SPL-009034","Uzzal Molla","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5394","SPL-009035","Muhammed Shahadat Hosain","Saif Powertec Ltd.","SPOT","Administration","Peon","");
INSERT INTO inv_employee VALUES("5395","SPL-009036","A B M Kamruzzaman ","Saif Powertec Ltd.","Energy and Mineral Resource","Administration","Director","");
INSERT INTO inv_employee VALUES("5396","SPL-009037","Md Shajadul Islam","Saif Powertec Ltd.","Corporate","Oil and Gas","Assistant Cook","");
INSERT INTO inv_employee VALUES("5397","SPL-009038","Md Mukul Sheikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5398","SPL-009039","Md Hasibul","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5399","SPL-009040","Rostom Kazi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5400","SPL-009041","Md Tanjimul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5401","SPL-009042","Barkot Biswas","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5402","SPL-009043","Md Yousuf Matubaq","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5403","SPL-009044","Md Alomgir Mia","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("5404","SPL-009045","Md Tajul Islam","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5405","SPL-009046","Shahadat Hossain","Saif Powertec Ltd.","Sub Station","Switch Gear","Helper","");
INSERT INTO inv_employee VALUES("5406","SPL-009047","Md Mamun Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5407","SPL-009048","Md Riaz Sarder","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5408","SPL-009049","Md Emon ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5409","SPL-009050","Asif Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5410","SPL-009051","Md Jihad Mondol","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5411","SPL-009052","Minhajul Abedin ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5412","SPL-009053","Md Salam Bepari","Saif Powertec Ltd.","Ignite Workshop","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("5413","SPL-009054","Md Sahin Musulli ","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("5414","SPL-009055","Md. Mohosin Meah","Saif Powertec Ltd.","SPOT","Delivery","Labour Supervisor","");
INSERT INTO inv_employee VALUES("5415","SPL-009056","Sk Abdul Farhad","Saif Powertec Ltd.","SPOT","Delivery","Supervisor","");
INSERT INTO inv_employee VALUES("5416","SPL-009057","Md Marjul Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5417","SPL-009058","Hasna Hana","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5418","SPL-009059","Md Azizul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5419","SPL-009060","Ashraf Hossain","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5420","SPL-009061","Md Golam Kibriya","Saif Powertec Ltd.","Power and Energy","Sales And Marketing","Senior Application Engineer","");
INSERT INTO inv_employee VALUES("5421","SPL-009062","Md Nuru Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5422","SPL-009063","Ibrahim Khalil","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5423","SPL-009064","Nur Mohammad Nuru","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("5424","SPL-009065","Md Musabbir","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5425","SPL-009066","Md Reayad Prodhan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5426","SPL-009067","Raju Khan","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5427","SPL-009068","Nizamuddin Mahmood Hossain","Saif Powertec Ltd.","Corporate","Business Development","Director","");
INSERT INTO inv_employee VALUES("5428","SPL-009069","Afroza Ahmed ","Saif Powertec Ltd.","Corporate","Human Resource Management","Assistant Manager","");
INSERT INTO inv_employee VALUES("5429","SPL-009070","Mohammad Abu Ashraf","Saif Powertec Ltd.","Business Development","Business Development","Advisor","");
INSERT INTO inv_employee VALUES("5430","SPL-009071","Md. Abu Hanifa","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5431","SPL-009072","Ashutosh Mondol","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5432","SPL-009073","Joni Hossain","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5433","SPL-009074","Md Istiak Ahmed Akib","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5434","SPL-009075","Md Rasel Ahmed","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5435","SPL-009076","Md. Rezaul Karim","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5436","SPL-009077","Md Sajib Biswas","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5437","SPL-009078","Md. Sobuj Hossin","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5438","SPL-009079","Provat Das","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5439","SPL-009080","Muhammad Sanowar Hussain","Saif Powertec Ltd.","Business Development","Business Development","Head of Administration","");
INSERT INTO inv_employee VALUES("5440","SPL-009081","Razon Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5441","SPL-009082","SK Shaharia Hossain","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5442","SPL-009083","Md. Ijaja Ahamad","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5443","SPL-009084","Md Shamim","Saif Powertec Ltd.","SPOT","Operation","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("5444","SPL-009085","Md Munna Hasan","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5445","SPL-009086","Md Shahin","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("5446","SPL-009087","Md Akash Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5447","SPL-009088","Md Nasir Uddin","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("5448","SPL-009089","Md A Kader","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5449","SPL-009090","Md Nobir Kazi","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5450","SPL-009091","Md Abdul Malak Shaikh","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("5451","SPL-009092","Md Salim Mandal","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5452","SPL-009093","Md. Munna Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5453","SPL-009094","Abul Kashem","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5454","SPL-009095","Md Shamem","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5455","SPL-009096","Md Salim Mandal","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5456","SPL-009097","Abdul Noman","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5457","SPL-009098","Md Imran Hossain","Saif Powertec Ltd.","EHS and Maritime Law","EHS","Medical Assistant","");
INSERT INTO inv_employee VALUES("5458","SPL-009099","Md. Pias Hosen","Saif Powertec Ltd.","SPOT","CCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5459","SPL-009100","Mehedi Hasan Hridoy","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5460","SPL-009101","Saidul Islam","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5461","SPL-009102","Sanjoy Das","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5462","SPL-009103","Sheikh kamruzzaman Prince","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5463","SPL-009104","Md.Rasel Molla","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5464","SPL-009105","Md Imran Mia","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5465","SPL-009106","Md Rahamatullah","Saif Powertec Ltd.","CTED-Dhaka","Maintenance","Senior Technician","");
INSERT INTO inv_employee VALUES("5466","SPL-009107","Noman","Saif Powertec Ltd.","CTED-CTG","Maintenance","Manager","");
INSERT INTO inv_employee VALUES("5467","SPL-009108","Imran Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5468","SPL-009109","Md Asadul Islam","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("5469","SPL-009110","Md Razib","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("5470","SPL-009111","Md Rasel Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5471","SPL-009112","Naim Sarder","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5472","SPL-009113","Md Noyan Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5473","SPL-009114","Babor Sarder","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5474","SPL-009115","Hasib Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5475","SPL-009116","Md Hridy Alam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5476","SPL-009117","S M Lavlu Mia","Saif Powertec Ltd.","SPOT","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("5477","SPL-009118","Md Sagor Ali","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5478","SPL-009119","Md Tuhin Sarkar","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5479","SPL-009120","Md Osman Gani","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("5480","SPL-009121","Foyjullah Mollah","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5481","SPL-009122","Asiqur Rahman","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5482","SPL-009123","Abrar Bin Altaf","Saif Powertec Ltd.","RILSC","Research and Innovation","Officer","");
INSERT INTO inv_employee VALUES("5483","SPL-009124","Md Rakib Talukder","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5484","SPL-009125","Aman Ullah Patan","Saif Powertec Ltd.","Battery","Administration","Fork Lift Operator","");
INSERT INTO inv_employee VALUES("5485","SPL-009126","Nure Alom","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5486","SPL-009127","Md Sohel Rana","Saif Powertec Ltd.","CTED-CTG","Maintenance","Driver","");
INSERT INTO inv_employee VALUES("5487","SPL-009128","Md Alamin Sheikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5488","SPL-009129","Md saddam Hossen Mullah","Saif Powertec Ltd.","SPOT","Documentation","Officer","");
INSERT INTO inv_employee VALUES("5489","SPL-009130","Md Shajib Kha","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5490","SPL-009131","Akash Kumar Datta","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5491","SPL-009132","Imamul Hasan ","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5492","SPL-009133","Amanullah","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5493","SPL-009134","Md Rumon Hossain","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5494","SPL-009135","Shuvrodev Das","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5495","SPL-009136","Md Sazzad Hossen","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5496","SPL-009137","Anna Begum","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5497","SPL-009138","Roksana","Saif Powertec Ltd.","SPOT","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5498","SPL-009139","Lutfor Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5499","SPL-009140","Md Hasnain","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5500","SPL-009141","Zahid Pard","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5501","SPL-009142","MD Rotan Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5502","SPL-009143","Md Anowar Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5503","SPL-009144","Muhammad Abdul Karim","Saif Powertec Ltd.","SPOT","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("5504","SPL-009145","Md Jakir Hossain","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5505","SPL-009146","MD Mehedi Hasan","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("5506","SPL-009147","Kazi Boni yamin","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5507","SPL-009148","Md Sakil Uddin","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("5508","SPL-009149","MD Babul Sarkar","Saif Powertec Ltd.","Battery","Administration","Admin Assistant","");
INSERT INTO inv_employee VALUES("5509","SPL-009150","Md. Abdul Jalil","Saif Powertec Ltd.","Battery","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("5510","SPL-009151","Md Rafiqul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("5511","SPL-009152","Md Saiful","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("5512","SPL-009153","Nahid parvez","Saif Powertec Ltd.","SPOT","Operation","Yard Checker","");
INSERT INTO inv_employee VALUES("5513","SPL-009154","Md Amirul Islam","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5514","SPL-009155","Mst Mahmuda Akter","Saif Powertec Ltd.","Corporate","Administration","Manager","");
INSERT INTO inv_employee VALUES("5515","SPL-009156","Imamul Islam","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5516","SPL-009157","Md Nur Nabi Raid","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5517","SPL-009158","Abu Jafor","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5518","SPL-009159","Hannan Hossain","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5519","SPL-009160","Mohammad Hridoy","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5520","SPL-009161","Md Tarek Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5521","SPL-009162","Aslam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5522","SPL-009163","Md Jahidul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5523","SPL-009164","Md Abu Bakar Siddiq","Saif Powertec Ltd.","CTED-CTG","PM and FLT","Engineer","");
INSERT INTO inv_employee VALUES("5524","SPL-009165","Md Mustafizur Rahman Khan","Saif Powertec Ltd.","SPOT","RTG","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5525","SPL-009166","Rahadul Islam Sakib","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5526","SPL-009167","Nayan Chandra Borman","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5527","SPL-009168","Md Rashed","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5528","SPL-009169","Md Munzurul Haque","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5529","SPL-009170","Md Yousuf Ali","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5530","SPL-009171","Md Mohshin Reza","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5531","SPL-009172","Md Rubel Hossain","Saif Powertec Ltd.","Corporate","Administration","Peon","");
INSERT INTO inv_employee VALUES("5532","SPL-009173","Rasel Khan","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("5533","SPL-009174","Rony","Saif Powertec Ltd.","Battery","Administration","Helper","");
INSERT INTO inv_employee VALUES("5534","SPL-009175","Md Monjur Alam","Saif Powertec Ltd.","Renewable Energy","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("5535","SPL-009176","Abdullah Ahad","Saif Powertec Ltd.","Battery","Assembly","Officer","");
INSERT INTO inv_employee VALUES("5536","SPL-009177","Munir Uddin Hassan","Saif Powertec Ltd.","EHS and Maritime Law","EHS","Head of EHS and Maritime Law","");
INSERT INTO inv_employee VALUES("5537","SPL-009178","Haras Chandro Serker","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("5538","SPL-009179","Md Abu Taher","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("5539","SPL-009180","Md Ali Hossen","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5540","SPL-009181","Khairul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5541","SPL-009182","Md Aminul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5542","SPL-009183","Abu Abdullah","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5543","SPL-009184","Rakibul Hasan Chowdhury","Saif Powertec Ltd.","Corporate","Administration","Co-Ordinator","");
INSERT INTO inv_employee VALUES("5544","SPL-009185","Rifat Hasan Mallick","Saif Powertec Ltd.","Battery","Plate Preparation","Senior Officer","");
INSERT INTO inv_employee VALUES("5545","SPL-009186","Md Nazrul","Saif Powertec Ltd.","SPOT","Delivery","Driver","");
INSERT INTO inv_employee VALUES("5546","SPL-009187","Mostafa Al Masum","Saif Powertec Ltd.","SPOT","EHS","Officer","");
INSERT INTO inv_employee VALUES("5547","SPL-009188","New Entry","Saif Powertec Ltd.","EHS and Maritime Law","Administration","Head of EHS and Maritime Law","");
INSERT INTO inv_employee VALUES("5548","SPL-009189","Sohel","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("5549","SPL-009190","Md Shohel Mia","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5550","SPL-009191","Md Sehab Uddin","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5551","SPL-009192","Al Amin Mia","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5552","SPL-009193","Md Golam Rabbani","Saif Powertec Ltd.","EHS and Maritime Law","EHS","Officer","");
INSERT INTO inv_employee VALUES("5553","SPL-009194","Md Amzad Hossen","Saif Powertec Ltd.","SPOT","EHS","Senior Officer","");
INSERT INTO inv_employee VALUES("5554","SPL-009195","Rezaul Karim","Saif Powertec Ltd.","Corporate","Administration","Security Officer","");
INSERT INTO inv_employee VALUES("5555","SPL-009196","Md Shamim Mia","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("5556","SPL-009197","Hemonto Tripura","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5557","SPL-009198","Mahafuzur Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5558","SPL-009199","Md Arif Fokir","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5559","SPL-009200","Golen Tripura","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5560","SPL-009201","Rabbi Boyati","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5561","SPL-009202","Mohammad Jowel","Saif Powertec Ltd.","SPOT","Administration","Driver","");
INSERT INTO inv_employee VALUES("5562","SPL-009203","Md Saiful Islam","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5563","SPL-009204","Saifuddin Ahammed","Saif Powertec Ltd.","SPOT","RTG","Trainee RTG Operator","");
INSERT INTO inv_employee VALUES("5564","SPL-009205","Md Milon Howlader","Saif Powertec Ltd.","CTED-CTG","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5565","SPL-009206","Md Masum Mia","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("5566","SPL-009207","Md Nazmul Hossain Mollah","Saif Powertec Ltd.","Battery","Purchase And Procurement","Officer","");
INSERT INTO inv_employee VALUES("5567","SPL-009208","Md Shariful Islam","Saif Powertec Ltd.","CTED-CTG","Maintenance","Junior Engineer","");
INSERT INTO inv_employee VALUES("5568","SPL-009209","Md Mintu Miah","Saif Powertec Ltd.","Battery","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("5569","SPL-009210","Md Akash","Saif Powertec Ltd.","Renewable Energy","Administration","Driver","");
INSERT INTO inv_employee VALUES("5570","SPL-009211","Md Kamal Uddin","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("5571","SPL-009212","Md Rafiqul Islam","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5572","SPL-009213","Md Sofiar Rahman","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5573","SPL-009214","Md Jahid Hasan","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5574","SPL-009215","Paththinikuttige Merinus Laksiri Nonis","Saif Powertec Ltd.","Corporate","Management","Executive Director","");
INSERT INTO inv_employee VALUES("5575","SPL-009216","Subaita Samina Ema","Saif Powertec Ltd.","SPOT","Administration","Officer","");
INSERT INTO inv_employee VALUES("5576","SPL-009217","Md Sajjad Hossan","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5577","SPL-009218","Mahedi Hassan","Saif Powertec Ltd.","CTED-CTG","Maintenance","Traniee Engineer","");
INSERT INTO inv_employee VALUES("5578","SPL-009219","Abu Musa","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5579","SPL-009220","Md Abul Kalam Azad","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5580","SPL-009221","Mohammed Tohidul Alam","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5581","SPL-009222","Md Mirajul Islam","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5582","SPL-009223","Md Shahid Kaiser","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5583","SPL-009224","Md Tullu Miah","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5584","SPL-009225","Md Zahirul Hoque Zuman","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5585","SPL-009226","Alif Bin Aziz","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5586","SPL-009227","Riazul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5587","SPL-009228","Alinur","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5588","SPL-009229","Md Liakot Ali Howlader","Saif Powertec Ltd.","Corporate","Administration","Assistant Security Supervisor","");
INSERT INTO inv_employee VALUES("5589","SPL-009230","Md Rasel ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5590","SPL-009231","Md Roni","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5591","SPL-009232","Mehedi Hasan Nayon","Saif Powertec Ltd.","SPOT","Operation","Trailer Operator","");
INSERT INTO inv_employee VALUES("5592","SPL-009233","Ali Foize Md Babu","Saif Powertec Ltd.","CTED-CTG","Maintenance","Traniee Engineer","");
INSERT INTO inv_employee VALUES("5593","SPL-009234","Md Shamir Al Kabir","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5594","SPL-009235","Md Sohel ","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5595","SPL-009236","Md Mostafa","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5596","SPL-009237","Md Sahed Chowdhury","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5597","SPL-009238","Md Raj Mamud ","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5598","SPL-009239","Md Sujon Jomadder","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5599","SPL-009240","Usa Thowi Marma","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5600","SPL-009241","Nazmul Haque","Saif Powertec Ltd.","SPOT","Terminal Operation","Executive Director","");
INSERT INTO inv_employee VALUES("5601","SPL-009242","Mohammed Salim uddin","Saif Powertec Ltd.","SPOT","Administration","Officer","");
INSERT INTO inv_employee VALUES("5602","SPL-009243","Syeda Rowshan Ara","Saif Powertec Ltd.","Corporate","Administration","Executive","");
INSERT INTO inv_employee VALUES("5603","SPL-009244","Md Arman","Saif Powertec Ltd.","SPOT","Operation","Lasher","");
INSERT INTO inv_employee VALUES("5604","SPL-009245","Md Hasan Ali","Saif Powertec Ltd.","SPOT","Operation","Lasher","");
INSERT INTO inv_employee VALUES("5605","SPL-009246","Rahim","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5606","SPL-009247","Asraful Islam","Saif Powertec Ltd.","Battery","Sales And Marketing","Officer","");
INSERT INTO inv_employee VALUES("5607","SPL-009248","Burhan Uddin","Saif Powertec Ltd.","Battery","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("5608","SPL-009249","Arif Hossain","Saif Powertec Ltd.","Battery","Store","Officer","");
INSERT INTO inv_employee VALUES("5609","SPL-009250","Merana","Saif Powertec Ltd.","Battery","Marketing And Sales- Export And Corporate","Support Officer","");
INSERT INTO inv_employee VALUES("5610","SPL-009251","Bappi","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5611","SPL-009252","Nazrul Islam","Saif Powertec Ltd.","SPOT","Ship Planning","Ship Supervisor","");
INSERT INTO inv_employee VALUES("5612","SPL-009253","Abdul Mannan","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5613","SPL-009254","Roky Das","Saif Powertec Ltd.","CTED-CTG","Maintenance","Trainee Engineer","");
INSERT INTO inv_employee VALUES("5614","SPL-009255","Md Sobug Sheikh ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5615","SPL-009256","Yasin Arafat","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5616","SPL-009257","Ronich Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5617","SPL-009258","Md Neamul ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5618","SPL-009259","Jakirul","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5619","SPL-009260","Md Kamrul Islam","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5620","SPL-009261","Mohammad Rubel","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5621","SPL-009262","Nazmul Hoque Sifat","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5622","SPL-009263","Jobair Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5623","SPL-009264","Nuralam Hossain","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5624","SPL-009265","Morshed Alam","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5625","SPL-009266","Sakib Hossain","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5626","SPL-009267","Md Saheen","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5627","SPL-009268","Abdul Malek ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5628","SPL-009269","Md Rayhan","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5629","SPL-009270","Sudheera Sandamith Jayasinghe","Saif Powertec Ltd.","SPOT","Ship Planning","Vessel Planning Manager","");
INSERT INTO inv_employee VALUES("5630","SPL-009271","Tapos Chandra Halder","Saif Powertec Ltd.","Ignite Workshop","Service","Senior Technician","");
INSERT INTO inv_employee VALUES("5631","SPL-009272","Tutul Kha","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5632","SPL-009273","Abdus Salam ","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5633","SPL-009274","Amdadul Khan","Saif Powertec Ltd.","SPOT","Yard Planning And Documentation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5634","SPL-009275","Arif Hossain","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5635","SPL-009276","Billal Hossain Bagmar ","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5636","SPL-009277","Md Abdullah Sarker","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5637","SPL-009278","Md asaduzzaman","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5638","SPL-009279","Md jowel Uddin ","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5639","SPL-009280","Md Mahfujul Hassan Emon","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5640","SPL-009281","Payel Mia ","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5641","SPL-009282","Md Razibul Alam ","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5642","SPL-009283","Sakib Hassan","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5643","SPL-009284","Akash Hossain","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("5644","SPL-009285","Hossanur Sardar","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("5645","SPL-009286","Fatema Tuj Zohora","Saif Powertec Ltd.","Corporate","Administration","Front Desk Officer","");
INSERT INTO inv_employee VALUES("5646","SPL-009287","Imran Hossain","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("5647","SPL-009288","Md Akram Hossain ","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("5648","SPL-009289","Md Shagor Hosen ","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("5649","SPL-009290","Md Shohan Hossain ","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("5650","SPL-009291","Md Tipu Gazi ","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("5651","SPL-009292","Monzurul Islam Maruf ","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5652","SPL-009293","Kazi Nasirul Alam","Saif Powertec Ltd.","EHS and Maritime Law","EHS","Executive","");
INSERT INTO inv_employee VALUES("5653","SPL-009294","Md Taybur Rahman","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5654","SPL-009295","Md Kausir Hossain Khan","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5655","SPL-009296","Md Rajib Hossain ","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5656","SPL-009297","Md Mamun Meer","Saif Powertec Ltd.","SPOT","NCT Yard","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5657","SPL-009298","Sujon Kumar Dutta","Saif Powertec Ltd.","SPOT","NCT Yard","Door Closer","");
INSERT INTO inv_employee VALUES("5658","SPL-009299","Md Alamgir","Saif Powertec Ltd.","SPOT","Ship Planning","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5659","SPL-009300","Md Koushik Ahmed ","Saif Powertec Ltd.","CTED-CTG","Maintenance","Traniee Engineer","");
INSERT INTO inv_employee VALUES("5660","SPL-009301","Md Imran Hossain","Saif Powertec Ltd.","EHS and Maritime Law","EHS","Trainee Officer","");
INSERT INTO inv_employee VALUES("5661","SPL-009302","Muhammad Ainul Hoque","Saif Powertec Ltd.","EHS and Maritime Law","EHS","Trainee Officer","");
INSERT INTO inv_employee VALUES("5662","SPL-009303","Md Afzal Kazi","Saif Powertec Ltd.","Battery","Administration","Driver","");
INSERT INTO inv_employee VALUES("5663","SPL-009304","Md Abujar Sheikh","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5664","SPL-009305","Md Emran Hossain ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5665","SPL-009306","Mollah Mahadi Hasan Miraz","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5666","SPL-009307","Md Mahamodul Hassan ","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5667","SPL-009308","Amir Hossen","Saif Powertec Ltd.","SPOT","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5668","SPL-009309","Shawon Mohammad Shahryiar","Saif Powertec Ltd.","Renewable Energy","Operation","Assistant General Manager","");
INSERT INTO inv_employee VALUES("5669","SPL-009310","Younus ","Saif Powertec Ltd.","CTED-CTG","Maintenance","Helper","");
INSERT INTO inv_employee VALUES("5670","SPL-009311","Md Rasel Khan ","Saif Powertec Ltd.","SPOT","Delivery","Delivery Checker","");
INSERT INTO inv_employee VALUES("5671","SPL-009312","Md Mamun Mollah","Saif Powertec Ltd.","Corporate","Administration","Caretaker","");
INSERT INTO inv_employee VALUES("5672","SPL-009313","Md Salauddin Hayat","Saif Powertec Ltd.","SPOT","EHS","Senior Officer","");
INSERT INTO inv_employee VALUES("5673","SPL-009314","Md Junaid Arshed","Saif Powertec Ltd.","Corporate","Finance And Accounts","Deputy Manager","");
INSERT INTO inv_employee VALUES("5674","SPL-009315","Mohammed Arif","Saif Powertec Ltd.","SPOT","Operation","Trainee Yard Checker","");
INSERT INTO inv_employee VALUES("5675","SPL-009316","Muhammad Nur Hakim ","Saif Powertec Ltd.","SPOT","Delivery","Training Instructor","");
INSERT INTO inv_employee VALUES("5676","SPL-009317","Md Nowman","Saif Powertec Ltd.","SPOT","Operation","Lasher","");
INSERT INTO inv_employee VALUES("5677","SPL-009318","Sohag","Saif Powertec Ltd.","Corporate","Administration","Driver","");
INSERT INTO inv_employee VALUES("5678","SPL-009319","Md Alauddin","Saif Powertec Ltd.","Corporate","Administration","Security Supervisor","");
INSERT INTO inv_employee VALUES("5679","SPL-009320","Al Amin Babu","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5680","SPL-009321","Alamin Sardar","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5681","SPL-009322","Md Imran ","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5682","SPL-009323","Md Abu Nasim","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5683","SPL-009324","Sohan Khan","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5684","SPL-009325","Md Khairul Islam","Saif Powertec Ltd.","Corporate","Administration","Security Guard","");
INSERT INTO inv_employee VALUES("5685","SPL-009326","Mohammad Ullah ","Saif Powertec Ltd.","Corporate","Administration","Security Officer","");
INSERT INTO inv_employee VALUES("5686","SPPL-000001","Rubya Chowdhury","Saif Plastic and Polymer Industries Ltd.","Blank","Management","Managing Director","");
INSERT INTO inv_employee VALUES("5687","SPPL-000002","Sk Aftab Uddin","Saif Plastic and Polymer Industries Ltd.","Blank","Administration","Deputy Manager","");
INSERT INTO inv_employee VALUES("5688","SPPL-000003","Md Mahmudur Rahman","Saif Plastic and Polymer Industries Ltd.","Blank","VAT And TAX","Deputy Manager","");
INSERT INTO inv_employee VALUES("5689","SPPL-000004","Md Shahadat Hossain","Saif Plastic and Polymer Industries Ltd.","Blank","Factory Operation","Factory Manager","");
INSERT INTO inv_employee VALUES("5690","SPPL-000005","Md. Umar Faruk","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Executive","");
INSERT INTO inv_employee VALUES("5691","SPPL-000006","Bibekananda Das","Saif Plastic and Polymer Industries Ltd.","Blank","Sales And Marketing","Assistant Manager","");
INSERT INTO inv_employee VALUES("5692","SPPL-000007","Dipak Kumar Shaha","Saif Plastic and Polymer Industries Ltd.","Blank","Sales And Marketing","Deputy Manager","");
INSERT INTO inv_employee VALUES("5693","SPPL-000008","Md. Ramjan Ali","Saif Plastic and Polymer Industries Ltd.","Blank","Maintenance","In-Charge","");
INSERT INTO inv_employee VALUES("5694","SPPL-000009","Md. Sazratul Alam","Saif Plastic and Polymer Industries Ltd.","Blank","Quality Assurance","Deputy Manager","");
INSERT INTO inv_employee VALUES("5695","SPPL-000010","Md. Waliullah","Saif Plastic and Polymer Industries Ltd.","Blank","Finance And Accounts","Assistant","");
INSERT INTO inv_employee VALUES("5696","SPPL-000011","Md Rajib Mahmud","Saif Plastic and Polymer Industries Ltd.","Blank","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("5697","SPPL-000012","Md Rubel Hossain","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5698","SPPL-000013","Md.Ebrahim Howlader","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5699","SPPL-000014"," Md.Sahin","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Assistant Operator","");
INSERT INTO inv_employee VALUES("5700","SPPL-000015"," Md Rasel Miah","Saif Plastic and Polymer Industries Ltd.","Blank","Maintenance","Foreman","");
INSERT INTO inv_employee VALUES("5701","SPPL-000016","Md Bedar Uddin Khan","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5702","SPPL-000018","Mursheda Khatun","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Assistant Operator","");
INSERT INTO inv_employee VALUES("5703","SPPL-000019","Shahnaj","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Assistant Operator","");
INSERT INTO inv_employee VALUES("5704","SPPL-000020","Mst.Lili Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5705","SPPL-000021","Asma","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Assistant Operator","");
INSERT INTO inv_employee VALUES("5706","SPPL-000022","Rupbanu","Saif Plastic and Polymer Industries Ltd.","Blank","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5707","SPPL-000023","Mst.Josna Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Head Technician","");
INSERT INTO inv_employee VALUES("5708","SPPL-000024","Kohinur Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5709","SPPL-000025","Rehena Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5710","SPPL-000026","Mst.Somla Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5711","SPPL-000027","Sheuly","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Assistant Operator","");
INSERT INTO inv_employee VALUES("5712","SPPL-000028","Mst.Monoara","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5713","SPPL-000029","Hossain Ali","Saif Plastic and Polymer Industries Ltd.","Blank","Quality Assurance","Shift In-Charge","");
INSERT INTO inv_employee VALUES("5714","SPPL-000030","Mst.Johra Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5715","SPPL-000031","Nazmin Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Assistant Operator","");
INSERT INTO inv_employee VALUES("5716","SPPL-000032","Selina Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Assistant Operator","");
INSERT INTO inv_employee VALUES("5717","SPPL-000033","Mst.Selina Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5718","SPPL-000034"," Nur Mahammad","Saif Plastic and Polymer Industries Ltd.","Blank","Maintenance","Technician","");
INSERT INTO inv_employee VALUES("5719","SPPL-000035","Rasel Hawlader","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5720","SPPL-000036","Md.Ataur Rahman Khan","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5721","SPPL-000037","Md.Amdadul Haque","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5722","SPPL-000038","Md Sumon","Saif Plastic and Polymer Industries Ltd.","Blank","Quality Assurance","Assistant","");
INSERT INTO inv_employee VALUES("5723","SPPL-000039","Sahadat Hossain","Saif Plastic and Polymer Industries Ltd.","Blank","Delivery","Helper","");
INSERT INTO inv_employee VALUES("5724","SPPL-000041","Md Anwar Farazi","Saif Plastic and Polymer Industries Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("5725","SPPL-000042","Mst.Nasrin Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5726","SPPL-000043","Md Aminul Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5727","SPPL-000044","Md Osman Gani","Saif Plastic and Polymer Industries Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("5728","SPPL-000045","Apu","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5729","SPPL-000046","Sojib Sorkar","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5730","SPPL-000047","Maksuda","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5731","SPPL-000048","Md. Aminul","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5732","SPPL-000050","Faisal","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5733","SPPL-000051","Most Shirin Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5734","SPPL-000052","Shahnaj Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5735","SPPL-000053","Mst. Beauty Khatun","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5736","SPPL-000054","Nurjahan Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5737","SPPL-000056","Mst.Choity Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5738","SPPL-000057","Rohima Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5739","SPPL-000059","Maksuda","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5740","SPPL-000060","Md Sagor Miya","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5741","SPPL-000061","Jalal Howladar","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Assistant Operator","");
INSERT INTO inv_employee VALUES("5742","SPPL-000062","Md. Razekul Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5743","SPPL-000064","Md Nazrul Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Maintenance","Foreman","");
INSERT INTO inv_employee VALUES("5744","SPPL-000066","Karina Aktar","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5745","SPPL-000067","Amzad Hossain","Saif Plastic and Polymer Industries Ltd.","Blank","Store","Assistant","");
INSERT INTO inv_employee VALUES("5746","SPPL-000068","Fatema Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5747","SPPL-000069","Nabia Aktar","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5748","SPPL-000070","Najma Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5749","SPPL-000071","Nasrin Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5750","SPPL-000072","Sheuly Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5751","SPPL-000073","Shema Akter - I","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5752","SPPL-000074","Sornali","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5753","SPPL-000075","Sonia Aktar","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5754","SPPL-000076","Md Shohidul Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Administration","Helper","");
INSERT INTO inv_employee VALUES("5755","SPPL-000077","Sariful","Saif Plastic and Polymer Industries Ltd.","Blank","Maintenance","Technical Helper","");
INSERT INTO inv_employee VALUES("5756","SPPL-000078","Md. Jasim Uddin","Saif Plastic and Polymer Industries Ltd.","Blank","Quality Assurance","Assistant","");
INSERT INTO inv_employee VALUES("5757","SPPL-000079","Ahad Miah","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5758","SPPL-000081","Md. Sharif Howlader","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5759","SPPL-000082","Alina Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5760","SPPL-000083","Most. Mitu Khatun","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5761","SPPL-000084","Asa Khatun","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5762","SPPL-000085","Selina Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5763","SPPL-000086","Tania Khatun","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5764","SPPL-000087","Suborna Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5765","SPPL-000089","Abu Hanif","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5766","SPPL-000090","Tulsi Rani Roy","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5767","SPPL-000091","Md. Wajedul Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Sales And Marketing","Executive","");
INSERT INTO inv_employee VALUES("5768","SPPL-000093","Abu Taher Howlader","Saif Plastic and Polymer Industries Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("5769","SPPL-000094","Md Moshiur Rahman","Saif Plastic and Polymer Industries Ltd.","Blank","Finance And Accounts","Manager","");
INSERT INTO inv_employee VALUES("5770","SPPL-000097","Md Almas","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5771","SPPL-000098","Md Firoz Alam","Saif Plastic and Polymer Industries Ltd.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("5772","SPPL-000100","Ayasa Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5773","SPPL-000101","Md. Moshiur Rahman","Saif Plastic and Polymer Industries Ltd.","Blank","Production","In-Charge","");
INSERT INTO inv_employee VALUES("5774","SPPL-000103","Nilofa Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5775","SPPL-000104","Md. Al Amin","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5776","SPPL-000105","Md Saiful Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5777","SPPL-000107","Nasrin Akhter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5778","SPPL-000109","Tuhin Chowdhury","Saif Plastic and Polymer Industries Ltd.","Blank","Documentation","Assistant Officer","");
INSERT INTO inv_employee VALUES("5779","SPPL-000110","Ferdous","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5780","SPPL-000111","Ananna Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5781","SPPL-000112","Israt Jahan Sriti","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5782","SPPL-000113","Md Fargiam Hossain","Saif Plastic and Polymer Industries Ltd.","Blank","Store","Store Assistant","");
INSERT INTO inv_employee VALUES("5783","SPPL-000114","A H M Nuezzaman","Saif Plastic and Polymer Industries Ltd.","Blank","Maintenance","Electrician","");
INSERT INTO inv_employee VALUES("5784","SPPL-000115","Md Ariful Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Junior Operator","");
INSERT INTO inv_employee VALUES("5785","SPPL-000116","Selim Hossain","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Junior Operator","");
INSERT INTO inv_employee VALUES("5786","SPPL-000117","Md Aiub Ali","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Junior Operator","");
INSERT INTO inv_employee VALUES("5787","SPPL-000118","Mostak Hossen Shawon","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5788","SPPL-000119","Shohagi Akhter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5789","SPPL-000120","Md Rabiul  Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Quality Assurance","Quality Control Inspector","");
INSERT INTO inv_employee VALUES("5790","SPPL-000121","Mst Parvin Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5791","SPPL-000122","Mahamudul Haque","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5792","SPPL-000123","Mehedi Hasan","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Shift In-Charge","");
INSERT INTO inv_employee VALUES("5793","SPPL-000124","Jakir Hossain Raju","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5794","SPPL-000125","Md Faruk Ahmed","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5795","SPPL-000126","Mst Shohagi Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5796","SPPL-000127","Taharina Akter Sathi","Saif Plastic and Polymer Industries Ltd.","Blank","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("5797","SPPL-000128","Md Ariful Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Junior Operator","");
INSERT INTO inv_employee VALUES("5798","SPPL-000129","Md Ariful Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Junior Operator","");
INSERT INTO inv_employee VALUES("5799","SPPL-000130","Ariful Alam","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Manager","");
INSERT INTO inv_employee VALUES("5800","SPPL-000131","Arzina","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5801","SPPL-000132","Mst Sahinur","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5802","SPPL-000133","Mst Nazmin Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5803","SPPL-000134","Mst Rujna","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5804","SPPL-000135","Ratna","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5805","SPPL-000136","Hanif","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5806","SPPL-000137","Rafiqul Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5807","SPPL-000138","Md Moniruzzaman ","Saif Plastic and Polymer Industries Ltd.","Blank","Sales And Marketing","Senior Officer","");
INSERT INTO inv_employee VALUES("5808","SPPL-000139","Mobarek ","Saif Plastic and Polymer Industries Ltd.","Blank","Administration","Helper","");
INSERT INTO inv_employee VALUES("5809","SPPL-000140","Allo Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5810","SPPL-000141","Md Jibon Islam","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5811","SPPL-000142","Mahmoda Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5812","SPPL-000143","Mst Safiaya Khatun","Saif Plastic and Polymer Industries Ltd.","Blank","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5813","SPPL-000144","Alomgir Hossain","Saif Plastic and Polymer Industries Ltd.","Blank","Maintenance","Electrician","");
INSERT INTO inv_employee VALUES("5814","SPPL-000145","Md Mahbub Alam Mithu","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Operator","");
INSERT INTO inv_employee VALUES("5815","SPPL-000146","Maznu Miah","Saif Plastic and Polymer Industries Ltd.","Blank","Store","Store Assistant","");
INSERT INTO inv_employee VALUES("5816","SPPL-000147","Parvez","Saif Plastic and Polymer Industries Ltd.","Blank","Quality Assurance","Assistant","");
INSERT INTO inv_employee VALUES("5817","SPPL-000148","Md Rayhan hosen","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5818","SPPL-000149","Amirun Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5819","SPPL-000150","Amana Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5820","SPPL-000151","Saikat ","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5821","SPPL-000152","Nihad Sekh","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5822","SPPL-000153","Sangid Hossain","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5823","SPPL-000154","Mohammad Ali","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5824","SPPL-000155","Pakhi","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5825","SPPL-000156","Mithila Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5826","SPPL-000157","Sampa Rani Mali","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5827","SPPL-000158","Suma Akter","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5828","SPPL-000159","Fatema Tuj Zohora","Saif Plastic and Polymer Industries Ltd.","Blank","Finance And Accounts","Executive","");
INSERT INTO inv_employee VALUES("5829","SPPL-000160","Luna Begum","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5830","SPPL-000161","Masiur Rahman Khan","Saif Plastic and Polymer Industries Ltd.","Blank","Production","Helper","");
INSERT INTO inv_employee VALUES("5831","SSC-000001","Tarafder Md. Ruhul Amin","SAIF SPORTING CLUB LTD.","Blank","Management","President","");
INSERT INTO inv_employee VALUES("5832","SSC-000002","Tarafder Nigar Sultana","SAIF SPORTING CLUB LTD.","Blank","Management","Director","");
INSERT INTO inv_employee VALUES("5833","SSC-000003","Rubya Chowdhury","SAIF SPORTING CLUB LTD.","Blank","Management","Director","");
INSERT INTO inv_employee VALUES("5834","SSC-000004","Tarafder Md Ruhul Saif","SAIF SPORTING CLUB LTD.","Blank","Management","Director","");
INSERT INTO inv_employee VALUES("5835","SSC-000005","SK MD Maruf Hasan","SAIF SPORTING CLUB LTD.","Blank","Management","Managing Director","");
INSERT INTO inv_employee VALUES("5836","SSC-000006","Md Rakibul Hasan","SAIF SPORTING CLUB LTD.","Blank","Administration","Peon","");
INSERT INTO inv_employee VALUES("5837","SSC-000007","Shahedul Alam Shahed","SAIF SPORTING CLUB LTD.","Blank","Administration","Team Manager","");
INSERT INTO inv_employee VALUES("5838","SSC-000008","Jarip Hasan","SAIF SPORTING CLUB LTD.","Blank","Administration","Ball Boy","");
INSERT INTO inv_employee VALUES("5839","SSC-000009","Eqram","SAIF SPORTING CLUB LTD.","Blank","Administration","Ball Boy","");
INSERT INTO inv_employee VALUES("5840","SSC-000010","Tauhid Pathan","SAIF SPORTING CLUB LTD.","Blank","Administration","Ball Boy","");
INSERT INTO inv_employee VALUES("5841","SSC-000011","Bhupal Kanti Ray","SAIF SPORTING CLUB LTD.","Blank","Administration","Assistant Physiotherapist","");
INSERT INTO inv_employee VALUES("5842","SSC-000012","Md Arifur Rahman Pannu","SAIF SPORTING CLUB LTD.","Blank","Administration","Goal Keeper Coach","");
INSERT INTO inv_employee VALUES("5843","SSC-000013","Abdullah Nasif Islam","SAIF SPORTING CLUB LTD.","Blank","Administration","Video Analyst","");
INSERT INTO inv_employee VALUES("5844","SSC-000014","Khokon Khan Sharif","SAIF SPORTING CLUB LTD.","Blank","Administration","Ball Boy","");
INSERT INTO inv_employee VALUES("5845","SSC-000015","Md Shahab Uddin","SAIF SPORTING CLUB LTD.","Blank","Administration","Massage Man","");
INSERT INTO inv_employee VALUES("5846","SSC-000016","Md Alkas Mia","SAIF SPORTING CLUB LTD.","Blank","Administration","Cook","");
INSERT INTO inv_employee VALUES("5847","SSC-000017","Mst Tofiron Khatun","SAIF SPORTING CLUB LTD.","Blank","Administration","House Maid","");
INSERT INTO inv_employee VALUES("5848","SSC-000018","Md Siam Sheikh","SAIF SPORTING CLUB LTD.","Blank","Administration","Assistant Masange Man","");
INSERT INTO inv_employee VALUES("5849","SSC-000019","Md Sohel Mia","SAIF SPORTING CLUB LTD.","Blank","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5850","SSC-000020","Md Jobayet Mia","SAIF SPORTING CLUB LTD.","Blank","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("5851","SSC-000021","Md Jahangir Alam","SAIF SPORTING CLUB LTD.","Blank","Administration","Assistant Cook","");
INSERT INTO inv_employee VALUES("5852","SSC-000022","Md Mahbubur Rahman","SAIF SPORTING CLUB LTD.","Blank","Administration","Cleaner","");
INSERT INTO inv_employee VALUES("5853","SSC-000023","MD Babul Sarkar","SAIF SPORTING CLUB LTD.","Blank","Administration","Camp Supervisor","");
INSERT INTO inv_employee VALUES("5854","SSC-000024","Md Zamal Uddin","SAIF SPORTING CLUB LTD.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("5855","SSC-000025","Mohebul Kabir Rony ","SAIF SPORTING CLUB LTD.","Blank","Management","Co-Ordinator","");
INSERT INTO inv_employee VALUES("5856","SSC-000026","Assaduzzaman Roni","SAIF SPORTING CLUB LTD.","Blank","Management","Manager","");
INSERT INTO inv_employee VALUES("5857","SSC-000027"," Md Mamun Hossain","SAIF SPORTING CLUB LTD.","Blank","Management","Assistant Manager","");
INSERT INTO inv_employee VALUES("5858","SSC-000028","Md Liton Mia","SAIF SPORTING CLUB LTD.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("5859","SSC-000029","Md. Shaifur Rahman Moni","SAIF SPORTING CLUB LTD.","Blank","Management","Coach","");
INSERT INTO inv_employee VALUES("5860","SSC-000030","Md Bilal","SAIF SPORTING CLUB LTD.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("5861","SSC-000031","Md Emran Hawladar","SAIF SPORTING CLUB LTD.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("5862","TRE-000001","Tarafder Md. Ruhul Amin","Trust Regional Equity Ltd.","Blank","Management","Chairman","");
INSERT INTO inv_employee VALUES("5863","TRE-000002","Rubya Chowdhury","Trust Regional Equity Ltd.","Blank","Management","Managing Director","");
INSERT INTO inv_employee VALUES("5864","TRE-000003","Tarafder Nigar Sultana","Trust Regional Equity Ltd.","Blank","Management","Director","");
INSERT INTO inv_employee VALUES("5865","TRE-000004","Tarafder Md Ruhul Saif","Trust Regional Equity Ltd.","Blank","Management","Director","");
INSERT INTO inv_employee VALUES("5866","TRE-000005","S Tonmoy Hannan","Trust Regional Equity Ltd.","Blank","Finance And Accounts","Deputy Manager","");
INSERT INTO inv_employee VALUES("5867","TRE-000006","Md Arifur Rahman","Trust Regional Equity Ltd.","Blank","Human Resource Management","Manager","");
INSERT INTO inv_employee VALUES("5868","TRE-000007","Tania Sharmin","Trust Regional Equity Ltd.","Blank","Management","Chief Executive Officer","");
INSERT INTO inv_employee VALUES("5869","TRE-000008","Md Ariful Islam","Trust Regional Equity Ltd.","Blank","Administration","Manager","");
INSERT INTO inv_employee VALUES("5870","TRE-000009","Md Sumon","Trust Regional Equity Ltd.","Blank","Administration","Driver","");
INSERT INTO inv_employee VALUES("5871","TRE-000010","Md Nasir Uddin ","Trust Regional Equity Ltd.","Blank","Customer Care","Officer","");
INSERT INTO inv_employee VALUES("5872","TRE-000011","Tabassum Ferdous","Trust Regional Equity Ltd.","Blank","Customer Care","Officer","");
INSERT INTO inv_employee VALUES("5873","TRE-000012","Md Zahid Hossain Bhuiyan","Trust Regional Equity Ltd.","Blank","Administration","Executive","");
INSERT INTO inv_employee VALUES("5874","TRE-000013","Md Papul Miah ","Trust Regional Equity Ltd.","Blank","Administration","Office Assistant","");
INSERT INTO inv_employee VALUES("5875","SPL-BOD","SPL-BOD","","","","","");
INSERT INTO inv_employee VALUES("5876","SPL-2nd-Floor-Washroom","SPL-2nd-Floor-Washroom","","","","","");
INSERT INTO inv_employee VALUES("5877","SPL-2nd-Floor-Photocopy","SPL-2nd-Floor-Photocopy","","","","","");
INSERT INTO inv_employee VALUES("5878","SPL-2nd-Floor-Kitchen","SPL-2nd-Floor-Kitchen","","","","","");
INSERT INTO inv_employee VALUES("5879","SPL-2nd-Floor-Common-Workspace","SPL-2nd-Floor-Common-Workspace","","","","","");
INSERT INTO inv_employee VALUES("5880","SPL-2nd-Floor-Reception","SPL-2nd-Floor-Reception","","","","","");
INSERT INTO inv_employee VALUES("5881","SPL-3rd-Floor-Washroom","SPL-3rd-Floor-Washroom","","","","","");
INSERT INTO inv_employee VALUES("5882","SPL-3rd-Floor-Photocopy","SPL-3rd-Floor-Photocopy","","","","","");
INSERT INTO inv_employee VALUES("5883","SPL-3rd-Floor-Kitchen","SPL-3rd-Floor-Kitchen","","","","","");
INSERT INTO inv_employee VALUES("5884","SPL-3rd-Floor-Common-Workspace","SPL-3rd-Floor-Common-Workspace","","","","","");
INSERT INTO inv_employee VALUES("5885","SPL-3rd-Floor-Common-Workspace","SPL-3rd-Floor-Common-Workspace","","","","","");
INSERT INTO inv_employee VALUES("5886","SPL-3rd-Floor-Tumulia","SPL-3rd-Floor-Tumulia","","","","","");
INSERT INTO inv_employee VALUES("5887","SPL-3rd-Floor-Pubail","SPL-3rd-Floor-Pubail","","","","","");
INSERT INTO inv_employee VALUES("5888","SPL-5th-Floor-Washroom","SPL-5th-Floor-Washroom","","","","","");
INSERT INTO inv_employee VALUES("5889","SPL-5th-Floor-Photocopy","SPL-5th-Floor-Photocopy","","","","","");
INSERT INTO inv_employee VALUES("5890","SPL-5th-Floor-Kitchen","SPL-5th-Floor-Kitchen","","","","","");
INSERT INTO inv_employee VALUES("5891","SPL-5th-Floor-Common-Workspace","SPL-5th-Floor-Common-Workspace","","","","","");
INSERT INTO inv_employee VALUES("5892","SPL-5th-Floor-Reception","SPL-5th-Floor-Reception","","","","","");
INSERT INTO inv_employee VALUES("5893","SPL-7th-Floor-Washroom","SPL-7th-Floor-Washroom","","","","","");
INSERT INTO inv_employee VALUES("5894","SPL-7th-Floor-Photocopy","PL-7th-Floor-Photocopy","","","","","");
INSERT INTO inv_employee VALUES("5895","SPL-7th-Floor-Kitchen","SPL-7th-Floor-Kitchen","","","","","");
INSERT INTO inv_employee VALUES("5896","SPL-7th-Floor-Common-Workspace","SPL-7th-Floor-Common-Workspace","","","","","");
INSERT INTO inv_employee VALUES("5897","SPL-7th-Floor-Reception","SPL-7th-Floor-Reception","","","","","");
INSERT INTO inv_employee VALUES("5898","SPL-12th-Floor-Washroom","SPL-12th-Floor-Washroom","","","","","");
INSERT INTO inv_employee VALUES("5899","SPL-12th-Floor-Photocopy","SPL-12th-Floor-Photocopy","","","","","");
INSERT INTO inv_employee VALUES("5900","SPL-12th-Floor-Kitchen","SPL-12th-Floor-Kitchen","","","","","");
INSERT INTO inv_employee VALUES("5901","SPL-12th-Floor-Common-Workspace","SPL-12th-Floor-Common-Workspace","","","","","");
INSERT INTO inv_employee VALUES("5902","SPL-12th-Floor-Reception","SPL-12th-Floor-Reception","","","","","");
INSERT INTO inv_employee VALUES("5903","SPL-13th-Floor-Washroom","SPL-13th-Floor-Washroom","","","","","");
INSERT INTO inv_employee VALUES("5904","SPL-13th-Floor-Photocopy","SPL-13th-Floor-Photocopy","","","","","");
INSERT INTO inv_employee VALUES("5905","SPL-13th-Floor-Kitchen","SPL-13th-Floor-Kitchen","","","","","");
INSERT INTO inv_employee VALUES("5906","SPL-13th-Floor-Common-Workspace","SPL-13th-Floor-Common-Workspace","","","","","");
INSERT INTO inv_employee VALUES("5907","SPL-13th-Floor-Reception","SPL-13th-Floor-Reception","","","","","");
INSERT INTO inv_employee VALUES("5908","SPL-14th-Floor-Washroom","SPL-14th-Floor-Washroom","","","","","");
INSERT INTO inv_employee VALUES("5909","SPL-14th-Floor-Photocopy","SPL-14th-Floor-Photocopy","","","","","");
INSERT INTO inv_employee VALUES("5910","SPL-14th-Floor-Kitchen","SPL-14th-Floor-Kitchen","","","","","");
INSERT INTO inv_employee VALUES("5911","SPL-14th-Floor-Common-Workspace","SPL-14th-Floor-Common-Workspace","","","","","");
INSERT INTO inv_employee VALUES("5912","SPL-14th-Floor-Reception","SPL-14th-Floor-Reception","","","","","");
INSERT INTO inv_employee VALUES("5913","SPL-8th-Floor-Rupayan Tower-Washroom","SPL-8th-Floor-Rupayan Tower-Washroom","","","","","");
INSERT INTO inv_employee VALUES("5914","SPL-8th-Floor-Rupayan Tower-Photocopy","PL-8th-Floor-Rupayan Tower-Photocopy","","","","","");
INSERT INTO inv_employee VALUES("5915","SPL-8th-Floor-Rupayan Tower-Kitchen","SPL-8th-Floor-Rupayan Tower-Kitchen","","","","","");
INSERT INTO inv_employee VALUES("5916","SPL-8th-Floor-Rupayan Tower-Common-Workspace","SPL-8th-Floor-Rupayan Tower-Common-Workspace","","","","","");
INSERT INTO inv_employee VALUES("5917","SPL-8th-Floor-Rupayan Tower-Reception","SPL-8th-Floor-Rupayan Tower-Reception","","","","","");
INSERT INTO inv_employee VALUES("5918","SA-000001","Admin","Saif Power Group","Corporate","Administration","Executive","g9");
INSERT INTO inv_employee VALUES("5919","Docu-Incharge-01","Docu-Incharge-01","","CTG","CCTO-SPOT","Shift In-Charge","");
INSERT INTO inv_employee VALUES("5920","PICT-COMMON-USER","PICT-COMMON USER","","","","","");
INSERT INTO inv_employee VALUES("5921","KICD-COMMON-USER","KICD-COMMON USER","","","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_issue VALUES("4","IS-CW-001","2023-12-05","","","CH-02","0","15000","dfgdf","1","1","3378","0","","","","");
INSERT INTO inv_issue VALUES("5","IS-CW-002","2023-12-10","","","CH-02","0","3200","vhghj","1","1","3378","0","","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_issuedetail VALUES("7","IS-CW-001","2023-12-05","02-01","6","20","10","1500","920871.0163","CH-02","1","1","","","0","0");
INSERT INTO inv_issuedetail VALUES("8","IS-CW-002","2023-12-10","02-01","6","20","2","1500","920871.0163","CH-02","1","1","","","0","0");
INSERT INTO inv_issuedetail VALUES("9","IS-CW-002","2023-12-10","01-01","5","20","2","100","LF4054/VG100070005","CH-02","1","1","","","0","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_material VALUES("5","01-01","27","0","0","0","Oil Filter","","","","1","","","0","20","0","0","","","","","","","LF4054/VG100070005","998","0");
INSERT INTO inv_material VALUES("6","02-01","28","0","0","0","Saif battery","","","","5","","","0","20","0","0","","","","","","","SPB-00001","88","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
INSERT INTO inv_material_partno_detail VALUES("12","0","03-01","sdfds","1","1","1","2023-12-03 00:00:00","2023-12-03 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("13","0","03-01","sdfds","1","1","1","2023-12-03 00:00:00","2023-12-03 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("14","0","03-01","sdfds","1","1","1","2023-12-03 00:00:00","2023-12-03 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("15","0","03-01","sdfds","1","1","1","2023-12-03 00:00:00","2023-12-03 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("16","5","01-01","LF4054/VG100070005","1","1","1","2023-12-04 00:00:00","2023-12-04 00:00:00");
INSERT INTO inv_material_partno_detail VALUES("17","6","02-01","SPB-00001","1","1","1","2023-12-04 00:00:00","2023-12-04 00:00:00");



CREATE TABLE `inv_materialbalance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_ref_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_materialid` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_category` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_materialbalance VALUES("37","MRR-CW001","01-01","0","2023-12-04","1000","100000","0","0","100","Receive","1.1","1","20","MRR-CW001","LF4054/VG100070005","1","1","","","0","0");
INSERT INTO inv_materialbalance VALUES("38","MRR-CW002","02-01","0","2023-12-04","100","45000","0","0","450","Receive","1.1","1","20","MRR-CW002","SPB-00001","1","1","","","0","0");
INSERT INTO inv_materialbalance VALUES("39","IS-CW-001","02-01","0","2023-12-05","0","0","10","15000","1500","Issue","1.1","1","20","IS-CW-001","920871.0163","1","1","","","0","0");
INSERT INTO inv_materialbalance VALUES("40","IS-CW-002","02-01","0","2023-12-10","0","0","2","3000","1500","Issue","1.1","1","20","IS-CW-002","920871.0163","1","1","","","0","0");
INSERT INTO inv_materialbalance VALUES("41","IS-CW-002","01-01","0","2023-12-10","0","0","2","200","100","Issue","1.1","1","20","IS-CW-002","LF4054/VG100070005","1","1","","","0","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_materialcategorysub VALUES("27","01-00","0","1","Filter","","","","0","1");
INSERT INTO inv_materialcategorysub VALUES("28","02-00","0","2","Battery","","","","0","1");
INSERT INTO inv_materialcategorysub VALUES("29","03-00","27","3","Engine Filter","","","","0","1");
INSERT INTO inv_materialcategorysub VALUES("30","04-00","27","4","Oil Filter","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("31","05-00","28","5","ISP Battery","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("32","06-00","28","6","Mishuk Battery","","","","0","1");
INSERT INTO inv_materialcategorysub VALUES("33","07-00","28","7","Rickshaw Battery","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("34","08-00","29","8","Volvo Filter","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("35","09-00","32","9","Auto Battery","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("36","10-00","32","10","Cycle Battery","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("37","11-00","32","11","Bike Battery","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("38","12-00","29","12","Honda Engine","","","","0","0");
INSERT INTO inv_materialcategorysub VALUES("39","13-00","29","13","Suzuki Engine","","","","0","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO inv_product_price VALUES("26","MRR-CW001","01-01","28","450","1200","xcv","1","2023-11-15","","0000-00-00","");
INSERT INTO inv_product_price VALUES("27","MRR-CW001","02-02","29","148","1400","923829.1401","1","2023-11-15","","0000-00-00","");
INSERT INTO inv_product_price VALUES("28","MRR-CW001","02-01","30","83","1500","920871.0163","1","2023-11-15","","0000-00-00","");
INSERT INTO inv_product_price VALUES("29","MRR-CW001","01-01","31","998","100","LF4054/VG100070005","1","2023-12-04","","0000-00-00","");
INSERT INTO inv_product_price VALUES("30","MRR-CW002","02-01","32","100","450","SPB-00001","1","2023-12-04","","0000-00-00","");



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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_receive VALUES("10","MRR-CW001","2023-12-04","sdfds","6-14-010","SID-001","0","","fhgh","Credit","1","1","1","","100000","1000","sdfds","2023-12-04","","LF4054/VG100070005","sdfdsf","2023-12-04 00:00:00","3378","0","","0000-00-00 00:00:00","","");
INSERT INTO inv_receive VALUES("11","MRR-CW002","2023-12-04","sdf","6-14-010","SID-001","0","","dgfdfg","Credit","1","1","1","","45000","100","sdfd","2023-12-04","","SPB-00001","sdf","2023-12-04 00:00:00","3378","0","","0000-00-00 00:00:00","","");



CREATE TABLE `inv_receivedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mrr_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `material_category` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_receivedetail VALUES("31","MRR-CW001","01-01","5","0","20","1000","100","1","100000","","LF4054/VG100070005","1","1","0","0");
INSERT INTO inv_receivedetail VALUES("32","MRR-CW002","02-01","6","0","20","100","450","1","45000","","SPB-00001","1","1","0","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO inv_supplierbalance VALUES("10","MRR-CW001","1","2023-12-04","SID-001","0","100000","fhgh","MRR-CW001","0");
INSERT INTO inv_supplierbalance VALUES("11","MRR-CW002","1","2023-12-04","SID-001","0","45000","dgfdfg","MRR-CW002","0");



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

INSERT INTO inv_warehosueinfo VALUES("1","WH-001","Port Warehouse","CTW","1","Chattogram Port, Chattogram","0","0","2020-12-14 16:49:26","0000-00-00 00:00:00","0000-00-00 00:00:00");



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

INSERT INTO notesheet_access_chain VALUES("24","default","16","129","21","0","{\"3374\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}","1","2023-09-21 07:55:41","0","0000-00-00 00:00:00");
INSERT INTO notesheet_access_chain VALUES("25","default","16","130","21","0","{\"3377\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}","1","2023-09-21 08:01:03","0","0000-00-00 00:00:00");



CREATE TABLE `notesheet_acknowledgement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notesheet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ack_order` int(11) NOT NULL COMMENT 'acknowledge order to show the RLP',
  `ack_status` tinyint(4) NOT NULL DEFAULT 0,
  `ack_request_date` datetime NOT NULL,
  `ack_updated_date` datetime DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=not visible; 1= visible',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rlp_info_id` (`notesheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO notesheet_acknowledgement VALUES("505","52","3377","1","0","2023-12-10 09:32:33","","1","3378","");
INSERT INTO notesheet_acknowledgement VALUES("506","52","3373","2","0","2023-12-10 09:32:33","","0","3378","");
INSERT INTO notesheet_acknowledgement VALUES("507","52","3372","3","0","2023-12-10 09:32:33","","0","3378","");



CREATE TABLE `notesheet_remarks_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notesheet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `remarks` longtext NOT NULL,
  `remarks_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rlp_info_id` (`notesheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;




CREATE TABLE `notesheet_roles_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `details` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO notesheet_roles_group VALUES("1","member","[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\"]");
INSERT INTO notesheet_roles_group VALUES("2","acknowledgers","[\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\",\"g16\"]");
INSERT INTO notesheet_roles_group VALUES("3","approval","[\"g17\",\"g18\",\"g19\",\"g20\"]");



CREATE TABLE `notesheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notesheet_no` varchar(50) NOT NULL,
  `notesheet_id` int(11) NOT NULL,
  `rlp_no` varchar(100) NOT NULL,
  `subject` longtext NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `address` varchar(500) NOT NULL,
  `concern_person` varchar(50) NOT NULL,
  `cell_number` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `item` varchar(500) NOT NULL,
  `part_no` varchar(100) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  `unit_price` varchar(20) NOT NULL,
  `total` varchar(20) NOT NULL,
  `remarks` varchar(500) NOT NULL,
  `status` varchar(15) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO notesheets VALUES("179","NS-2023-12-ENG-Sof-001","52","RLP-ENG-CTE-2023-12-001","sub","sup","456","per","456","fgf@ergt.tff","6","","Pics","2","200","400.00","","Created","2023-12-10 09:32:33","3378");
INSERT INTO notesheets VALUES("180","NS-2023-12-ENG-Sof-001","52","RLP-ENG-CTE-2023-12-001","sub","sup","456","per","456","fgf@ergt.tff","5","","Pics","5","250","1250.00","","Created","2023-12-10 09:32:33","3378");



CREATE TABLE `notesheets_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notesheet_no` varchar(100) NOT NULL,
  `rlp_no` varchar(100) NOT NULL,
  `request_project` int(11) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `ns_info` longtext NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `concern_person` varchar(100) NOT NULL,
  `cell_number` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_of_item` int(11) NOT NULL,
  `sub_total` float NOT NULL,
  `ait` float NOT NULL,
  `vat` float NOT NULL,
  `discount` float NOT NULL,
  `total_afterdiscount` float NOT NULL,
  `grand_total` float NOT NULL,
  `remarks` longtext NOT NULL,
  `terms_condition` longtext NOT NULL,
  `status` varchar(15) NOT NULL,
  `notesheet_status` tinyint(1) NOT NULL,
  `is_viewd` tinyint(1) NOT NULL,
  `is_wo` tinyint(1) NOT NULL DEFAULT 0,
  `attached_file` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(20) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO notesheets_master VALUES("52","NS-2023-12-ENG-Sof-001","RLP-ENG-CTE-2023-12-001","1","sub","ref","sup","456","per","456","fgf@ergt.tff","0","1650","0","115.5","0","1650","1765.5","","<ul>\r\n\r\n							<li>Date of Commencement</li>\r\n\r\n							<li>Delivery of Goods: Within 03(Three) days after receiving the work order.</li>\r\n\r\n							<li>Mode of payment: After 45 days from the date of bill Submission.</li>\r\n\r\n							<li>The above rate includes VAT, AIT & other Taxes.</li>\r\n\r\n							<li>Transport & Courier costs will be charged by Buyers.</li>\r\n\r\n						</ul>\r\n","Created","0","0","0","","2023-12-10 09:32:32","3378","0000-00-00 00:00:00","0000-00-00 00:00:00","0");



CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL,
  `message` varchar(191) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 - Dashboard , 2 - Email , 3 - Both',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_no` varchar(20) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_contact_no` varchar(15) NOT NULL,
  `frame` varchar(100) NOT NULL,
  `frame_no` varchar(50) NOT NULL,
  `colour` varchar(20) NOT NULL,
  `size` varchar(20) NOT NULL,
  `quality` varchar(15) NOT NULL,
  `lens` varchar(20) NOT NULL,
  `qty` varchar(15) NOT NULL,
  `receive_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `right_sph` varchar(20) NOT NULL,
  `right_cyl` varchar(20) NOT NULL,
  `right_axis` varchar(20) NOT NULL,
  `left_sph` varchar(20) NOT NULL,
  `left_cyl` varchar(20) NOT NULL,
  `left_axis` varchar(20) NOT NULL,
  `amount` float NOT NULL,
  `advance` float NOT NULL,
  `due` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO orders VALUES("2","ON-001","Atiqur Rahman","01729714503","Frame Type","Frame No","Silver","size","Good","lens","1","2023-11-27","2023-11-30","R-SPH","R-CYL","R-AXIS","L-SPH","L-CYL","R-AXIS","2500","500","2000","2023-11-27 10:49:26","0000-00-00 00:00:00");



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

INSERT INTO permissions VALUES("1","material-list","Material List","Material","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("2","material-add","Material Entry","Material","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("3","material-edit","Material Update","Material","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("4","material-delete","Material Delete","Material","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("5","part-no-update","Part No Update","Material","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("6","category-list","Category List","Material Category","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("7","category-add","Category Entry","Material Category","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("8","category-delete","Category Delete","Material Category","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("9","unit-list","Unit List","Material Unit","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("10","unit-add","Unit Entry","Material Unit","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("11","unit-edit","Unit Update","Material Unit","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("12","unit-delete","Unit Delete","Material Unit","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("13","project-list","Project List","Projects","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("14","project-add","Project Entry","Projects","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("15","project-edit","Project Update","Projects","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("16","project-delete","Project Delete","Projects","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("17","warehouse-list","Warehouse List","Warehouse","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("18","warehouse-add","Warehouse Entry","Warehouse","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("19","warehouse-edit","Warehouse Update","Warehouse","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("20","warehouse-delete","Warehouse Delete","Warehouse","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("21","equipment-list","Equipment List","Equipment","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("22","equipment-add","Equipment Entry","Equipment","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("23","equipment-edit","Equipment Update","Equipment","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("24","equipment-delete","Equipment Delete","Equipment","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("25","opening-stock-list","Opening Stock List","Opening Stock","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("26","opening-stock-edit","Opening Stock Update","Opening Stock","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("27","material-receive-list","Material Receive List","Material Receive","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("28","material-receive-add","Material Receive Entry","Material Receive","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("29","material-receive-edit","Material Receive Update","Material Receive","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("30","material-receive-delete","Material Receive Delete","Material Receive","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("31","material-issue-list","Material Issue List","Material Issue","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("32","material-issue-add","Material Issue Entry","Material Issue","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("33","material-issue-edit","Material Issue Update","Material Issue","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("34","material-issue-delete","Material Issue Delete","Material Issue","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("35","user-list","User List","User","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("36","user-add","User Entry","User","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("37","user-edit","User Update","User","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("38","user-profile-update","User Profile Update","User","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("39","user-delete","User Delete","User","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("40","role-list","Role List","Role","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("41","role-add","Role Entry","Role","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("42","role-edit","Role Update","Role","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("43","role-delete","Role Delete","Role","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("44","category-wise-material-list","Categorywise Material List","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("45","material-stock-report","Material Stock Report","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("46","material-wise-stock-report","Materialwise Stock Report","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("47","category-wise-material-stock-report","Categorywise material Stock Report","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("48","material-movement-report","Material Movement Report","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("49","equipment-history","Equipment History","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("50","material-history","Material History","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("51","material-receive-history","Material Receive History","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("52","material-issue-history","Material Issue History","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("53","material-receive-details","Material Receive Details","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("54","categorywise-material-receive-details","Categorywise Material Receive Details","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("55","material-issue-details","Material Issue Details","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("56","categorywise-material-issue-details","Categorywise Material Issue Details","Material Stock Report","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("57","material-issue-approve","Material Issue Approve","Material Issue","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("58","material-receive-approve","Material Receive Approve","Material Receive","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("59","data-backup","Data Backup","Material","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO permissions VALUES("60","log-history","Log History","Report Part","0","1","0","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");



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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `name` varchar(400) DEFAULT NULL,
  `unit_name` varchar(100) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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

INSERT INTO projects VALUES("1","PR-001","CTED, Chattogram","Lt Commander M Tafsir Uddin Ahmed(Retd)","Chattogram Port, Chattogram","0","0","2020-12-14 16:48:32","0000-00-00 00:00:00","0000-00-00 00:00:00");



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

INSERT INTO rlp_access_chain VALUES("64","default","16","130","1","0","{\"3374\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}","1","2023-09-20 11:48:22","0","0000-00-00 00:00:00");
INSERT INTO rlp_access_chain VALUES("67","default","5","32","1","0","{\"3374\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}","1","2023-09-21 09:37:05","0","0000-00-00 00:00:00");



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
) ENGINE=InnoDB AUTO_INCREMENT=1353 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO rlp_acknowledgement VALUES("1350","1","3374","1","6","2023-12-10 08:07:53","2023-12-10 13:08:49","1","3378","3374");
INSERT INTO rlp_acknowledgement VALUES("1351","1","3373","2","6","2023-12-10 13:08:49","2023-12-10 13:09:17","1","3378","3373");
INSERT INTO rlp_acknowledgement VALUES("1352","1","3372","3","1","2023-12-10 13:09:17","2023-12-10 13:10:06","1","3378","3372");



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
  `item_des` varchar(200) DEFAULT NULL,
  `material_id` varchar(50) NOT NULL,
  `material_name` varchar(20) NOT NULL,
  `part_no` varchar(50) NOT NULL,
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

INSERT INTO rlp_details VALUES("1","1","","02-01","6","SPB-00001","office","2","20","0","0","","","");
INSERT INTO rlp_details VALUES("2","1","","01-01","5","LF4054/VG100070005","service","5","20","0","0","","","");



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

INSERT INTO rlp_info VALUES("1","RLP-ENG-CTE-2023-12-001","3378","admin@saifpowertec.com","3","2023-12-10 12:00:00","16","130","1","admin@saifpowertec.com","","","","okay","0","1","0","1","3378","2023-12-10 08:07:53","3372","2023-10-12 13:10:06","0");



CREATE TABLE `rlp_remarks_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rlp_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `remarks` longtext NOT NULL,
  `remarks_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rlp_info_id` (`rlp_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=789 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO rlp_remarks_history VALUES("786","1","3374","go ahead","2023-12-10 13:08:49");
INSERT INTO rlp_remarks_history VALUES("787","1","3373","okay","2023-12-10 13:09:17");
INSERT INTO rlp_remarks_history VALUES("788","1","3372","approved","2023-12-10 13:10:06");



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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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

INSERT INTO status_details VALUES("1","Approve","#C3FDB8");
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
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO userlog VALUES("4","1","Admin CTED","14","","203.82.207.81","2023-06-12 20:55:23");
INSERT INTO userlog VALUES("5","7","User Zilani","15","","203.82.207.81","2023-06-12 20:55:38");
INSERT INTO userlog VALUES("6","1","Admin CTED","14","","203.82.207.81","2023-06-12 21:12:44");
INSERT INTO userlog VALUES("7","8","User Mamun","15","","203.82.207.81","2023-06-12 21:20:35");
INSERT INTO userlog VALUES("8","1","Admin CTED","14","","203.82.207.81","2023-06-12 21:20:52");
INSERT INTO userlog VALUES("9","8","User Mamun","15","","203.82.207.81","2023-06-12 21:21:11");
INSERT INTO userlog VALUES("10","1","Admin CTED","14","","203.82.207.81","2023-06-12 21:28:12");
INSERT INTO userlog VALUES("11","1","Admin CTED","14","","203.82.207.81","2023-06-12 22:18:09");
INSERT INTO userlog VALUES("12","1","Admin CTED","14","","203.82.207.81","2023-06-12 22:22:30");
INSERT INTO userlog VALUES("13","1","Admin CTED","14","","203.82.207.81","2023-06-12 23:01:54");
INSERT INTO userlog VALUES("14","1","Admin CTED","14","","203.82.207.81","2023-06-12 23:02:38");
INSERT INTO userlog VALUES("15","1","Admin CTED","14","","203.82.207.81","2023-06-12 23:12:48");
INSERT INTO userlog VALUES("16","1","Admin CTED","14","","203.82.207.81","2023-06-12 23:43:34");
INSERT INTO userlog VALUES("17","1","Admin CTED","14","","203.82.207.81","2023-06-12 23:56:33");
INSERT INTO userlog VALUES("18","1","Admin CTED","14","","203.82.207.81","2023-06-13 01:13:23");
INSERT INTO userlog VALUES("19","1","Admin CTED","14","","203.82.207.81","2023-06-13 15:30:54");
INSERT INTO userlog VALUES("20","4","Super Admin","14","","203.82.207.81","2023-06-13 15:35:43");
INSERT INTO userlog VALUES("21","4","Super Admin","14","","203.82.207.81","2023-06-13 15:35:44");
INSERT INTO userlog VALUES("22","1","Admin CTED","14","","203.82.207.81","2023-06-13 18:59:48");
INSERT INTO userlog VALUES("23","8","User Mamun","15","","203.82.207.81","2023-06-13 19:05:11");
INSERT INTO userlog VALUES("24","1","Admin CTED","14","","203.82.207.81","2023-06-13 21:28:19");
INSERT INTO userlog VALUES("25","4","Super Admin","14","","203.82.207.81","2023-06-13 21:30:51");
INSERT INTO userlog VALUES("26","1","Admin CTED","14","","203.82.207.81","2023-06-13 21:32:16");
INSERT INTO userlog VALUES("27","1","Admin CTED","14","","203.82.207.81","2023-06-13 21:50:40");
INSERT INTO userlog VALUES("28","1","Admin CTED","14","","203.82.207.81","2023-06-14 00:17:29");
INSERT INTO userlog VALUES("29","1","Admin CTED","14","","203.82.207.81","2023-06-14 14:59:02");
INSERT INTO userlog VALUES("30","1","Admin CTED","14","","203.82.207.81","2023-06-14 15:32:02");
INSERT INTO userlog VALUES("31","1","Admin CTED","14","","203.82.207.81","2023-06-14 16:00:56");
INSERT INTO userlog VALUES("32","1","Admin CTED","14","","203.82.207.81","2023-06-14 17:27:55");
INSERT INTO userlog VALUES("33","1","Admin CTED","14","","203.82.207.81","2023-06-14 18:59:54");
INSERT INTO userlog VALUES("34","1","Admin CTED","14","","203.82.207.81","2023-06-14 19:00:06");
INSERT INTO userlog VALUES("35","1","Admin CTED","14","","203.82.207.81","2023-06-14 20:45:41");
INSERT INTO userlog VALUES("36","1","Admin CTED","14","","203.82.207.81","2023-06-14 21:44:50");
INSERT INTO userlog VALUES("37","1","Admin CTED","14","","203.82.207.81","2023-06-14 21:50:23");
INSERT INTO userlog VALUES("38","8","User Mamun","15","","203.82.207.81","2023-06-14 21:53:51");
INSERT INTO userlog VALUES("39","1","Admin CTED","14","","203.82.207.81","2023-06-14 21:54:57");
INSERT INTO userlog VALUES("40","7","User Zilani","15","","203.82.207.81","2023-06-14 21:55:51");
INSERT INTO userlog VALUES("41","1","Admin CTED","14","","203.82.207.81","2023-06-14 21:56:32");
INSERT INTO userlog VALUES("42","1","Admin CTED","14","","203.82.207.81","2023-06-14 21:56:37");
INSERT INTO userlog VALUES("43","1","Admin CTED","14","","203.82.207.81","2023-06-14 21:57:40");
INSERT INTO userlog VALUES("44","1","Admin CTED","14","","203.82.207.81","2023-06-14 22:00:02");
INSERT INTO userlog VALUES("45","1","Admin CTED","14","","203.82.207.81","2023-06-14 22:21:32");
INSERT INTO userlog VALUES("46","8","User Mamun","15","","203.82.207.81","2023-06-14 22:22:57");
INSERT INTO userlog VALUES("47","1","Admin CTED","14","","203.82.207.81","2023-06-14 22:45:36");
INSERT INTO userlog VALUES("48","7","User Zilani","15","","203.82.207.81","2023-06-14 22:46:36");
INSERT INTO userlog VALUES("49","1","Admin CTED","14","","203.82.207.81","2023-06-14 22:47:07");
INSERT INTO userlog VALUES("50","8","User Mamun","15","","203.82.207.81","2023-06-15 16:06:06");
INSERT INTO userlog VALUES("51","7","User Zilani","15","","203.82.207.81","2023-06-15 17:44:41");
INSERT INTO userlog VALUES("52","1","Admin CTED","14","","203.82.207.81","2023-06-15 20:12:29");
INSERT INTO userlog VALUES("53","7","User Zilani","15","","203.82.207.81","2023-06-15 20:16:10");
INSERT INTO userlog VALUES("54","1","Admin CTED","14","","203.82.207.81","2023-06-15 20:44:56");
INSERT INTO userlog VALUES("55","1","Admin CTED","14","","203.82.207.81","2023-06-15 20:44:57");
INSERT INTO userlog VALUES("56","1","Admin CTED","14","","203.82.207.81","2023-06-15 20:44:59");
INSERT INTO userlog VALUES("57","4","Super Admin","14","","203.82.207.81","2023-06-15 20:45:43");
INSERT INTO userlog VALUES("58","4","Super Admin","14","","203.82.207.81","2023-06-15 20:48:02");
INSERT INTO userlog VALUES("59","4","Super Admin","14","","203.82.207.81","2023-06-15 20:49:14");
INSERT INTO userlog VALUES("60","4","Super Admin","14","","203.82.207.81","2023-06-15 20:50:17");
INSERT INTO userlog VALUES("61","4","Super Admin","14","","203.82.207.81","2023-06-15 20:51:09");
INSERT INTO userlog VALUES("62","7","User Zilani","15","","203.82.207.81","2023-06-15 20:52:50");
INSERT INTO userlog VALUES("63","4","Super Admin","14","","203.82.207.81","2023-06-15 20:53:13");
INSERT INTO userlog VALUES("64","4","Super Admin","14","","203.82.207.81","2023-06-15 20:54:04");
INSERT INTO userlog VALUES("65","1","Admin CTED","14","","203.82.207.81","2023-06-15 21:00:34");
INSERT INTO userlog VALUES("66","4","Super Admin","16","","203.82.207.81","2023-06-15 21:09:39");
INSERT INTO userlog VALUES("67","8","User Mamun","15","","203.82.207.81","2023-06-17 14:25:23");
INSERT INTO userlog VALUES("68","1","Admin CTED","14","","203.82.207.81","2023-06-17 14:50:45");
INSERT INTO userlog VALUES("69","1","Admin CTED","14","","203.82.207.81","2023-06-18 01:41:53");
INSERT INTO userlog VALUES("70","8","User Mamun","15","","203.82.207.81","2023-06-18 15:23:47");
INSERT INTO userlog VALUES("71","4","Super Admin","16","","203.82.207.81","2023-06-18 18:29:17");
INSERT INTO userlog VALUES("72","8","User Mamun","15","","203.82.207.81","2023-06-18 22:31:13");
INSERT INTO userlog VALUES("73","1","Admin CTED","14","","203.82.207.81","2023-06-19 17:55:16");
INSERT INTO userlog VALUES("74","4","Super Admin","16","","203.82.207.81","2023-06-19 18:01:34");
INSERT INTO userlog VALUES("75","1","Admin CTED","14","","203.82.207.81","2023-06-19 18:01:57");
INSERT INTO userlog VALUES("76","1","Admin CTED","14","","203.82.207.81","2023-06-19 18:04:38");
INSERT INTO userlog VALUES("77","1","Admin CTED","14","","203.82.207.81","2023-06-19 22:07:28");
INSERT INTO userlog VALUES("78","1","Admin CTED","14","","203.82.207.81","2023-06-19 22:10:52");
INSERT INTO userlog VALUES("79","8","User Mamun","15","","203.82.207.81","2023-06-19 22:44:11");
INSERT INTO userlog VALUES("80","4","Super Admin","16","","203.82.207.81","2023-06-20 16:10:14");
INSERT INTO userlog VALUES("81","8","User Mamun","15","","203.82.207.81","2023-06-20 16:19:15");
INSERT INTO userlog VALUES("82","1","Admin CTED","14","","203.82.207.81","2023-06-20 18:14:41");
INSERT INTO userlog VALUES("83","1","Admin CTED","14","","203.82.207.81","2023-06-20 20:04:47");
INSERT INTO userlog VALUES("84","1","Admin CTED","14","","203.82.207.81","2023-06-20 20:32:15");
INSERT INTO userlog VALUES("85","4","Super Admin","16","","203.82.207.81","2023-06-20 21:03:47");
INSERT INTO userlog VALUES("86","7","User Zilani","15","","203.82.207.81","2023-06-20 21:24:05");
INSERT INTO userlog VALUES("87","4","Super Admin","16","","203.82.207.81","2023-06-20 21:48:45");
INSERT INTO userlog VALUES("88","1","Admin CTED","14","","203.82.207.81","2023-06-20 22:13:50");
INSERT INTO userlog VALUES("89","7","User Zilani","15","","203.82.207.81","2023-06-20 22:21:45");
INSERT INTO userlog VALUES("90","4","Super Admin","16","","203.82.207.81","2023-06-20 23:36:05");
INSERT INTO userlog VALUES("91","1","Admin CTED","14","","203.82.207.81","2023-06-21 01:10:46");
INSERT INTO userlog VALUES("92","1","Admin CTED","14","","203.82.207.81","2023-06-21 01:16:11");
INSERT INTO userlog VALUES("93","8","User Mamun","15","","203.82.207.81","2023-06-21 15:26:06");
INSERT INTO userlog VALUES("94","4","Super Admin","16","","203.82.207.81","2023-06-21 15:45:07");
INSERT INTO userlog VALUES("95","1","Admin CTED","14","","203.82.207.81","2023-06-21 15:55:19");
INSERT INTO userlog VALUES("96","7","User Zilani","15","","203.82.207.81","2023-06-21 15:55:39");
INSERT INTO userlog VALUES("97","8","User Mamun","15","","203.82.207.81","2023-06-21 16:10:29");
INSERT INTO userlog VALUES("98","7","User Zilani","15","","203.82.207.81","2023-06-21 16:56:36");
INSERT INTO userlog VALUES("99","8","User Mamun","15","","203.82.207.81","2023-06-21 16:56:38");
INSERT INTO userlog VALUES("100","8","User Mamun","15","","203.82.207.81","2023-06-21 16:56:44");
INSERT INTO userlog VALUES("101","8","User Mamun","15","","203.82.207.81","2023-06-21 16:58:10");
INSERT INTO userlog VALUES("102","8","User Mamun","15","","203.82.207.81","2023-06-21 16:58:32");
INSERT INTO userlog VALUES("103","8","User Mamun","15","","203.82.207.81","2023-06-21 17:18:23");
INSERT INTO userlog VALUES("104","1","Admin CTED","14","","203.82.207.81","2023-06-21 20:34:26");
INSERT INTO userlog VALUES("105","1","Admin CTED","14","","203.82.207.81","2023-06-21 23:19:43");
INSERT INTO userlog VALUES("106","7","User Zilani","15","","203.82.207.81","2023-06-21 23:28:09");
INSERT INTO userlog VALUES("107","1","Admin CTED","14","","203.82.207.81","2023-06-21 23:36:05");
INSERT INTO userlog VALUES("108","8","User Mamun","15","","203.82.207.81","2023-06-21 23:36:56");
INSERT INTO userlog VALUES("109","1","Admin CTED","14","","203.82.207.81","2023-06-21 23:38:06");
INSERT INTO userlog VALUES("110","8","User Mamun","15","","203.82.207.81","2023-06-22 15:17:56");
INSERT INTO userlog VALUES("111","1","Admin CTED","14","","203.82.207.81","2023-06-22 15:32:42");
INSERT INTO userlog VALUES("112","1","Admin CTED","14","","203.82.207.81","2023-06-22 15:50:53");
INSERT INTO userlog VALUES("113","1","Admin CTED","14","","203.82.207.81","2023-06-22 17:09:38");
INSERT INTO userlog VALUES("114","1","Admin CTED","14","","203.82.207.81","2023-06-22 17:35:45");
INSERT INTO userlog VALUES("115","1","Admin CTED","14","","203.82.207.81","2023-06-22 17:36:03");
INSERT INTO userlog VALUES("116","1","Admin CTED","14","","203.82.207.81","2023-06-22 18:08:54");
INSERT INTO userlog VALUES("117","1","Admin CTED","14","","203.82.207.81","2023-06-22 21:28:15");
INSERT INTO userlog VALUES("118","8","User Mamun","15","","203.82.207.81","2023-06-23 00:32:15");
INSERT INTO userlog VALUES("119","1","Admin CTED","14","","203.82.207.81","2023-06-24 16:04:14");
INSERT INTO userlog VALUES("120","8","User Mamun","15","","203.82.207.81","2023-06-24 16:18:29");
INSERT INTO userlog VALUES("121","8","User Mamun","15","","203.82.207.81","2023-06-25 16:40:12");
INSERT INTO userlog VALUES("122","1","Admin CTED","14","","203.82.207.81","2023-06-25 21:46:57");
INSERT INTO userlog VALUES("123","8","User Mamun","15","","203.82.207.81","2023-06-26 14:34:42");
INSERT INTO userlog VALUES("124","8","User Mamun","15","","203.82.207.81","2023-06-27 15:46:02");
INSERT INTO userlog VALUES("125","8","User Mamun","15","","203.82.207.81","2023-06-28 00:00:31");
INSERT INTO userlog VALUES("126","8","User Mamun","15","","203.82.207.81","2023-06-28 16:03:22");
INSERT INTO userlog VALUES("127","8","User Mamun","15","","203.82.207.81","2023-07-01 16:13:18");
INSERT INTO userlog VALUES("128","8","User Mamun","15","","203.82.207.81","2023-07-02 15:11:06");
INSERT INTO userlog VALUES("129","8","User Mamun","15","","203.82.207.81","2023-07-02 22:46:39");
INSERT INTO userlog VALUES("130","1","Admin CTED","14","","203.82.207.81","2023-07-03 00:39:54");
INSERT INTO userlog VALUES("131","8","User Mamun","15","","203.82.207.81","2023-07-03 14:44:33");
INSERT INTO userlog VALUES("132","8","User Mamun","15","","203.82.207.81","2023-07-03 22:46:45");
INSERT INTO userlog VALUES("133","8","User Mamun","15","","203.82.207.81","2023-07-04 15:07:57");
INSERT INTO userlog VALUES("134","8","User Mamun","15","","203.82.207.81","2023-07-04 23:27:33");
INSERT INTO userlog VALUES("135","8","User Mamun","15","","203.82.207.81","2023-07-05 14:19:14");
INSERT INTO userlog VALUES("136","1","Admin CTED","14","","203.82.207.81","2023-07-05 18:17:13");
INSERT INTO userlog VALUES("137","8","User Mamun","15","","203.82.207.81","2023-07-06 16:11:08");
INSERT INTO userlog VALUES("138","8","User Mamun","15","","203.82.207.81","2023-07-06 19:59:37");
INSERT INTO userlog VALUES("139","7","User Zilani","15","","203.82.207.81","2023-07-06 23:32:10");
INSERT INTO userlog VALUES("140","8","User Mamun","15","","203.82.207.81","2023-07-08 16:19:28");
INSERT INTO userlog VALUES("141","8","User Mamun","15","","203.82.207.81","2023-07-08 20:32:18");
INSERT INTO userlog VALUES("142","8","User Mamun","15","","203.82.207.81","2023-07-09 15:12:09");
INSERT INTO userlog VALUES("143","8","User Mamun","15","","203.82.207.81","2023-07-10 00:04:25");
INSERT INTO userlog VALUES("144","8","User Mamun","15","","203.82.207.81","2023-07-10 15:08:45");
INSERT INTO userlog VALUES("145","1","Admin CTED","14","","203.82.207.81","2023-07-10 15:56:41");
INSERT INTO userlog VALUES("146","1","Admin CTED","14","","203.82.207.81","2023-07-10 22:09:37");
INSERT INTO userlog VALUES("147","8","User Mamun","15","","203.82.207.81","2023-07-11 15:56:12");
INSERT INTO userlog VALUES("148","8","User Mamun","15","","203.82.207.81","2023-07-12 15:36:41");
INSERT INTO userlog VALUES("149","8","User Mamun","15","","203.82.207.81","2023-07-13 00:05:09");
INSERT INTO userlog VALUES("150","8","User Mamun","15","","203.82.207.81","2023-07-13 15:08:21");
INSERT INTO userlog VALUES("151","7","User Zilani","15","","203.82.207.81","2023-07-13 17:05:07");
INSERT INTO userlog VALUES("152","1","Admin CTED","14","","203.82.207.81","2023-07-13 17:08:45");
INSERT INTO userlog VALUES("153","1","Admin CTED","14","","203.82.207.81","2023-07-13 17:08:49");
INSERT INTO userlog VALUES("154","1","Admin CTED","14","","203.82.207.81","2023-07-13 17:32:22");
INSERT INTO userlog VALUES("155","8","User Mamun","15","","203.82.207.81","2023-07-13 23:32:06");
INSERT INTO userlog VALUES("156","8","User Mamun","15","","203.82.207.81","2023-07-15 16:09:59");
INSERT INTO userlog VALUES("157","1","Admin CTED","14","","203.82.207.81","2023-07-15 23:18:48");
INSERT INTO userlog VALUES("158","1","Admin CTED","14","","203.82.207.81","2023-07-15 23:18:49");
INSERT INTO userlog VALUES("159","8","User Mamun","15","","203.82.207.81","2023-07-16 16:22:06");
INSERT INTO userlog VALUES("160","1","Admin CTED","14","","203.82.207.81","2023-07-17 00:06:21");
INSERT INTO userlog VALUES("161","8","User Mamun","15","","203.82.207.81","2023-07-17 15:54:04");
INSERT INTO userlog VALUES("162","8","User Mamun","15","","203.82.207.81","2023-07-17 23:47:37");
INSERT INTO userlog VALUES("163","8","User Mamun","15","","203.82.207.81","2023-07-19 15:25:54");
INSERT INTO userlog VALUES("164","8","User Mamun","15","","203.82.207.81","2023-07-20 15:17:01");
INSERT INTO userlog VALUES("165","1","Admin CTED","14","","203.82.207.81","2023-07-20 16:19:59");
INSERT INTO userlog VALUES("166","1","Admin CTED","14","","203.82.207.81","2023-07-20 21:27:03");
INSERT INTO userlog VALUES("167","1","Admin CTED","14","","203.82.207.81","2023-07-20 23:02:35");
INSERT INTO userlog VALUES("168","7","User Zilani","15","","203.82.207.81","2023-07-20 23:31:38");
INSERT INTO userlog VALUES("169","8","User Mamun","15","","203.82.207.81","2023-07-21 00:42:26");
INSERT INTO userlog VALUES("170","8","User Mamun","15","","203.82.207.81","2023-07-21 23:23:59");
INSERT INTO userlog VALUES("171","8","User Mamun","15","","203.82.207.81","2023-07-23 14:57:50");
INSERT INTO userlog VALUES("172","8","User Mamun","15","","203.82.207.81","2023-07-24 15:33:55");
INSERT INTO userlog VALUES("173","8","User Mamun","15","","203.82.207.81","2023-07-25 15:05:50");
INSERT INTO userlog VALUES("174","4","Super Admin","16","","203.82.207.81","2023-07-25 15:28:13");
INSERT INTO userlog VALUES("175","1","Admin CTED","14","","203.82.207.81","2023-07-25 16:20:52");
INSERT INTO userlog VALUES("176","8","User Mamun","15","","203.82.207.81","2023-07-25 22:07:49");
INSERT INTO userlog VALUES("177","8","User Mamun","15","","203.82.207.81","2023-07-26 15:04:21");
INSERT INTO userlog VALUES("178","1","Admin CTED","14","","203.82.207.81","2023-07-26 18:04:03");
INSERT INTO userlog VALUES("179","1","Admin CTED","14","","203.82.207.81","2023-07-26 18:31:07");
INSERT INTO userlog VALUES("180","1","Admin CTED","14","","203.82.207.81","2023-07-26 18:31:59");
INSERT INTO userlog VALUES("181","7","User Zilani","15","","203.82.207.81","2023-07-26 20:05:15");
INSERT INTO userlog VALUES("182","1","Admin CTED","14","","203.82.207.81","2023-07-26 23:17:59");
INSERT INTO userlog VALUES("183","8","User Mamun","15","","203.82.207.81","2023-07-29 21:19:03");
INSERT INTO userlog VALUES("184","8","User Mamun","15","","203.82.207.81","2023-07-30 22:02:25");
INSERT INTO userlog VALUES("185","8","User Mamun","15","","203.82.207.81","2023-07-31 15:49:05");
INSERT INTO userlog VALUES("186","8","User Mamun","15","","203.82.207.81","2023-07-31 23:33:54");
INSERT INTO userlog VALUES("187","8","User Mamun","15","","203.82.207.81","2023-08-01 16:28:28");
INSERT INTO userlog VALUES("188","8","User Mamun","15","","203.82.207.81","2023-08-01 23:26:16");
INSERT INTO userlog VALUES("189","1","Admin CTED","14","","203.82.207.81","2023-08-02 20:38:20");
INSERT INTO userlog VALUES("190","8","User Mamun","15","","203.82.207.81","2023-08-02 22:21:34");
INSERT INTO userlog VALUES("191","1","Admin CTED","14","","203.82.207.81","2023-08-03 17:40:55");
INSERT INTO userlog VALUES("192","8","User Mamun","15","","203.82.207.81","2023-08-03 22:23:21");
INSERT INTO userlog VALUES("193","8","User Mamun","15","","203.82.207.81","2023-08-03 23:52:55");
INSERT INTO userlog VALUES("194","8","User Mamun","15","","203.82.207.81","2023-08-05 15:36:00");
INSERT INTO userlog VALUES("195","8","User Mamun","15","","203.82.207.81","2023-08-08 16:20:27");
INSERT INTO userlog VALUES("196","8","User Mamun","15","","203.82.207.81","2023-08-08 17:53:11");
INSERT INTO userlog VALUES("197","8","User Mamun","15","","203.82.207.81","2023-08-09 15:13:07");
INSERT INTO userlog VALUES("198","8","User Mamun","15","","203.82.207.81","2023-08-10 00:22:49");
INSERT INTO userlog VALUES("199","8","User Mamun","15","","203.82.207.81","2023-08-10 15:46:10");
INSERT INTO userlog VALUES("200","8","User Mamun","15","","203.82.207.81","2023-08-12 23:44:55");
INSERT INTO userlog VALUES("201","8","User Mamun","15","","203.82.207.81","2023-08-14 23:58:18");
INSERT INTO userlog VALUES("202","8","User Mamun","15","","203.82.207.81","2023-08-15 15:19:46");
INSERT INTO userlog VALUES("203","8","User Mamun","15","","203.82.207.81","2023-08-15 23:40:43");
INSERT INTO userlog VALUES("204","8","User Mamun","15","","203.82.207.81","2023-08-16 15:22:55");
INSERT INTO userlog VALUES("205","7","User Zilani","15","","203.82.207.81","2023-08-16 17:57:16");
INSERT INTO userlog VALUES("206","8","User Mamun","15","","203.82.207.81","2023-08-17 16:33:14");
INSERT INTO userlog VALUES("207","1","Admin CTED","14","","203.82.207.81","2023-08-17 17:51:24");
INSERT INTO userlog VALUES("208","8","User Mamun","15","","203.82.207.81","2023-08-19 14:59:49");
INSERT INTO userlog VALUES("209","8","User Mamun","15","","203.82.207.81","2023-08-19 23:32:10");
INSERT INTO userlog VALUES("210","1","Admin CTED","14","","203.82.207.81","2023-08-20 20:19:27");
INSERT INTO userlog VALUES("211","8","User Mamun","15","","203.82.207.81","2023-08-20 23:47:01");
INSERT INTO userlog VALUES("212","1","Admin CTED","14","","203.82.207.81","2023-08-21 17:18:07");
INSERT INTO userlog VALUES("213","1","Admin CTED","14","","203.82.207.81","2023-08-22 18:47:28");
INSERT INTO userlog VALUES("214","1","Admin CTED","14","","203.82.207.81","2023-08-22 21:48:49");
INSERT INTO userlog VALUES("215","8","User Mamun","15","","203.82.207.81","2023-08-22 22:03:14");
INSERT INTO userlog VALUES("216","1","Admin CTED","14","","203.82.207.81","2023-08-22 22:35:12");
INSERT INTO userlog VALUES("217","8","User Mamun","15","","203.82.207.81","2023-08-23 15:07:30");
INSERT INTO userlog VALUES("218","8","User Mamun","15","","203.82.207.81","2023-08-24 15:44:34");
INSERT INTO userlog VALUES("219","7","User Zilani","15","","203.82.207.81","2023-08-24 18:30:04");
INSERT INTO userlog VALUES("220","8","User Mamun","15","","203.82.207.81","2023-08-25 00:40:03");
INSERT INTO userlog VALUES("221","8","User Mamun","15","","203.82.207.81","2023-08-26 14:47:56");
INSERT INTO userlog VALUES("222","1","Admin CTED","14","","203.82.207.81","2023-08-27 15:36:47");
INSERT INTO userlog VALUES("223","1","Admin CTED","14","","203.82.207.81","2023-08-27 15:53:10");
INSERT INTO userlog VALUES("224","7","User Zilani","15","","203.82.207.81","2023-08-27 16:02:48");
INSERT INTO userlog VALUES("225","8","User Mamun","15","","203.82.207.81","2023-08-27 16:42:35");
INSERT INTO userlog VALUES("226","7","User Zilani","15","","203.82.207.81","2023-08-27 18:57:12");
INSERT INTO userlog VALUES("227","1","Admin CTED","14","","203.82.207.81","2023-08-27 23:19:55");
INSERT INTO userlog VALUES("228","8","User Mamun","15","","203.82.207.81","2023-08-27 23:34:22");
INSERT INTO userlog VALUES("229","8","User Mamun","15","","203.82.207.81","2023-08-28 15:06:10");
INSERT INTO userlog VALUES("230","7","User Zilani","15","","203.82.207.81","2023-08-28 15:39:37");
INSERT INTO userlog VALUES("231","7","User Zilani","15","","::1","2023-08-28 22:52:24");
INSERT INTO userlog VALUES("232","7","User Zilani","15","","::1","2023-08-29 15:29:46");
INSERT INTO userlog VALUES("233","1","Admin CTED","14","","::1","2023-08-30 15:20:30");
INSERT INTO userlog VALUES("234","1","Admin CTED","14","","::1","2023-09-03 15:44:57");
INSERT INTO userlog VALUES("235","1","Admin INV","14","","::1","2023-09-03 15:56:53");
INSERT INTO userlog VALUES("236","1","Admin INV","14","","::1","2023-09-04 15:46:05");
INSERT INTO userlog VALUES("237","1","Admin INV","14","","::1","2023-09-05 15:38:18");
INSERT INTO userlog VALUES("238","1","Admin INV","14","","::1","2023-09-07 15:32:17");
INSERT INTO userlog VALUES("239","1","Admin INV","14","","::1","2023-09-19 16:56:14");
INSERT INTO userlog VALUES("240","1","Admin INV","14","","::1","2023-09-19 18:06:37");
INSERT INTO userlog VALUES("241","1","Admin INV","14","","::1","2023-09-20 15:31:05");
INSERT INTO userlog VALUES("242","1"," ","1","","::1","2023-09-20 15:41:06");
INSERT INTO userlog VALUES("243","1","88i Admin","1","","::1","2023-09-20 15:42:01");
INSERT INTO userlog VALUES("244","1","88i Admin","14","","::1","2023-09-20 15:42:53");
INSERT INTO userlog VALUES("245","1","88i Admin","14","","::1","2023-09-20 20:56:26");
INSERT INTO userlog VALUES("246","1","88i Admin","14","","::1","2023-09-21 15:51:52");
INSERT INTO userlog VALUES("247","1","88i Admin","14","","::1","2023-09-21 17:00:11");
INSERT INTO userlog VALUES("248","1","88i Admin","14","","::1","2023-09-21 20:32:10");
INSERT INTO userlog VALUES("249","1","88i Admin","14","","::1","2023-09-21 22:10:11");
INSERT INTO userlog VALUES("250","3374"," ","3","","::1","2023-09-21 23:03:33");
INSERT INTO userlog VALUES("251","1","88i Admin","14","","::1","2023-09-21 23:06:29");
INSERT INTO userlog VALUES("252","1","88i Admin","14","","::1","2023-09-24 16:10:45");
INSERT INTO userlog VALUES("253","1","88i Admin","14","","::1","2023-09-24 20:59:17");
INSERT INTO userlog VALUES("254","1","88i Admin","14","","::1","2023-09-26 15:33:08");
INSERT INTO userlog VALUES("255","1","88i Admin","14","","::1","2023-10-01 18:08:37");
INSERT INTO userlog VALUES("256","1","88i Admin","14","","::1","2023-10-01 18:25:22");
INSERT INTO userlog VALUES("257","1","88i Admin","14","","::1","2023-10-01 22:50:01");
INSERT INTO userlog VALUES("258","1","88i Admin","14","","::1","2023-10-04 23:27:49");
INSERT INTO userlog VALUES("259","1","88i Admin","14","","::1","2023-10-05 15:36:46");
INSERT INTO userlog VALUES("260","1","88i Admin","14","","::1","2023-10-12 18:09:51");
INSERT INTO userlog VALUES("261","1","88i Admin","14","","::1","2023-11-13 16:48:35");
INSERT INTO userlog VALUES("262","1","88i Admin","14","","::1","2023-11-14 10:20:30");
INSERT INTO userlog VALUES("263","1","88i Admin","14","","::1","2023-11-14 13:27:44");
INSERT INTO userlog VALUES("264","1","88i Admin","14","","::1","2023-11-15 09:41:56");
INSERT INTO userlog VALUES("265","1","88i Admin","14","","::1","2023-11-15 11:33:51");
INSERT INTO userlog VALUES("266","1","88i Admin","14","","::1","2023-11-15 11:52:26");
INSERT INTO userlog VALUES("267","1","88i Admin","14","","::1","2023-11-15 14:13:14");
INSERT INTO userlog VALUES("268","1","88i Admin","14","","::1","2023-11-16 09:58:19");
INSERT INTO userlog VALUES("269","1","88i Admin","14","","::1","2023-11-19 10:47:48");
INSERT INTO userlog VALUES("270","1","88i Admin","14","","::1","2023-11-27 09:36:13");
INSERT INTO userlog VALUES("271","1","88i Admin","14","","::1","2023-11-28 10:13:51");
INSERT INTO userlog VALUES("272","3378","88i Admin","14","","::1","2023-11-30 10:10:53");
INSERT INTO userlog VALUES("273","3378","88i Admin","14","","::1","2023-11-30 10:11:28");
INSERT INTO userlog VALUES("274","3378","88i Admin","14","","::1","2023-12-03 12:34:59");
INSERT INTO userlog VALUES("275","3378","88i Admin","14","","::1","2023-12-03 13:02:36");
INSERT INTO userlog VALUES("276","3378","88i Admin","14","","::1","2023-12-04 09:50:59");
INSERT INTO userlog VALUES("277","3378","88i Admin","14","","::1","2023-12-04 11:47:11");
INSERT INTO userlog VALUES("278","3378","88i Admin","14","","::1","2023-12-04 11:50:11");
INSERT INTO userlog VALUES("279","3378","88i Admin","14","","::1","2023-12-04 14:22:16");
INSERT INTO userlog VALUES("280","3378","88i Admin","14","","::1","2023-12-04 14:25:07");
INSERT INTO userlog VALUES("281","3378","88i Admin","14","","::1","2023-12-04 14:36:41");
INSERT INTO userlog VALUES("282","3378","88i Admin","14","","::1","2023-12-04 14:36:58");
INSERT INTO userlog VALUES("283","3374"," ","3","","::1","2023-12-04 14:45:04");
INSERT INTO userlog VALUES("284","3375"," ","5","","::1","2023-12-04 14:46:04");
INSERT INTO userlog VALUES("285","3378","88i Admin","14","","::1","2023-12-04 14:47:47");
INSERT INTO userlog VALUES("286","3378","88i Admin","14","","::1","2023-12-04 14:51:18");
INSERT INTO userlog VALUES("287","3374"," ","3","","::1","2023-12-04 15:02:54");
INSERT INTO userlog VALUES("288","3378","88i Admin","14","","::1","2023-12-04 15:05:13");
INSERT INTO userlog VALUES("289","3378","88i Admin","14","","::1","2023-12-04 15:08:25");
INSERT INTO userlog VALUES("290","3378","88i Admin","14","","::1","2023-12-05 09:44:56");
INSERT INTO userlog VALUES("291","3378","88i Admin","14","","::1","2023-12-06 09:48:45");
INSERT INTO userlog VALUES("292","3378","88i Admin","14","","::1","2023-12-07 10:06:52");
INSERT INTO userlog VALUES("293","3374"," ","3","","::1","2023-12-07 11:42:40");
INSERT INTO userlog VALUES("294","3378","88i Admin","14","","::1","2023-12-10 09:51:56");
INSERT INTO userlog VALUES("295","3374"," ","3","","::1","2023-12-10 10:09:13");
INSERT INTO userlog VALUES("296","3374"," ","3","","::1","2023-12-10 10:23:46");
INSERT INTO userlog VALUES("297","3378","88i Admin","14","","::1","2023-12-10 10:35:43");
INSERT INTO userlog VALUES("298","3372"," ","21","","::1","2023-12-10 10:39:07");
INSERT INTO userlog VALUES("299","3373"," ","13","","::1","2023-12-10 10:39:25");
INSERT INTO userlog VALUES("300","3372"," ","21","","::1","2023-12-10 10:39:47");
INSERT INTO userlog VALUES("301","3378","88i Admin","14","","::1","2023-12-10 10:58:22");
INSERT INTO userlog VALUES("302","3374"," ","3","","::1","2023-12-10 13:08:34");
INSERT INTO userlog VALUES("303","3373"," ","13","","::1","2023-12-10 13:09:03");
INSERT INTO userlog VALUES("304","3372"," ","21","","::1","2023-12-10 13:09:55");
INSERT INTO userlog VALUES("305","3378","88i Admin","14","","::1","2023-12-10 13:10:18");
INSERT INTO userlog VALUES("306","3378","88i Admin","14","","::1","2023-12-11 09:58:01");
INSERT INTO userlog VALUES("307","3378","88i Admin","14","","::1","2023-12-11 16:01:37");
INSERT INTO userlog VALUES("308","3378","88i Admin","14","","::1","2023-12-12 10:07:00");



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
) ENGINE=InnoDB AUTO_INCREMENT=3379 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","16","130","1","SA-000001","14","6","1","10","sa","88 IT Admin","admin@admin.com","","","16919031921667818730Nahid-Hasan-Sign1.png","e10adc3949ba59abbe56e057f20f883e","1","1","88i","Admin","admin","1","0","2020-03-16 21:03:06","1","2023-08-13 17:06:32");
INSERT INTO users VALUES("3372","16","131","1","IEL-000002","21","3","0","112","g20","Tarafder Md Ruhul Saif","s@gmail.com","","","","e10adc3949ba59abbe56e057f20f883e","0","1","","","","0","0","2023-07-30 16:56:08","0","0000-00-00 00:00:00");
INSERT INTO users VALUES("3373","16","131","1","IEL-000005","13","2","0","15","g14","Md Jobaer Kabir","jk@gmail.com","","","","e10adc3949ba59abbe56e057f20f883e","0","1","","","","0","0","2023-07-30 16:56:41","0","0000-00-00 00:00:00");
INSERT INTO users VALUES("3374","16","129","1","IEL-000020","3","2","0","2","g10","Md. Babul Farajee","bf@gmail.com","","","16919032131669633451Zakir-Hussain-handwritten-signature-500x340-removebg-preview.png","e10adc3949ba59abbe56e057f20f883e","1","1","","","","0","0","2023-07-30 16:57:40","1","2023-08-13 17:06:53");
INSERT INTO users VALUES("3375","16","130","1","IEL-000017","5","1","0","1","g8","Atiqur Rahman Bhuiyan","a@gmail.com","01729714503","","","e10adc3949ba59abbe56e057f20f883e","0","1","","","","0","0","2023-07-30 17:09:21","1","2023-08-01 07:39:06");
INSERT INTO users VALUES("3377","16","130","1","IEL-000016","18","2","0","2","g11","Muhammed Fakhrul Islam","fp@gmail.com","123456","","","e10adc3949ba59abbe56e057f20f883e","0","1","","","","0","0","2023-08-01 07:41:37","0","0000-00-00 00:00:00");
INSERT INTO users VALUES("3378","16","130","1","admin@saifpowertec.com","14","6","1","10","sa","88 IT Admin","admin@saifpowertec.com","","","16919031921667818730Nahid-Hasan-Sign1.png","77420bb74cf785398911d47854a2bfab","1","1","88i","Admin","admin","1","0","2020-03-16 21:03:06","1","2023-08-13 17:06:32");



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

INSERT INTO users2 VALUES("1","1","Admin","INV","admin","1","1","14","admin@admin.com","e10adc3949ba59abbe56e057f20f883e","1","b1970adb3f301c8440c81e45b526060c","1","0","PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr","1","1","2019-01-14 12:17:02","2019-01-21 08:36:38","0000-00-00 00:00:00");
INSERT INTO users2 VALUES("4","4","Super","Admin","superAdmin","1","1","16","superadmin@admin.com","be05977add575832dc52655d4ad5c42e","1","b1970adb3f301c8440c81e45b526060c","1","0","PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr","4","4","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO users2 VALUES("7","1","User","Zilani","whm","1","1","15","zilani@cted.com","dbe174b9745efb86baea199a90cb4a81","1","b1970adb3f301c8440c81e45b526060c","1","0","PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr","1","1","2019-01-14 12:17:02","2019-01-21 08:36:38","0000-00-00 00:00:00");
INSERT INTO users2 VALUES("8","1","User","Mamun","whm","1","1","15","mamun@cted.com","43406defbf583b87cb4eb008d0a7fc95","1","b1970adb3f301c8440c81e45b526060c","1","0","PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr","1","1","2019-01-14 12:17:02","2019-01-21 08:36:38","0000-00-00 00:00:00");

