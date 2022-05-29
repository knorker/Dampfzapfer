--levels = {}

local autocomic = {
	background = love.graphics.newImage("comic/bgauto_800x600.png"),
	text = {"Zufälliger Passant: Was ist denn da los?","Fräulein: Ja sie sehen doch wie es dampft!", "Zufälliger Passant: Zum Glück habe Ich ein \n passendes Rohr dabei."},
	steam = {
	{x=555,y=350,},
	{x=600,y=330,},
	{x=650,y=330,},
	},
	}

	--[[
local zaubercomic = {
	background = love.graphics.newImage("comic/bgzauber_800x600.png"),
	text = {"Zauberer: Oh nein! Mein Ofen ist kaputt.", "Wie soll Ich denn jetzt die Zombieköpfe einkochen?", "Das muss unbedingt repariert werden."},
	steam = {
	{x=380,y=140,},
	{x=400,y=340,},
	{x=420,y=300,},
	},
	}
--]]

local tutorialcomic1 = {
	background = love.graphics.newImage("comic/bglehrer_800x600.png"),
	text = {"Willkommen zu Dampfzapfer.\nIch werde alles erklaeren, klicken sie um fortzufahren.", 
	"Die meisten Geraete enthalten Dampf.\nEntweicht dieser, ist der Geraet kaputt.",
	"Ein geschlossenes Rohrsystem ist oberste Pflicht.\nAn den Manometern muss ausserdem Druck anliegen.",
	"Wenn die Rohre durcheinander kommen, muss der Geraet\n repariert werden. Klicke auf Rohrteile um sie zu drehen.\n",
	"Genug der Theorie, hier eine erste einfache Aufgabe!",
	},
	}
	
local tutorialcomic2 = {
	background = love.graphics.newImage("comic/bglehrer_800x600.png"),
	text = {"Ja, das ist gut! War doch ganz leicht.\n", 	
	"Hast du dir das Passwort notiert? (es war 000123) \nGib es im Menu ein um weiterzumachen wo du aufgehört\nhast.",
	"Versuch doch mal das hier!",
	},
	}

local tutorialcomic3 = {
	background = love.graphics.newImage("comic/bglehrer_800x600.png"),
	text = {"Jetzt wird es ernst.\nRohre raus, Klassenarbeit!",	
	"Löse die nachsten 3 Aufgaben und \ndu kannst dein Glück in der echten Welt zapfen.",
	},
	}
	
local ninjacomic = {
	background = love.graphics.newImage("comic/bgninja_800x600.png"),
	text = {"Zumuko der Schreckliche: Meine Waschmaschine ist kaputt.\nDu sollst reich belohnt werden.",
	"Doch wenn du versagst, wäscht Zumuko mit Blut.",
	},	
	steam = {
	{x=550,y=300,},
	{x=500,y=280,},
	{x=450,y=280,},
	},
	}
	
local piratcomic = {
	background = love.graphics.newImage("comic/bgpirat_800x600.png"),
	text = {"Arrrhoi Männer, wir haben das Versteck gefunden!\nLasst uns den Schatz heben.",	
	"Keine von euch räudigen Landratten kann schwimmen?\nDann verzapft eine Pumpe, verdammt nochmal.",
	},
	}
	
local gratulationcomic = {
	background = love.graphics.newImage("comic/bglehrer_800x600.png"),
	text = {"Tadadat Tada! Das wars.\n Danke fürs spielen.",
	"Gutholz (Code), Sir Maximillion (Grafik), tfg (Musik)",
	"pOTJam Contest 24.02 - 11.03.2012",
	"Da kommt nix mehr.",
	"Da kommt nix mehr.\nWirklich. Ist doch albern."
	},
	}

	
--------------
levels = {
--supereinfach ---
{
--dataString = "4,0,0,0  4,1,0,0  4,0,0,0  4,1,0,0  0,0,0,0  6,0,0,1  0,0,0,0  4,0,0,0  2,1,0,0  4,1,0,0  4,3,0,0  3,3,0,0  3,2,0,0  2,1,0,0  2,1,0,0  5,4,0,0  5,2,0,0  5,3,0,0  4,3,0,0  2,0,0,0  0,0,0,0  2,3,0,0  6,3,0,0  4,1,0,0  2,1,0,0  5,2,0,0  4,1,0,0  4,3,0,0  5,4,0,0  4,1,0,0  6,3,0,1  5,3,0,0  4,2,0,0  2,3,0,0  4,4,0,0  5,2,0,0  5,4,0,0  4,4,0,0  4,1,0,0  6,1,0,1  0,0,0,0  2,2,0,0  4,1,0,0  5,2,0,0  5,3,0,0  2,1,0,0  2,3,0,0  3,1,0,0  2,2,0,0  0,0,0,0  4,0,0,0  4,3,0,0  5,2,0,0  4,4,0,0  4,2,0,0  5,1,0,0  4,4,0,0  4,3,0,0  5,1,0,0  4,1,0,0  4,3,0,0  2,4,0,0  4,3,0,0  2,2,0,0  4,4,0,0  2,3,0,0  5,1,0,0  4,4,0,0  5,1,0,0  4,2,0,0  4,3,0,0  4,2,0,0  4,3,0,0  4,2,0,0  2,2,1,0  0,0,0,0  4,3,0,0  2,1,0,0  4,2,0,0  0,0,0,0  ",
dataString = "0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,1,0,0  2,1,0,0  2,2,0,0  4,1,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,3,1,0  2,1,0,0  2,1,0,0  4,2,0,0  0,0,0,0  0,0,0,0  4,2,0,0  2,1,0,0  6,1,0,1  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  ",
comic = tutorialcomic1,
code = "000123",
},

--supereinfach2 ---
{
dataString = "0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,3,0,0  4,1,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,1,0,0  5,4,0,0  2,1,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,3,0,0  4,3,0,0  0,0,0,0  5,3,0,0  2,1,0,0  2,3,0,0  2,2,0,0  2,3,0,0  2,1,0,1  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,3,1,0  2,1,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  ",
comic = tutorialcomic2,
code = "222",
},

--einfach
{
dataString = "0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,0,0,0  2,1,0,0  4,1,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,3,0,0  2,1,0,0  3,0,0,1  4,1,0,0  5,2,0,0  2,1,0,0  4,1,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,2,0,0  2,0,0,0  2,0,0,0  6,0,0,1  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,3,0,0  4,4,0,0  5,4,0,0  4,1,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,2,1,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  ",
comic = tutorialcomic3,
code = "3343",
},

--auch einfach
{
dataString = "0,0,0,0  0,0,0,0  2,0,1,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,0,0,0  0,0,0,0  0,0,0,0  6,0,0,1  0,0,0,0  0,0,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,2,0,0  2,1,0,0  4,1,0,0  2,0,0,0  4,1,0,0  2,2,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,0,0,0  4,0,0,0  5,3,0,0  4,3,0,0  5,2,0,0  4,4,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,0,0,0  2,0,0,0  0,0,0,0  6,3,0,1  4,1,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,3,0,0  5,1,0,0  2,1,0,0  2,3,0,0  6,2,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,2,1,0  0,0,0,0  0,0,0,0  ",
code = "3776",
},

--einfach 5, tutorial ende
{
dataString = "0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,0,0,1  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,0,0,0  2,2,0,0  2,1,0,0  4,1,0,0  0,0,0,0  4,4,0,0  4,1,0,0  0,0,0,0  2,3,1,0  2,1,0,0  3,4,0,0  2,4,0,0  5,1,0,0  3,0,0,0  2,1,0,0  4,2,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  5,3,0,0  2,3,0,0  5,2,0,0  2,1,0,0  4,1,0,0  2,0,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,3,0,0  2,2,0,0  5,4,0,0  5,4,0,0  5,1,0,0  5,2,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,3,0,0  5,4,0,0  4,3,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  ",
code = "3488",
},
-------------------------------5 um
{
dataString = "0,0,0,0  4,0,0,0  2,1,0,0  4,1,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,3,0,0  5,1,0,0  2,1,0,0  5,3,0,0  6,1,1,1  6,3,0,0  4,4,0,0  4,4,0,0  6,0,0,1  0,0,0,0  0,0,0,0  4,4,0,0  2,3,0,0  4,2,0,0  4,1,0,0  4,3,0,0  5,4,0,0  4,1,0,0  2,4,0,0  0,0,0,0  0,0,0,0  2,2,0,0  6,0,1,0  5,1,0,0  4,1,0,0  2,4,0,0  4,3,0,0  5,4,0,0  5,3,0,0  0,0,0,0  0,0,0,0  4,4,0,0  5,3,0,0  4,1,0,0  4,4,0,0  5,1,0,0  6,4,0,0  2,2,0,0  2,1,0,0  0,0,0,0  0,0,0,0  4,2,0,0  5,3,0,0  5,3,0,0  4,2,0,0  4,3,0,0  2,1,0,0  4,2,0,0  2,1,0,0  0,0,0,0  0,0,0,0  2,3,0,0  2,2,0,0  4,4,0,0  5,2,0,0  2,1,0,0  2,4,0,0  2,3,0,0  4,1,0,0  0,0,0,0  0,0,0,0  4,3,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  ",
comic = ninjacomic,
code = "780707",
},

--4/10
{
dataString = "0,0,0,0  2,0,1,0  0,0,0,0  4,1,0,0  2,2,0,0  2,1,0,0  2,1,0,0  2,1,0,0  5,1,0,0  0,0,0,0  0,0,0,0  4,3,0,0  2,3,0,0  5,1,0,0  2,3,0,0  2,2,0,0  2,3,0,0  5,4,0,0  4,2,0,0  0,0,0,0  0,0,0,0  2,3,0,0  4,4,0,0  5,2,0,0  4,1,0,0  4,4,0,0  4,3,0,0  4,4,0,0  5,1,0,0  0,0,0,0  0,0,0,0  4,3,0,0  5,4,0,0  2,4,0,0  5,4,0,0  2,3,0,0  4,4,0,0  4,2,0,0  2,4,0,0  0,0,0,0  0,0,0,0  4,2,0,0  5,2,0,0  2,2,0,0  5,1,0,0  4,3,0,0  4,3,0,0  4,3,0,0  2,4,0,0  0,0,0,0  0,0,0,0  4,4,0,0  4,2,0,0  4,3,0,0  5,4,0,0  5,3,0,0  4,3,0,0  4,2,0,0  5,4,0,0  2,1,0,1  0,0,0,0  4,4,0,0  4,1,0,0  4,1,0,0  4,1,0,0  4,4,0,0  4,4,0,0  2,2,0,0  4,3,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,2,0,1  6,2,0,1  0,0,0,0  0,0,0,0  6,2,0,1  0,0,0,0  0,0,0,0  0,0,0,0  ",
code = "3641",
},

--viele endstücke
{
dataString = "0,0,0,0  6,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,0,0,0  6,1,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  5,1,0,0  4,1,0,0  5,2,0,0  2,3,0,0  4,4,0,0  4,2,0,0  5,3,0,0  6,1,0,0  0,0,0,0  6,3,0,0  5,3,0,0  4,2,0,0  5,3,0,0  4,1,0,0  4,1,0,0  5,2,0,0  6,4,0,0  2,2,0,0  0,0,0,0  0,0,0,0  5,4,0,0  2,1,0,0  3,1,0,0  3,1,0,0  5,1,0,0  5,3,0,0  4,3,0,0  4,1,0,0  0,0,0,0  0,0,0,0  2,4,0,0  6,3,0,0  2,4,0,0  6,2,1,0  4,3,0,0  5,3,0,0  6,1,0,0  2,2,0,0  0,0,0,0  0,0,0,0  6,4,0,0  4,4,0,0  5,3,0,0  5,4,0,0  4,1,0,0  4,4,0,0  2,3,0,0  4,3,0,0  0,0,0,0  0,0,0,0  5,2,0,0  6,3,0,0  2,3,0,0  5,2,0,0  4,2,0,0  5,2,0,0  6,1,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,0,0,1  4,3,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  ",
code ="9887",
},

--bisl tricky, geht nur mit wand raus?
{
--dataString = "4,0,0,0  4,1,0,0  4,0,0,0  4,1,0,0  0,0,0,0  6,0,0,1  0,0,0,0  4,0,0,0  2,1,0,0  4,1,0,0  4,3,0,0  3,3,0,0  3,2,0,0  2,1,0,0  2,1,0,0  5,4,0,0  5,2,0,0  5,3,0,0  4,3,0,0  2,0,0,0  0,0,0,0  2,3,0,0  6,3,0,0  4,1,0,0  2,1,0,0  5,2,0,0  4,1,0,0  4,3,0,0  5,4,0,0  4,1,0,0  6,3,0,1  5,3,0,0  4,2,0,0  2,3,0,0  4,4,0,0  5,2,0,0  5,4,0,0  4,4,0,0  4,1,0,0  6,1,0,1  0,0,0,0  2,2,0,0  4,1,0,0  5,2,0,0  5,3,0,0  2,1,0,0  2,3,0,0  3,1,0,0  2,2,0,0  0,0,0,0  4,0,0,0  4,3,0,0  5,2,0,0  4,4,0,0  4,2,0,0  5,1,0,0  4,4,0,0  4,3,0,0  5,1,0,0  4,1,0,0  4,3,0,0  2,4,0,0  4,3,0,0  2,2,0,0  4,4,0,0  2,3,0,0  5,1,0,0  4,4,0,0  5,1,0,0  4,2,0,0  4,3,0,0  4,2,0,0  4,3,0,0  4,2,0,0  2,2,1,0  0,0,0,0  4,3,0,0  2,1,0,0  4,2,0,0  0,0,0,0  ",
dataString = "4,0,0,0  4,1,0,0  4,0,0,0  4,1,0,0  0,0,0,0  6,0,0,1  0,0,0,0  4,0,0,0  2,1,0,0  4,1,0,0  4,3,0,0  3,3,0,0  3,2,0,0  2,1,0,0  2,1,0,0  5,4,0,0  5,2,0,0  5,3,0,0  4,3,0,0  2,0,0,0  0,0,0,0  2,3,0,0  6,3,0,0  4,1,0,0  2,1,0,0  5,2,0,0  4,1,0,0  4,3,0,0  5,4,0,0  4,1,0,0  6,3,0,1  5,3,0,0  4,2,0,0  2,3,0,0  4,4,0,0  5,2,0,0  5,4,0,0  4,4,0,0  4,1,0,0  6,1,0,1  0,0,0,0  2,2,0,0  4,1,0,0  5,2,0,0  5,3,0,0  2,1,0,0  2,3,0,0  3,1,0,0  2,2,0,0  0,0,0,0  4,0,0,0  4,3,0,0  5,2,0,0  4,4,0,0  4,2,0,0  5,1,0,0  4,4,0,0  4,3,0,0  5,1,0,0  4,1,0,0  4,3,0,0  2,4,0,0  4,3,0,0  2,2,0,0  4,4,0,0  2,3,0,0  5,1,0,0  4,4,0,0  5,1,0,0  4,2,0,0  4,3,0,0  4,2,0,0  4,3,0,0  4,2,0,0  2,2,1,0  0,0,0,0  4,3,0,0  2,1,0,0  4,2,0,0  0,0,0,0  ",
code = "111212",
},

{
dataString = "4,0,0,0  0,0,0,0  5,0,0,0  4,0,0,0  2,1,0,0  4,1,0,0  0,0,0,0  6,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,1,0,0  2,3,0,0  4,4,0,0  6,0,0,1  4,4,0,0  5,1,0,0  2,3,0,0  4,2,0,0  0,0,0,0  0,0,0,0  2,3,0,0  6,0,1,0  3,3,0,0  5,4,0,0  4,4,0,0  4,4,0,0  4,4,0,0  2,3,0,0  0,0,0,0  4,3,0,0  2,4,0,0  5,2,0,0  2,1,0,0  3,2,0,0  4,2,0,0  2,1,0,0  4,1,0,0  4,1,0,0  0,0,0,0  0,0,0,0  5,4,0,0  3,4,0,0  4,1,0,0  4,2,0,0  2,3,0,0  4,3,0,0  5,2,0,0  4,4,0,0  0,0,0,0  0,0,0,0  2,2,0,0  5,1,0,0  4,3,0,0  4,2,0,0  2,1,0,0  5,1,0,0  4,1,0,0  2,4,0,0  0,0,0,0  0,0,0,0  2,3,0,0  5,1,0,0  2,3,0,0  4,4,0,0  4,2,0,0  2,4,0,0  6,2,1,0  2,4,0,0  0,0,0,0  0,0,0,0  4,3,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,3,0,0  2,1,0,0  4,2,0,0  0,0,0,0  ",
code="1367235",
},

--AUTO-------------5 um
{
comic = autocomic,
dataString = "0,0,0,0  0,0,0,0  4,0,0,0  2,1,0,0  4,1,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,0,0,0  4,1,0,0  5,2,0,0  4,2,0,0  4,4,0,0  2,1,0,0  2,2,0,0  2,3,0,0  4,2,0,0  0,0,0,0  2,0,0,0  2,4,0,0  2,0,0,1  4,3,0,0  4,2,0,0  4,4,0,0  2,1,0,0  6,1,1,0  2,2,0,0  0,0,0,0  2,0,0,0  2,1,0,0  5,3,0,0  4,3,0,0  2,2,0,0  5,1,0,0  2,4,0,0  2,1,0,1  4,4,0,0  0,0,0,0  6,2,0,0  4,3,0,0  4,2,0,0  5,1,0,0  5,2,0,0  5,2,0,0  2,2,0,0  2,4,0,0  4,2,0,0  0,0,0,0  2,0,0,0  4,1,0,0  5,2,0,0  5,1,0,0  5,3,0,0  5,2,0,0  2,1,0,0  4,1,0,0  2,4,0,0  0,0,0,0  2,0,0,0  4,4,0,0  4,3,0,0  2,1,0,0  2,3,0,0  2,3,0,0  6,1,0,0  4,1,0,0  4,4,0,0  0,0,0,0  4,3,0,0  0,0,0,0  0,0,0,0  4,3,0,0  4,2,0,0  4,3,0,0  4,2,0,0  4,2,0,0  0,0,0,0  0,0,0,0  ",
code = "004553",
},

{
dataString = "0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,0,1,0  2,0,0,1  0,0,0,0  4,0,0,0  2,1,0,0  4,2,0,0  4,2,0,0  2,4,0,0  4,1,0,0  5,1,0,0  2,4,0,0  2,0,0,1  0,0,0,0  2,0,0,0  3,1,0,0  4,1,0,0  4,2,0,0  5,1,0,0  4,2,0,0  4,2,0,0  2,4,0,0  2,0,0,1  0,0,0,0  0,0,0,0  4,1,0,0  5,4,0,0  5,4,0,0  2,3,0,0  2,4,0,0  5,4,0,0  2,2,0,0  2,0,0,1  0,0,0,0  0,0,0,0  2,4,0,0  4,1,0,0  2,3,0,0  4,4,0,0  2,3,0,0  5,2,0,0  5,1,0,0  5,4,0,0  6,1,0,0  0,0,0,0  2,4,0,0  2,1,0,0  4,2,0,0  4,3,0,0  4,1,0,0  5,3,0,0  4,3,0,0  5,1,0,0  0,0,0,0  0,0,0,0  6,2,1,0  2,4,0,0  2,4,0,0  4,4,0,0  5,1,0,0  5,4,0,0  4,3,0,0  5,4,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,3,0,0  4,2,0,0  4,3,0,0  2,1,0,0  4,2,0,0  4,3,0,0  4,2,0,0  0,0,0,0  ",
code = "123123124",
},

{
dataString = "0,0,0,0  0,0,0,0  4,0,0,0  2,1,0,0  2,1,0,0  2,1,0,0  2,1,0,0  4,1,0,0  0,0,0,0  0,0,0,0  6,0,0,0  4,3,0,0  4,2,0,0  2,2,0,0  2,4,0,0  5,3,0,0  2,3,0,0  4,1,0,0  4,3,0,0  0,0,0,0  6,3,0,0  2,1,0,0  4,1,0,0  2,2,0,0  5,1,0,0  5,4,0,0  2,4,0,0  4,4,0,0  2,1,0,0  0,0,0,0  0,0,0,0  2,3,0,0  5,3,0,0  5,4,0,0  5,4,0,0  5,4,0,0  4,1,0,0  2,4,0,0  6,3,0,0  0,0,0,0  6,0,0,0  5,4,0,0  4,3,0,0  2,3,0,0  4,1,0,0  6,1,0,1  2,1,0,0  2,2,0,0  3,3,0,0  0,0,0,0  4,3,0,0  4,3,0,0  5,3,0,0  5,3,0,0  4,4,0,0  6,3,0,1  5,4,0,0  4,2,0,0  4,3,0,0  0,0,0,0  0,0,0,0  5,2,0,0  4,4,0,0  4,4,0,0  4,1,0,0  6,1,0,1  5,3,0,0  2,1,0,0  4,1,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,2,1,0  4,3,0,0  2,1,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  ",
code ="4340020",
},

{
dataString = "0,0,0,0  6,3,0,0  4,1,0,0  0,0,0,0  0,0,0,0  6,0,0,0  0,0,0,0  0,0,0,0  4,0,0,0  6,1,0,0  0,0,0,0  2,1,0,0  4,1,0,0  4,2,0,0  4,3,0,0  2,2,0,0  5,4,0,0  4,3,0,0  5,2,0,0  6,0,1,0  0,0,0,0  6,0,0,1  5,1,0,0  4,1,0,0  4,4,0,0  4,3,0,0  4,3,0,0  4,2,0,0  2,3,0,0  2,0,0,0  0,0,0,0  5,2,0,0  5,4,0,0  4,4,0,0  4,1,0,0  5,4,0,0  4,4,0,0  4,1,0,0  5,4,0,0  2,0,0,0  0,0,0,0  6,2,0,1  2,3,0,0  4,1,0,0  5,3,0,0  5,4,0,0  4,2,0,0  4,3,0,0  4,1,0,0  2,4,0,0  0,0,0,0  3,2,0,0  4,4,0,0  5,2,0,0  5,2,0,0  4,3,0,0  4,2,0,0  4,4,0,0  4,3,0,0  4,2,0,0  0,0,0,0  4,4,0,0  4,2,0,0  4,4,0,0  4,1,0,0  5,4,0,0  4,1,0,0  4,2,0,0  2,3,0,0  0,0,0,0  0,0,0,0  6,3,0,0  4,2,0,0  0,0,0,0  6,2,1,0  4,3,0,0  4,2,0,0  0,0,0,0  6,2,0,1  0,0,0,0  ",
code ="987621",
},

{
--sehr viele T, schwer?
dataString = "0,0,0,0  5,3,0,0  5,3,0,0  5,0,0,0  0,0,0,0  0,0,0,0  6,0,1,0  0,0,0,0  4,4,0,0  4,1,0,0  0,0,0,0  5,2,0,0  5,3,0,0  5,1,0,0  4,1,0,0  4,3,0,0  5,2,0,0  5,2,0,0  5,2,0,0  4,2,0,0  0,0,0,0  4,1,0,0  5,3,0,0  5,1,0,0  5,2,0,0  5,4,0,0  5,4,0,0  5,3,0,0  5,1,0,0  4,1,0,0  6,3,1,0  5,2,0,0  5,2,0,0  5,1,0,0  5,3,0,0  5,1,0,0  4,3,0,0  4,2,0,0  5,2,0,0  4,2,0,0  0,0,0,0  5,2,0,0  5,2,0,0  5,4,0,0  5,2,0,0  5,4,0,0  4,3,0,0  5,4,0,0  4,1,0,0  0,0,0,0  4,3,0,0  5,3,0,0  4,2,0,0  5,2,0,0  5,4,0,0  5,3,0,0  5,3,0,0  5,3,0,0  4,3,0,0  0,0,0,0  5,2,0,0  5,2,0,0  4,3,0,0  4,2,0,0  5,2,0,0  5,4,0,0  5,4,0,0  4,1,0,0  2,2,0,0  0,0,0,0  4,3,0,0  4,2,0,0  0,0,0,0  2,0,0,1  2,0,0,1  2,0,0,1  0,0,0,0  4,3,0,0  4,2,0,0  0,0,0,0  ",
code = "09845620",
},


------------pirat, 5 um
{
comic = piratcomic,
dataString = "0,0,0,0  6,0,0,1  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,0,0,1  2,0,0,1  0,0,0,0  0,0,0,0  2,4,0,0  4,4,0,0  4,1,0,0  4,2,0,0  4,4,0,0  5,1,0,0  2,1,0,0  5,4,0,0  4,2,0,0  0,0,0,0  5,4,0,0  4,3,0,0  5,1,0,0  5,2,0,0  2,4,0,0  6,4,0,0  4,1,0,0  5,3,0,0  2,1,0,0  0,0,0,0  2,1,0,0  2,1,0,0  4,2,0,0  4,4,0,0  2,2,0,0  2,4,0,0  4,2,0,0  5,3,0,0  2,1,0,0  4,4,0,0  5,1,0,0  5,2,0,0  5,2,0,0  2,2,0,0  5,3,0,0  5,3,0,0  4,4,0,0  5,2,0,0  4,1,0,0  5,3,0,0  5,2,0,0  5,0,0,0  5,1,0,0  2,4,0,0  5,1,0,0  5,1,0,0  5,4,0,0  5,4,0,0  0,0,0,0  5,3,0,1  5,4,0,0  4,1,0,0  5,3,0,0  5,3,0,0  2,2,0,0  2,3,0,0  5,2,0,0  4,2,0,0  0,0,0,0  2,2,1,0  2,2,1,0  0,0,0,0  4,3,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  ",
code = "1035079",
},

{
dataString = "0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,0,0,1  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,3,0,0  5,4,0,0  6,1,1,0  3,1,0,0  5,4,0,0  2,3,0,0  4,4,0,0  4,2,0,0  0,0,0,0  4,0,0,0  4,1,0,0  2,0,0,0  6,0,1,0  5,4,0,0  4,3,0,0  2,4,0,0  5,2,0,0  6,1,1,0  0,0,0,0  4,3,0,0  5,3,0,0  5,2,0,0  5,2,0,0  2,3,0,0  2,3,0,0  4,2,0,0  6,3,1,0  4,1,0,0  0,0,0,0  0,0,0,0  2,3,0,0  2,1,0,0  5,1,0,0  5,3,0,0  4,2,0,0  2,1,0,0  6,0,0,1  2,4,0,0  0,0,0,0  4,0,0,0  5,2,0,0  5,1,0,0  4,2,0,0  4,3,0,0  4,1,0,0  5,1,0,0  4,3,0,0  2,1,0,0  0,0,0,0  4,3,0,0  2,3,0,0  5,2,0,0  6,4,0,1  6,1,0,0  2,2,0,0  2,2,0,0  2,1,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,4,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  ",
code = "66690666",
},

{
dataString = "0,0,0,0  0,0,0,0  4,0,0,0  2,2,0,0  2,2,0,0  4,4,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,3,0,0  5,1,0,0  2,2,0,0  6,2,0,0  5,3,0,0  5,3,0,0  5,3,0,0  4,1,0,0  0,0,0,0  2,3,1,0  4,1,0,0  5,1,0,0  2,2,0,0  5,1,0,0  3,2,0,0  5,1,0,0  2,3,0,0  4,4,0,0  2,1,0,1  0,0,0,0  5,3,0,0  4,1,0,0  5,3,0,0  5,3,0,0  5,1,0,0  5,3,0,0  4,3,0,0  4,3,0,0  0,0,0,0  2,3,1,0  4,2,0,0  5,3,0,0  2,2,0,0  4,3,0,0  4,1,0,0  2,2,0,0  5,4,0,0  4,2,0,0  2,1,0,1  0,0,0,0  4,4,0,0  4,2,0,0  2,4,0,0  4,4,0,0  4,2,0,0  4,3,0,0  4,1,0,0  5,1,0,0  4,1,0,0  0,0,0,0  3,4,0,0  5,3,0,0  3,0,0,0  2,4,0,0  4,2,0,0  4,4,0,0  4,2,0,0  4,0,0,0  4,2,0,0  0,0,0,0  0,0,0,0  4,3,0,0  5,3,0,0  2,2,0,0  5,3,0,0  5,3,0,0  2,2,0,0  4,2,0,0  0,0,0,0  ",
code = "1237775",
},

{
dataString = "4,1,0,1  2,0,0,1  2,0,0,1  2,0,0,1  2,0,0,1  2,0,0,1  2,0,0,1  0,0,0,0  4,0,0,0  4,1,0,0  4,2,0,0  5,4,0,0  4,4,0,0  5,3,0,0  4,1,0,0  3,2,0,0  5,1,0,0  4,3,0,0  5,3,0,0  4,2,0,0  2,1,0,1  5,4,0,0  4,4,0,0  4,4,0,0  4,1,0,0  5,2,0,0  5,4,0,0  5,2,0,0  5,1,0,0  2,1,0,1  2,1,0,1  4,3,0,0  5,4,0,0  2,4,0,0  5,3,0,0  5,2,0,0  4,2,0,0  4,4,0,0  5,2,0,0  2,1,0,1  2,1,0,1  5,3,0,0  5,3,0,0  4,3,0,0  3,2,0,0  5,3,0,0  6,1,1,0  5,3,0,0  5,4,0,0  2,1,0,1  2,1,0,1  3,4,0,0  5,4,0,0  2,3,0,0  4,2,0,0  5,3,0,0  5,1,0,0  4,3,0,0  4,2,0,0  2,1,0,1  4,0,0,0  5,2,0,0  5,2,0,0  5,4,0,0  4,1,0,0  5,3,0,0  5,1,0,0  5,2,0,0  3,2,0,0  4,1,0,1  2,0,0,1  2,0,0,1  2,0,0,1  2,0,0,1  2,0,0,1  2,0,0,1  2,0,0,1  2,0,0,1  2,0,0,1  2,0,0,1  ",
code = "4545008",
},



--p0t logo
{
comic = gratulationcomic,
dataString= "0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,0,0,0  2,1,0,0  4,1,0,0  0,0,0,0  0,0,0,0  6,3,0,0  5,0,0,0  6,1,0,0  0,0,0,0  0,0,0,0  2,0,0,0  0,0,0,0  2,0,0,0  4,0,0,0  2,1,0,0  4,1,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  5,3,0,0  2,1,0,0  4,2,0,0  2,0,0,0  0,0,0,0  2,0,0,0  2,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,0,0,0  0,0,0,0  0,0,0,0  2,0,0,0  0,0,0,0  2,0,0,0  6,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,2,0,0  0,0,0,0  0,0,0,0  4,3,0,0  2,1,0,0  4,2,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  6,2,1,0  6,2,1,0  6,2,1,0  6,2,1,0  6,2,1,0  6,2,1,0  6,2,1,0  6,2,1,0  6,2,1,0  6,2,1,0  ",
code = "112666110",
},

}
--ka was das ist:
--"0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  4,1,0,0  2,1,0,0  2,2,0,0  4,1,0,0  0,0,0,0  0,0,0,0  0,0,0,0  2,3,1,0  2,1,0,0  2,1,0,0  4,2,0,0  0,0,0,0  0,0,0,0  4,2,0,0  2,1,0,0  6,1,0,1  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  0,0,0,0  ",