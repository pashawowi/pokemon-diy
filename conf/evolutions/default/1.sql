# --- !Ups
CREATE TYPE gender AS ENUM ('Male', 'Female', 'Unknown');
CREATE TYPE "type" AS ENUM ('Bug', 'Dark', 'Dragon', 'Electric', 'Fairy', 'Fighting', 'Fire', 'Flying', 'Ghost', 'Grass',
  'Ground', 'Ice', 'Normal', 'Poison', 'Psychic', 'Rock', 'Steel', 'Water', 'Unknown');
CREATE TYPE egg_group AS ENUM ('Amorphous', 'Bug', 'Ditto', 'Dragon', 'Fairy', 'Field', 'Flying', 'Grass', 'Human like',
  'Mineral', 'Monster', 'Water I', 'Water II', 'Water III', 'Undiscovered', 'Gender unknown');
CREATE TYPE stat AS ENUM ('HP', 'Attack', 'Defense', 'Special attack', 'Special defense', 'Speed');
CREATE TYPE move_category AS ENUM ('Physical', 'Special', 'Status');

CREATE TABLE pokemon (
  id INTEGER PRIMARY KEY,
  chinese_name TEXT NOT NULL,
  english_name TEXT NOT NULL,
  description TEXT,
  type_1 "type" NOT NULL,
  type_2 "type",
  ability_1 INTEGER REFERENCES ability (id) NOT NULL,
  ability_2 INTEGER REFERENCES ability (id),
  ability_3 INTEGER REFERENCES ability (id),
  full_exp INTEGER NOT NULL,
  height REAL NOT NULL, -- meter
  weight REAL NOT NULL, -- kilo gramme
  male_rate REAL NOT NULL, -- percentage
  catch_rate INTEGER NOT NULL, -- [0, 255]
  birth_period INTEGER NOT NULL,
  base_stat JSONB NOT NULL, -- in form {stat: number}
  base_exp INTEGER NOT NULL,
  species_hp INTEGER NOT NULL,
  species_attack INTEGER NOT NULL,
  species_defense INTEGER NOT NULL,
  species_sa INTEGER NOT NULL,
  species_sd INTEGER NOT NULL,
  species_speed INTEGER NOT NULL,
  evolve_from INTEGER REFERENCES pokemon (id),
  evolve_to INTEGER REFERENCES pokemon (id),
  evolve_item INTEGER REFERENCES item (id),
  learnable_move JSONB, -- {level: move_id}
  useable_tm JSONB, -- An array of id
  inherit_move JSONB -- An array of id
);

CREATE TABLE ability (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE item (
  id SERIAL PRIMARY KEY, -- NOTE: The ID is not important in the games.
  description TEXT NOT NULL
);

CREATE TABLE move (
  id INTEGER PRIMARY KEY,
  chinese_name TEXT NOT NULL,
  english_name TEXT NOT NULL,
  description TEXT NOT NULL,
  "type" "type" NOT NULL,
  category move_category NOT NULL,
  power INTEGER NOT NULL,
  accuracy INTEGER NOT NULL, -- percentage
  pp INTEGER NOT NULL
);



INSERT INTO move VALUES(1, 	 '拍击',    	  'Pound', 	        '',   'Normal',   	'Physical', 	40, 	100, 	35);
INSERT INTO move VALUES(2, 	 '手刀', 	    'Karate Chop', 	  '',   'Fighting',   'Physical',  	50, 	100, 	25);
INSERT INTO move VALUES(3,	 '连环巴掌', 	  'Double Slap',    '',   'Normal',   	'Physical',  	15, 	85, 	10);
INSERT INTO move VALUES(4,	 '连续拳',     'Comet Punch',    '',   'Normal',   	'Physical',  	18, 	85, 	15);
INSERT INTO move VALUES(5, 	 '百万吨拳击',  'Mega Punch',     '', 	'Normal',   	'Physical',  	80, 	85, 	20);
INSERT INTO move VALUES(6, 	 '聚宝功', 	  'Pay Day',        '', 	'Normal',   	'Physical',  	40, 	100, 	20);
INSERT INTO move VALUES(7, 	 '火焰拳',     'Fire Punch',     '',	  'Fire',       'Physical', 	75, 	100, 	15);
INSERT INTO move VALUES(8, 	 '急冻拳', 	 	'Ice Punch',   	  '',   'Ice',        'Physical', 	75, 	100, 	15);
INSERT INTO move VALUES(9, 	 '雷光掌',     'Thunder Punch',  '',   'Electric',   'Physical',  	75, 	100, 	15);
INSERT INTO move VALUES(10,	 '利爪',     	'Scratch', 	      '',   'Normal',   	'Physical',  	40, 	100, 	35);
INSERT INTO move VALUES(11,	 '剪断',     	'Vice Grip',      '', 	'Normal',   	'Physical',  	55, 	100, 	30);
INSERT INTO move VALUES(12,	 '剪刀断头台', 	'Guillotine',     '', 	'Normal',   	'Physical', 	0,  	0,  	5);
INSERT INTO move VALUES(13,	 '旋风刀',   	'Razor Wind',     '', 	'Normal',   	'Special',  	80, 	100, 	10);
INSERT INTO move VALUES(14,	 '剑舞',      	'Swords Dance',  	'',   'Normal',     'Status', 	  0,    0,  	20);
INSERT INTO move VALUES(15,	 '一字斩', 	 	'Cut',            '', 	'Normal',   	'Physical',  	50, 	95, 	30);
INSERT INTO move VALUES(16,	 '烈暴风', 	 	'Gust',           '',   'Flying',     'Special',  	40, 	100, 	35);
INSERT INTO move VALUES(17,	 '翅膀攻击', 	 	'Wing Attack', 	  '',   'Flying',     'Physical', 	60, 	100, 	35);
INSERT INTO move VALUES(18,	 '旋风', 	  	'Whirlwind',      '',  	'Normal',     'Status',   	0,   	100, 	20);
INSERT INTO move VALUES(19,	 '飞翔', 	  	'Fly',            '',   'Flying',     'Physical', 	90, 	95, 	15);
INSERT INTO move VALUES(20,	 '绑紧', 	  	'Bind',           '',   'Normal',   	'Physical',  	15, 	85, 	20);
INSERT INTO move VALUES(21,	 '摔打', 	  	'Slam',           '',   'Normal',   	'Physical',  	80, 	75, 	20);
INSERT INTO move VALUES(22,	 '藤鞭', 	  	'Vine Whip',      '',   'Grass',      'Physical', 	45, 	100, 	25);
INSERT INTO move VALUES(23,	 '践踏', 	 	  'Stomp', 	        '',   'Normal',   	'Physical',  	65, 	100, 	20);
INSERT INTO move VALUES(24,	 '连环腿',   	'Double Kick',    '',   'Fighting',   'Physical', 	30, 	100, 	30);
INSERT INTO move VALUES(25,	 '百万吨飞腿',  'Mega Kick',     '',   	'Normal',     'Physical', 	120, 	75, 	5);
INSERT INTO move VALUES(26,	 '飞踢', 	  	'Jump Kick',      '',   'Fighting',   'Physical',  	100, 	95, 	10);
INSERT INTO move VALUES(27,	 '旋风腿', 	 	'Rolling Kick', 	'',   'Fighting',   'Physical', 	60, 	85, 	15);
INSERT INTO move VALUES(28,	 '飞沙脚', 	 	'Sand Attack',    '',   'Ground',     'Physical',   0,  	100, 	15);
INSERT INTO move VALUES(29,	 '铁头功', 	 	'Headbutt',       '',   'Normal',   	'Physical',  	70, 	100, 	15);
INSERT INTO move VALUES(30,	 '角撞', 	  	'Horn Attack',    '',   'Normal',   	'Physical',  	65, 	100, 	25);
INSERT INTO move VALUES(31,	 '疯狂攻击',	 	'Fury Attack',    '',   'Normal',   	'Physical',   15, 	85, 	20);
INSERT INTO move VALUES(32,	 '独角钻', 	 	'Horn Drill',     '',   'Normal',   	'Physical',   0,    0,  	5);
INSERT INTO move VALUES(33,	 '冲击',      	'Tackle',         '',   'Normal',   	'Physical',  	50, 	100, 	35);
INSERT INTO move VALUES(34,	 '泰山压顶',  	'Body Slam',      '',   'Normal',   	'Physical',  	85, 	100, 	15);
INSERT INTO move VALUES(35,	 '捆绑', 	  	'Wrap',           '',   'Normal',   	'Physical',   15,   90, 	20);
INSERT INTO move VALUES(36,  '猛撞', 	   	'Take Down',      '',   'Normal',   	'Physical',   90, 	85, 	20);
INSERT INTO move VALUES(37,	 '横冲直撞',  	'Thrash',         '',   'Normal',   	'Physical',  	120, 	100, 	10);
INSERT INTO move VALUES(38,	 '舍身冲撞',  	'Double-Edge',    '',   'Normal',   	'Physical',  	120, 	100, 	15);
INSERT INTO move VALUES(39,	 '摇尾巴', 	 	'Tail Whip',      '',   'Normal',     'Status',    	0,  	100, 	30);
INSERT INTO move VALUES(40,	 '毒针', 	 	  'Poison Sting',   '',   'Poison',     'Physical',   15,  	100, 	35);
INSERT INTO move VALUES(41,	 '双针', 	  	'Twineedle',      '',   'Bug',        'Physical',  	25, 	100, 	20);
INSERT INTO move VALUES(42,	 '飞弹针', 	 	'Pin Missile',    '',   'Bug',        'Physical', 	25, 	95, 	20);
INSERT INTO move VALUES(43,	 '瞪眼', 	  	'Leer',           '',   'Normal',     'Status',    	0,  	100, 	30);
INSERT INTO move VALUES(44,	 '咬住', 	  	'Bite',           '',   'Dark',       'Physical', 	60, 	100, 	25);
INSERT INTO move VALUES(45,	 '嚎叫', 	  	'Growl',          '',   'Normal',     'Status',    	0, 	  100, 	40);
INSERT INTO move VALUES(46,	 '吼叫', 	  	'Roar',           '',   'Normal',     'Status',   	0, 	  0, 	  20);
INSERT INTO move VALUES(47,	 '唱歌', 	  	'Sing',           '',   'Normal',     'Status',   	0,  	55, 	15);
INSERT INTO move VALUES(48,	 '超音波',    	'Supersonic',     '',   'Normal',     'Status',    	0,  	55, 	20);
INSERT INTO move VALUES(49,	 '音爆', 	  	'Sonic Boom',     '',   'Normal',     'Special',  	0,  	90, 	20);
INSERT INTO move VALUES(50,	 '石化功',	  	'Disable',        '',   'Normal',     'Status',    	0, 	  100, 	20);
INSERT INTO move VALUES(51,	 '溶解液',    	'Acid',           '',   'Poison',     'Special',  	40, 	100, 	30);
INSERT INTO move VALUES(52,	 '火花', 	  	'Ember',          '',   'Fire',       'Special',    40, 	100, 	25);
INSERT INTO move VALUES(53,	 '喷射火焰',  	'Flamethrower',   '',   'Fire',       'Special',   	90, 	100, 	15);
INSERT INTO move VALUES(54,	 '白雾', 	  	'Mist',           '',   'Ice',        'Status',     0, 	  0,  	30);
INSERT INTO move VALUES(55,  '水枪', 	  	'Water Gun',      '',   'Water',      'Special', 	 	40, 	100, 	25);
INSERT INTO move VALUES(56,	 '水炮', 	  	'Hydro Pump',     '',   'Water',      'Special',  	110, 	80, 	5);
INSERT INTO move VALUES(57,	 '冲浪', 	  	'Surf',           '',   'Water',      'Special', 	 	90, 	100, 	15);
INSERT INTO move VALUES(58,	 '急冻光线', 		'Ice Beam',       '',   'Ice',        'Special', 	 	90, 	100, 	10);
INSERT INTO move VALUES(59,	 '暴风雪', 	 	'Blizzard',       '',   'Ice',        'Special',    110, 	70, 	5);
INSERT INTO move VALUES(60,	 '幻象光',    	'Psybeam',        '',   'Psychic',    'Special',    65, 	100, 	20);
INSERT INTO move VALUES(61,	 '泡沫光线', 	 	'Bubble Beam',    '',   'Water',      'Special',  	65, 	100, 	20);
INSERT INTO move VALUES(62,	 '极光束', 	 	'Aurora Beam',    '',   'Ice',        'Special',  	65, 	100, 	20);
INSERT INTO move VALUES(63,	 '破坏死光',  	'Hyper Beam',     '',   'Normal',     'Special', 	  150, 	90, 	5);
INSERT INTO move VALUES(64,	 '啄', 	    	'Peck',           '',   'Flying',     'Physical',  	35, 	100, 	35);
INSERT INTO move VALUES(65,	 '冲钻', 	  	'Drill Peck',     '',   'Flying',     'Physical', 	80, 	100, 	20);
INSERT INTO move VALUES(66,	 '地狱滚动',  	'Submission',     '',   'Fighting',   'Physical', 	80, 	80, 	25);
INSERT INTO move VALUES(67,	 '下踢', 	  	'Low Kick',       '',   'Fighting',   'Physical',  	0,  	100, 	20);
INSERT INTO move VALUES(68,	 '返拳', 	  	'Counter',        '',   'Fighting',   'Physical',   0,   	100, 	20);
INSERT INTO move VALUES(69,  '地球上投', 	 	'Seismic Toss',   '',   'Fighting',   'Physical', 	0,  	100, 	20);
INSERT INTO move VALUES(70,	 '劲力', 	  	'Strength',       '',   'Normal',   	'Physical',   80, 	100, 	15);
INSERT INTO move VALUES(71,	 '吸收', 	  	'Absorb',         '',   'Grass',      'Special',   	20, 	100, 	25);
INSERT INTO move VALUES(72,	 '百万吨吸收', 	'Mega Drain',     '',   'Grass',      'Special',    40, 	100, 	15);
INSERT INTO move VALUES(73,	 '寄生种子',  	'Leech Seed',     '',   'Grass',      'Status',    	0,  	90, 	10);
INSERT INTO move VALUES(74,	 '生长', 	  	'Growth',         '',   'Normal',     'Status',    	0,  	0,  	40);
INSERT INTO move VALUES(75,	 '飞叶快刀',  	'Razor Leaf',     '',   'Grass',      'Physical', 	55, 	95, 	25);
INSERT INTO move VALUES(76,  '日光束',    	'Solar Beam',     '',   'Grass',      'Special',  	120, 	100, 	10);
INSERT INTO move VALUES(77,  '毒粉末',    	'Poison Powder',  '',   'Poison',     'Status',    	0,   	75, 	35);
INSERT INTO move VALUES(78,	 '麻痹粉',   	'Stun Spore',     '',   'Grass',      'Status',     0,  	75, 	30);
INSERT INTO move VALUES(79,	 '催眠粉',    	'Sleep Powder',   '',   'Grass',      'Status',     0,  	75, 	15);
INSERT INTO move VALUES(80,	 '花之舞',    	'Petal Dance',    '',   'Grass',      'Special',  	120, 	100, 	10);
INSERT INTO move VALUES(81,	 '吐丝', 	  	'String Shot',    '',   'Bug',        'Status',    	0, 	  95, 	40);
INSERT INTO move VALUES(82,	 '龙之怒', 	 	'Dragon Rage',    '',   'Dragon',     'Special',   	0,  	100, 	10);
INSERT INTO move VALUES(83,	 '火焰漩涡',  	'Fire Spin',      '',   'Fire',       'Special',   	35, 	85, 	15);
INSERT INTO move VALUES(84,	 '电击', 	  	'Thunder Shock',  '',   'Electric', 	'Special', 	  40, 	100, 	30);
INSERT INTO move VALUES(85,	 '十万伏特', 	 	'Thunderbolt',    '',   'Electric',   'Special',   	90, 	100, 	15);
INSERT INTO move VALUES(86,	 '电磁波', 	 	'Thunder Wave',   '',   'Electric',   'Status',    	0, 	  100, 	20);
INSERT INTO move VALUES(87,	 '打雷', 	  	'Thunder',        '',   'Electric',   'Special',   	110, 	70, 	10);
INSERT INTO move VALUES(88,	 '滚石', 	  	'Rock Throw',     '',   'Rock',       'Physical',  	50, 	90, 	15);
INSERT INTO move VALUES(89,	 '地震', 	  	'Earthquake',     '',   'Ground',     'Physical',   100, 	100, 	10);
INSERT INTO move VALUES(90,	 '地裂', 	  	'Fissure',        '',   'Ground',     'Physical',   0,   	0,  	5);
INSERT INTO move VALUES(91,	 '挖地洞', 	 	'Dig',            '',   'Ground',     'Physical',  	80, 	100, 	10);
INSERT INTO move VALUES(92,	 '猛毒素',    	'Toxic',          '',   'Poison',     'Status',    	0,  	90,  	10);
INSERT INTO move VALUES(93,	 '念力', 	  	'Confusion',      '',   'Psychic',    'Special',   	50, 	100, 	25);
INSERT INTO move VALUES(94,  '精神强念', 	 	'Psychic',        '',   'Psychic',    'Special',  	90, 	100, 	10);
INSERT INTO move VALUES(95,	 '催眠术', 	 	'Hypnosis',       '',   'Psychic',    'Status',  	 	0,  	60, 	20);
INSERT INTO move VALUES(96,	 '瑜伽姿势', 	 	'Meditate',       '',   'Psychic',    'Status',   	0,    0,  	40);
INSERT INTO move VALUES(97,	 '高速移动', 	 	'Agility',        '',   'Psychic',    'Status', 	  0,    0,  	30);
INSERT INTO move VALUES(98,  '电光一闪',   'Quick Attack',   '',   'Normal',     	'Physical',   40, 	100, 	30);
INSERT INTO move VALUES(99,	 '愤怒', 	  	'Rage',           '',   'Normal',   	'Physical',  	20,  	100, 	20);
INSERT INTO move VALUES(100, '瞬间移动',  	'Teleport',       '',   'Psychic',    'Status',     0,    0,  	20);
INSERT INTO move VALUES(101, '黑夜诅咒',  	'Night Shade',    '',   'Ghost',      'Special',    0,  	100, 	15);
INSERT INTO move VALUES(102, '模仿', 	  	'Mimic',          '',   'Normal',   	'Status',   	0, 	  100, 	10);
INSERT INTO move VALUES(103, '噪音', 	  	'Screech',        '',  	'Normal',   	'Status',   	0,  	85, 	40);
INSERT INTO move VALUES(104, '影子分身', 	 	'Double Team',    '',   'Normal',   	'Status',   	0,   	0,  	15);
INSERT INTO move VALUES(105, '自我复元', 	 	'Recover',        '',   'Normal',   	'Status',   	0,   	0,  	10);
INSERT INTO move VALUES(106, '硬梆梆', 	 	'Harden',         '',   'Normal',   	'Status',   	0,   	0,  	30);
INSERT INTO move VALUES(107, '缩小', 	  	'Minimize',       '',   'Normal',   	'Status',   	0, 	  0,  	10);
INSERT INTO move VALUES(108, '烟幕', 	  	'Smokescreen',    '',   'Normal',   	'Status',   	0,   	100, 	20);
INSERT INTO move VALUES(109, '奇异光线', 	 	'Confuse Ray',    '',   'Ghost',      'Status', 	 	0,  	100, 	10);
INSERT INTO move VALUES(110, '缩壳', 	  	'Withdraw',       '',   'Water',      'STatus',    	0,  	0,  	40);
INSERT INTO move VALUES(111, '防卫卷', 	 	'Defense Curl',   '',   'Normal',   	'Status',   	0,  	0,  	40);
INSERT INTO move VALUES(112, '障碍', 	  	'Barrier',        '',   'Psychic',    'Status',    	0,    0,  	20);
INSERT INTO move VALUES(113, '光墙', 	  	'Light Screen',   '',   'Psychic',    'Status',     0,    0,  	30);
INSERT INTO move VALUES(114, '黑雾', 	  	'Haze',           '',   'Ice',        'Status',    	0,    0,  	30);
INSERT INTO move VALUES(115, '减半反射', 	 	'Reflect',        '',   'Psychic',    'Status',     0,    0,  	20);
INSERT INTO move VALUES(116, '集气', 	  	'Focus Energy',   '',   'Normal',   	'Status',   	0,    0,  	30);
INSERT INTO move VALUES(117, '忍忍', 	  	'Bide',           '',   'Normal',   	'Physical',   0,    0,  	10);
INSERT INTO move VALUES(118, '挥指功', 	 	'Metronome',      '',   'Normal',   	'Status',     0,    0,  	10);
INSERT INTO move VALUES(119, '学舌术', 	 	'Mirror Move',    '',   'Flying',     'Status',     0,    0,  	20);
INSERT INTO move VALUES(120, '自爆', 	  	'Self-Destruct',  '',   'Normal',   	'Physical',  	200, 	100, 	5);
INSERT INTO move VALUES(121, '炸蛋', 	  	'Egg Bomb',       '',   'Normal',   	'Physical',  	100, 	75, 	10);
INSERT INTO move VALUES(122, '舔舌头', 	 	'Lick',           '',   'Ghost',      'Physical',   30, 	100, 	30);
INSERT INTO move VALUES(123, '迷雾', 	  	'Smog',           '',   'Poison',     'Physical',   30, 	70, 	20);
INSERT INTO move VALUES(124, '浆攻击',  	  'Sludge',         '',   'Poison',     'Special',    65,   100, 	20);
INSERT INTO move VALUES(125, '骨棒', 	  	'Bone Club',      '',   'Ground',     'Physical', 	65, 	85, 	20);
INSERT INTO move VALUES(126, '大字爆',    	'Fire Blast',     '',   'Fire',       'Special',   	110, 	85, 	5);
INSERT INTO move VALUES(127, '鱼跃龙门',	 	'Waterfall',      '',   'Water',      'Physical',  	80, 	100, 	15);
INSERT INTO move VALUES(128, '夹壳', 	  	'Clamp',          '',  	'Water',      'Physical',  	35, 	85, 	15);
INSERT INTO move VALUES(129, '高速星星', 	 	'Swift',          '',   'Normal',   	'Special',   	60,   0,  	20);
INSERT INTO move VALUES(130, '火箭头槌', 		'Skull Bash',     '',   'Normal',   	'Physical',  	130, 	100, 	10);
INSERT INTO move VALUES(131, '尖刺加农炮',  'Spike Cannon',   '',  	'Normal',   	'Physical',  	20, 	100, 	15);
INSERT INTO move VALUES(132, '纠缠', 	  	'Constrict',      '',   'Normal',   	'Physical',  	10, 	100, 	35);
INSERT INTO move VALUES(133, '瞬间失忆', 	 	'Amnesia',        '',   'Psychic',    'Status',    	0,    0,  	20);
INSERT INTO move VALUES(134, '折弯汤匙', 	 	'Kinesis',        '',   'Psychic',    'Status',     0,  	80, 	15);
INSERT INTO move VALUES(135, '生蛋', 	  	'Soft-Boiled',    '',   'Normal',   	'Status',   	0,    0,  	10);
INSERT INTO move VALUES(136, '飞膝撞', 	 	'High Jump Kick', '',   'Fighting',   'Physical', 	130, 	90, 	10);
INSERT INTO move VALUES(137, '大蛇瞪眼',  	'Glare',          '',  	'Normal',   	'Status',  	  0,  	100, 	30);
INSERT INTO move VALUES(138, '食梦', 	  	'Dream Eater',    '',   'Psychic',    'Special',  	100, 	100, 	15);
INSERT INTO move VALUES(139, '毒瓦斯',    	'Poison Gas',     '',   'Poison',     'Status',    	0,  	90, 	40);
INSERT INTO move VALUES(140, '丢球', 	  	'Barrage',        '',   'Normal',   	'Physical',  	15, 	85, 	20);
INSERT INTO move VALUES(141, '吸血', 	  	'Leech Life',     '',   'BUg', 	      'Physical', 	20, 	100, 	15);
INSERT INTO move VALUES(142, '恶魔之吻',  	'Lovely Kiss',    '',   'Normal',   	'Status',   	0,  	75, 	10);
INSERT INTO move VALUES(143, '高空攻击',  	'Sky Attack',     '',   'Flying',     'Physical', 	140, 	90, 	5);
INSERT INTO move VALUES(144, '变身', 	  	'Transform',      '',   'Normal',   	'Status',   	0,    0,  	10);
INSERT INTO move VALUES(145, '泡泡', 	 	  'Bubble',         '',   'Water',      'Special',    40,  	100, 	30);
INSERT INTO move VALUES(146, '迷昏拳',    	'Dizzy Punch',    '',   'Normal',   	'Physical',  	70, 	100, 	10);
INSERT INTO move VALUES(147, '蘑菇孢子',  	'Spore',          '',   'Grass',      'Status',    	0,  	100, 	15);
INSERT INTO move VALUES(148, '闪光', 	  	'Flash',          '',   'Normal',   	'Status',   	0,  	100, 	20);
INSERT INTO move VALUES(149, '精神波',    	'Psywave',        '',   'Psychic',    'Special',  	0,  	100, 	15);
INSERT INTO move VALUES(150, '水溅跃', 	 	'Splash',         '',   'Normal',   	'Status',   	0, 	  0,  	40);
INSERT INTO move VALUES(151, '溶化', 	  	'Acid Armor',     '',   'Poison',     'Status',    	0,   	0,  	20);
INSERT INTO move VALUES(152, '螃蟹拳', 	 	'Crabhammer',     '',   'Water',      'Physical', 	100, 	90, 	10);
INSERT INTO move VALUES(153, '大爆炸',    	'Explosion',      '',   'Normal',   	'Physical',  	250, 	100, 	5);
INSERT INTO move VALUES(154, '疯狂乱抓',  	'Fury Swipes',    '',   'Normal',   	'Physical',  	18, 	80, 	15);
INSERT INTO move VALUES(155, '骨头回力镖',  'Bonemerang',     '',  	'Ground',   	'Physical', 	50, 	90, 	10);
INSERT INTO move VALUES(156, '睡觉', 	  	'Rest',           '',   'Psychic',    'Status',     0,    0,  	10);
INSERT INTO move VALUES(157, '山崩地裂', 	 	'Rock Slide',     '',   'Rock',       'Physical',   75,  	90, 	10);
INSERT INTO move VALUES(158, '必杀门牙', 	 	'Hyper Fang',     '',   'Normal',   	'Physical',  	80, 	90, 	15);
INSERT INTO move VALUES(159, '棱角', 	  	'Sharpen',        '',   'Normal',   	'Status',   	0,   	0,  	30);
INSERT INTO move VALUES(160, '变性', 	  	'Conversion',     '',   'Normal',   	'Status',   	0,  	0,  	30);
INSERT INTO move VALUES(161, '三角攻击',  	'Tri Attack',     '',   'Normal',   	'Special',   	80, 	100, 	10);
INSERT INTO move VALUES(162, '愤怒之牙',  	'Super Fang',  	  '',   'Normal',   	'Physical',  	0, 	  90, 	10);
INSERT INTO move VALUES(163, '劈开', 	  	'Slash',          '',   'Normal',   	'Physical',  	70, 	100, 	20);
INSERT INTO move VALUES(164, '替身', 	  	'Substitute',     '',   'Normal',   	'Status',   	0, 	  0,  	10);
INSERT INTO move VALUES(165, '挣扎', 	 	  'Struggle',       '',   'Normal',   	'Physical',  	50, 	0,   	0);


INSERT INTO move VALUES(230, '甜气',      'Sweet Scent',     '',   'Normal',    'Status',     0,    100,  20);
INSERT INTO move VALUES(388, '烦恼种子',   'Worry Seed',      '',   'Grass',     'Status',     0,    100,  10);
INSERT INTO move VALUES(235, '光学合成',   'Synthesis',       '',   'Grass',     'Status',     0,    0,    5);
INSERT INTO move VALUES(402, '种子炸弹',   'Seed Bomb',       '',   'Grass',     'Physical',   80,   100,  15);
INSERT INTO move VALUES(572, '落花飛雪',   	'Petal Blizzard',  '',   'Grass',     'Physical',  	90, 	100, 	15 );
INSERT INTO move VALUES(184, '鬼脸',     	'Scary Face',      '',	 'Normal',    'Status',     0,  	100, 	10 );
INSERT INTO move VALUES(424, '炎牙',     	'Fire Fang',       '',   'Fire',      'Physical', 	65,  	95, 	15 );
INSERT INTO move VALUES(481, '爆炸火焰',  	'Flame Burst',     '',   'Fire',      'Special',   	70, 	100, 	15 );
INSERT INTO move VALUES(517, '炼狱',     	'Inferno',         '',   'Fire',      'Special',   	100, 	50, 	5 );
INSERT INTO move VALUES(394, '爆炎电击', 	 	'Flare Blitz', 	   '',   'Fire',      'Physical',  	120, 	100, 	15 );
INSERT INTO move VALUES(257, '热风', 	  	'Heat Wave',       '',   'FIre',      'Special',   	95, 	90, 	10);
INSERT INTO move VALUES(337, '龙爪', 	   	'Dragon Claw',     '',   'Dragon',    'Physical', 	80, 	100, 	15);
INSERT INTO move VALUES(421, '影子钩爪',   	'Shadow Claw', 	   '',   'Ghost',     'Physical', 	70, 	100, 	15 );
INSERT INTO move VALUES(403, '空气砍',  	 	'Air Slash',       '',   'Flying',    'Special',  	75, 	95, 	15 );
INSERT INTO move VALUES(229, '高速回转', 	 	'Rapid Spin', 	   '',   'Normal',    'Physical',  	20, 	100, 	40 );
INSERT INTO move VALUES(182, '守住', 	  	'Protect',         '',   'Normal',    'Status',   	0, 	  0,  	10 );
INSERT INTO move VALUES(352, '水波动',    	'Water Pulse', 	   '',   'Water',     'Special',    60, 	100, 	20 );
INSERT INTO move VALUES(401, '水柱尾',    	'Aqua Tail',       '',   'Water',     'Physical',  	90, 	90, 	10 );
INSERT INTO move VALUES(334, '铁壁',     	'Iron Defense',    '',   'Steel',     'Status', 	  0,    0,  	15 );
INSERT INTO move VALUES(240, '乞雨',     	'Rain Dance',      '',   'Water',     'Status',    	0,    0,  	5 );




INSERT INTO ability(id, name) VALUES(1, 'Stench');
INSERT INTO ability(id, name) VALUES(2, 'Drizzle');
INSERT INTO ability(id, name) VALUES(3, 'Speed Boost');
INSERT INTO ability(id, name) VALUES(4, 'Battle Armor');
INSERT INTO ability(id, name) VALUES(5, 'Sturdy');
INSERT INTO ability(id, name) VALUES(6, 'Damp');
INSERT INTO ability(id, name) VALUES(7, 'Limber');
INSERT INTO ability(id, name) VALUES(8, 'Sand Veil');
INSERT INTO ability(id, name) VALUES(9, 'Static');
INSERT INTO ability(id, name) VALUES(10, 'Volt Absorb');
INSERT INTO ability(id, name) VALUES(11, 'Water Absorb');
INSERT INTO ability(id, name) VALUES(12, 'Oblivious');
INSERT INTO ability(id, name) VALUES(13, 'Cloud Nine');
INSERT INTO ability(id, name) VALUES(14, 'Compoundeyes');
INSERT INTO ability(id, name) VALUES(15, 'Insomnia');
INSERT INTO ability(id, name) VALUES(16, 'Color Change');
INSERT INTO ability(id, name) VALUES(17, 'Immunity');
INSERT INTO ability(id, name) VALUES(18, 'Flash Fire');
INSERT INTO ability(id, name) VALUES(19, 'Shield Dust');
INSERT INTO ability(id, name) VALUES(20, 'Own Tempo');
INSERT INTO ability(id, name) VALUES(21, 'Suction Cups');
INSERT INTO ability(id, name) VALUES(22, 'Intimidate');
INSERT INTO ability(id, name) VALUES(23, 'Shadow Tag');
INSERT INTO ability(id, name) VALUES(24, 'Rough Skin');
INSERT INTO ability(id, name) VALUES(25, 'Wonder Guard');
INSERT INTO ability(id, name) VALUES(26, 'Levitate');
INSERT INTO ability(id, name) VALUES(27, 'Effect Spore');
INSERT INTO ability(id, name) VALUES(28, 'Synchronize');
INSERT INTO ability(id, name) VALUES(29, 'Clear Body');
INSERT INTO ability(id, name) VALUES(30, 'Natural Cure');
INSERT INTO ability(id, name) VALUES(31, 'Lightingrod');
INSERT INTO ability(id, name) VALUES(32, 'Serene Grace');
INSERT INTO ability(id, name) VALUES(33, 'Swift Swim');
INSERT INTO ability(id, name) VALUES(34, 'Chlorophyll');
INSERT INTO ability(id, name) VALUES(35, 'Illuminate');
INSERT INTO ability(id, name) VALUES(36, 'Trace');
INSERT INTO ability(id, name) VALUES(37, 'Huge Power');
INSERT INTO ability(id, name) VALUES(38, 'Poison Point');
INSERT INTO ability(id, name) VALUES(39, 'Inner Focus');
INSERT INTO ability(id, name) VALUES(40, 'Magma Armor');
INSERT INTO ability(id, name) VALUES(41, 'Water Veil');
INSERT INTO ability(id, name) VALUES(42, 'Magnet Pull');
INSERT INTO ability(id, name) VALUES(43, 'Soundproof');
INSERT INTO ability(id, name) VALUES(44, 'Rain Dish');
INSERT INTO ability(id, name) VALUES(45, 'Sand Stream');
INSERT INTO ability(id, name) VALUES(46, 'Pressure');
INSERT INTO ability(id, name) VALUES(47, 'Thick Fat');
INSERT INTO ability(id, name) VALUES(48, 'Early Bird');
INSERT INTO ability(id, name) VALUES(49, 'Flame Body');
INSERT INTO ability(id, name) VALUES(50, 'Run Away');
INSERT INTO ability(id, name) VALUES(51, 'Keen Eye');
INSERT INTO ability(id, name) VALUES(52, 'Hyper Cutter');
INSERT INTO ability(id, name) VALUES(53, 'Pickup');
INSERT INTO ability(id, name) VALUES(54, 'Truant');
INSERT INTO ability(id, name) VALUES(55, 'Hustle');
INSERT INTO ability(id, name) VALUES(56, 'Cute Charm');
INSERT INTO ability(id, name) VALUES(57, 'Plus');
INSERT INTO ability(id, name) VALUES(58, 'Minus');
INSERT INTO ability(id, name) VALUES(59, 'Forecast');
INSERT INTO ability(id, name) VALUES(60, 'Sticky Hold');
INSERT INTO ability(id, name) VALUES(61, 'Shed Skin');
INSERT INTO ability(id, name) VALUES(62, 'Guts');
INSERT INTO ability(id, name) VALUES(63, 'Marvel Scale');
INSERT INTO ability(id, name) VALUES(64, 'Liquid Ooze');
INSERT INTO ability(id, name) VALUES(65, 'Overgrow');
INSERT INTO ability(id, name) VALUES(66, 'Blaze');
INSERT INTO ability(id, name) VALUES(67, 'Torrent');
INSERT INTO ability(id, name) VALUES(68, 'Swarm');
INSERT INTO ability(id, name) VALUES(69, 'Rock Head');
INSERT INTO ability(id, name) VALUES(70, 'Drought');
INSERT INTO ability(id, name) VALUES(71, 'Arena Trap');
INSERT INTO ability(id, name) VALUES(72, 'Vital Spirit');
INSERT INTO ability(id, name) VALUES(73, 'White Smoke');
INSERT INTO ability(id, name) VALUES(74, 'Pure Power');
INSERT INTO ability(id, name) VALUES(75, 'Shell Armor');
INSERT INTO ability(id, name) VALUES(76, 'Air Lock');
INSERT INTO ability(id, name) VALUES(94, 'Solar Power');

INSERT INTO pokemon
VALUES(1, '妙蛙种子', 'Bulbasaur', '', 'Grass', 'Poison', 65, NULL, 34, 1059860, 0.7, 6.9, 87.5, 45, 21,
       '{"hp":0, "attack":0, "defence":0, "sa":1, "sd":0, "speed":0}', 64, 45, 49, 49, 65, 65, 45, NULL, 2, NULL,
       '{"0":33, "3":45, "7":73, "9":22, "13":[77, 79], "15":36, "19":75, "21":230, "25":74, "27":38, "31":388,
         "33":235, "37":402}', NULL, NULL);
INSERT INTO pokemon
VALUES(2, '妙蛙草', 'Ivysaur', '', 'Grass', 'Poison', 65, NULL, 34, 1059860, 1.0, 13.0, 87.5, 45, 21,
       '{"hp":0, "attack":0, "defence":0, "sa":1, "sd":1, "speed":0}', 141, 60, 62, 63, 80, 80, 60, 1, 3, NULL,
       '{"0":33, "3":45, "7":73, "9":22, "13":[77, 79], "15":36, "20":75, "23":230, "28":74, "31":38, "36":388,
         "39":235, "44":76}', NULL, NULL);
INSERT INTO pokemon
VALUES(3, '妙蛙花', 'Venusaur', '', 'Grass', 'Poison', 65, NULL, 34, 1059860, 2.0, 100.0, 87.5, 45, 21,
       '{"hp":0, "attack":0, "defence":0, "sa":2, "sd":1, "speed":0}', 208, 80, 82, 83, 100, 100, 80, 2, NULL, NULL,
       '{"0":33, "3":45, "7":73, "9":22, "13":[77, 79], "15":36, "20":75, "23":230, "28":74, "31":38, "32":80,
         "39":388, "45":235, "50":572, "53":76}', NULL, NULL);

INSERT INTO pokemon
VALUES(4, '小火龙', 'Charmander', '', 'Fire', NULL, 66, NULL, 94, 1059860, 0.6, 8.5, 87.5, 45, 21,
       '{"hp":0, "attack":0, "defence":0, "sa":0, "sd":0, "speed":1}', 65, 39, 52, 43, 60, 50, 65, NULL, 5, NULL,
       '{"0":[10, 45], "7":52, "10":108, "16":82, "19":184, "25":424, "28":481, "34":163, "37":53, "43":83, "46":517}',
       NULL, NULL);
INSERT INTO pokemon
VALUES(5, '火恐龙', 'Charmeleon', '', 'Fire', NULL, 66, NULL, 94, 1059860, 1.1, 19.0, 87.5, 45, 21,
       '{"hp":0, "attack":0, "defence":0, "sa":1, "sd":0, "speed":1}', 142, 58, 64, 58, 80, 65, 80, 4, 6, NULL,
       '{"0":[10, 45, 52], "10":108, "17":82, "21":184, "28":424, "32":481, "39":163, "43":53, "50":83, "54":517}',
       NULL, NULL);
INSERT INTO pokemon
VALUES(6, '喷火龙', 'Charizard', '', 'Fire', NULL, 66, NULL, 94, 1059860, 1.7, 90.5, 87.5, 45, 21,
       '{"hp":0, "attack":0, "defence":0, "sa":3, "sd":0, "speed":0}', 209, 78, 84, 78, 109, 85, 100, 5, NULL, NULL,
       '{"0":[394, 257, 337, 421, 403, 10, 45, 52, 108], "17":82, "21":184, "28":424, "32":481, "36":17, "41":163,
         "47":53, "56":83, "62":517}', NULL, NULL);

INSERT INTO pokemon
VALUES(7, '杰尼龟', 'Squirtle', '', 'Water', NULL, 67, NULL, 44, 1059860, 0.5, 9.0, 87.5, 45, 21,
       '{"hp":0, "attack":0, "defence":1, "sa":0, "sd":0, "speed":0}', 66, 44, 48, 65, 50, 64, 43, NULL, 8, NULL,
       '{"0":33, "4":39, "7":55, "10":110, "13":145, "16":44, "19":229, "22":182, "25":352, "28":401, "31":130,
       "34":334, "37":240, "40":56}', NULL, NULL);
INSERT INTO pokemon
VALUES(8, '卡咪龟', 'Wartortle', '', 'Water', NULL, 67, NULL, 44, 1059860, 1.0, 22.5, 87.5, 45, 21,
       '{"hp":0, "attack":0, "defence":1, "sa":0, "sd":1, "speed":0}', 143, 59, 63, 80, 65, 80, 58, 7, 9, NULL,
       '{"0":[33, 39, 55], "10":110, "13":145, "16":44, "20":229, "24":182, "28":352, "32":401, "36":130,
         "40":334, "44":240, "48":56}', NULL, NULL);
INSERT INTO pokemon
VALUES(9, '水箭龟', 'Blastoise', '', 'Water', NULL, 67, NULL, 44, 1059860, 1.6, 85.5, 87.5, 45, 21,
       '{"hp":0, "attack":0, "defence":0, "sa":0, "sd":3, "speed":0}', 210, 79, 83, 100, 85, 105, 78, 8, NULL, NULL,
       '{"0":[430, 33, 39, 55, 110], "13":145, "16":44, "20":229, "24":182, "28":352, "32":401, "39":130,
         "46":334, "53":240, "60":56}', NULL, NULL);



# --- !Downs
DROP TYPE IF EXISTS gender CASCADE;
DROP TYPE IF EXISTS "type" CASCADE;
DROP TYPE IF EXISTS egg_group CASCADE;
DROP TYPE IF EXISTS stat CASCADE;
DROP TYPE IF EXISTS move_category CASCADE;
DROP TABLE IF EXISTS pokemon CASCADE;
DROP TABLE IF EXISTS ability CASCADE;
DROP TABLE IF EXISTS item CASCADE;
DROP TABLE IF EXISTS move CASCADE;