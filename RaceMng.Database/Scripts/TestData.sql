/*
Post-Deployment Script Template              
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.    
 Use SQLCMD syntax to include a file in the post-deployment script.      
 Example:      :r .\myfile.sql                
 Use SQLCMD syntax to reference a variable in the post-deployment script.    
 Example:      :setvar TableName MyTable              
               SELECT * FROM [$(TableName)]          
--------------------------------------------------------------------------------------
*/

 
SET IDENTITY_INSERT [rc].[Race] ON 
INSERT [rc].[Race] ([Id], [Name], [Date], [IsValid]) VALUES (1, 'Běh osvobození Díly (49. ročník)', '2021-06-19', 0)
INSERT [rc].[Race] ([Id], [Name], [Date], [IsValid]) VALUES (2, 'Běh osvobození Díly (50. ročník)', '2022-05-08', 1)
SET IDENTITY_INSERT [rc].[Race] OFF

-----------------------------------------------------------------------------------------------------------------------------------------------

SET IDENTITY_INSERT [rc].[Category] ON
INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (152, 2, 'Nejmladší děti', 2015, 2022, 100, 1, 1, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (153, 2, 'Nejmladší děti', 2015, 2022, 100, 2, 2, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (154, 2, 'Přípravka mladší', 2013, 2014, 300, 3, 1, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (155, 2, 'Přípravka mladší', 2013, 2014, 300, 4, 2, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (156, 2, 'Přípravka starší', 2011, 2012, 500, 5, 1, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (157, 2, 'Přípravka starší', 2011, 2012, 500, 6, 2, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (158, 2, 'Žactvo mladší', 2009, 2010, 1000, 7, 1, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (159, 2, 'Žactvo mladší', 2009, 2010, 1000, 8, 2, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (160, 2, 'Žactvo starší', 2007, 2008, 2000, 9, 1, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (161, 2, 'Žactvo starší', 2007, 2008, 1000, 10, 2, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (162, 2, 'Dorost', 2005, 2006, 3000, 11, 1, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (163, 2, 'Dorost', 2005, 2006, 2000, 12, 2, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (164, 2, 'Ženy do 35 let', 1988, 2004, 3000, 13, 2, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (165, 2, 'Ženy nad 35 let', 1922, 1987, 3000, 14, 2, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (166, 2, 'Muži do 40 let', 1983, 2004, 9000, 15, 1, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (167, 2, 'Muži nad 40 let', 1973, 1982, 9000, 16, 1, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (168, 2, 'Muži nad 50 let', 1963, 1972, 9000, 17, 1, 1)

INSERT INTO [rc].[Category] ([ID], [Race_Id], [Name], [BirthYearFrom], [BirthYearTo],[Distance], [Position], [Sex_Id], [IsValid]) VALUES (169, 2, 'Muži nad 60 let', 1922, 1962, 9000, 18, 1, 1)
SET IDENTITY_INSERT [rc].[Category] OFF

-----------------------------------------------------------------------------------------------------------------------------------------------

SET IDENTITY_INSERT [rc].[Competitor] ON 

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (633, 'Filip', 'Smazal', 1, 1994, 'TJ Spartak Klenčí')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (634, 'Denisa', 'Hánová', 2, 2015, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (635, 'Dominik', 'Hána', 1, 2012, 'Basketbal Jiskra Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (636, 'Daniel', 'Andrle', 1, 2010, 'AC Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (637, 'Radek', 'Petrásek', 1, 1979, 'Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (638, 'Martina', 'Petrásková', 2, 1981, 'Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (639, 'Štěpán', 'Petrásek', 1, 2009, 'AC Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (640, 'Nela', 'Petrásková', 2, 2012, 'AC Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (641, 'David', 'Steidl', 1, 2012, 'AC Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (642, 'Martina', 'Buršíková', 2, 2018, 'TJ Sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (643, 'Jakub', 'Hroník', 1, 2015, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (644, 'Adéla', 'Hroníková', 2, 2018, 'Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (645, 'jmeno', 'přijmení', 1, 1984, 'Test')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (646, 'Jan', 'Novak', 1, 2012, 'Domazlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (647, 'Zuzana', 'Rýdlová', 2, 2009, 'AC Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (648, 'Ema', 'Šauerová', 2, 2011, 'Rozběhame Cesko')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (649, 'Jonáš', 'Šauer', 1, 2013, 'Rozběhame Cesko')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (650, 'Veronika', 'Poláková', 2, 1966, 'Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (651, 'Patrik', 'Peteřík', 1, 2020, 'Hujerojc')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (652, 'Josef', 'Štefek', 1, 1971, 'Nedělní běžci DO')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (653, 'Peter', 'Lorenz', 1, 1965, 'Kdyne')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (654, 'Norbert', 'Švarc', 1, 1972, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (655, 'Jiří', 'Němec', 1, 2010, 'Jiskra Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (656, 'Jakub', 'Mlynár', 1, 2016, 'Jiskra Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (657, 'Pavel', 'Berousek', 1, 1962, 'Postrekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (658, 'Barbora', 'Berouskova', 2, 2000, 'SCPL')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (659, 'Petr', 'Hammerle', 1, 1972, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (660, 'Petra', 'Hammerlová', 2, 1976, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (661, 'Zdeněk', 'Novák', 1, 1952, 'Lomikar Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (662, 'Jana', 'Kozáková', 2, 2008, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (663, 'Julie', 'Kozáková', 2, 2011, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (664, 'Daniela', 'Beranová', 2, 2010, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (665, 'Michaela', 'Lukášová', 2, 2012, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (666, 'Kristýna', 'Krejčová', 2, 2011, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (667, 'Anna', 'Krejčová', 2, 2013, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (668, 'Adéla', 'Krejčová', 2, 2011, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (669, 'Eliška', 'Schweinerová', 2, 2010, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (670, 'Silvie', 'Kramerová', 2, 2010, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (671, 'Jakub', 'Schweiner', 1, 2012, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (672, 'Tony', 'Lebo', 1, 2015, 'Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (673, 'Dan', 'Lebo', 1, 2013, 'Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (674, 'Dan', 'Lebo', 1, 2013, 'Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (675, 'Zdeňka', 'Lebová', 2, 1980, 'Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (676, 'Karel', 'Žamburek', 1, 1969, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (677, 'Miroslav', 'Rýdl', 1, 1977, 'Zřejmě slušný Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (678, 'Pavlína', 'Timurová', 2, 1984, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (679, 'Zuzana', 'Kubecová', 2, 2008, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (680, 'Jakub', 'Ledvina', 1, 2015, 'Sněhaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (681, 'Karel', 'Ledvina', 1, 2011, 'Sněhaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (682, 'Josef', 'Toman', 1, 2009, 'Tj Sokol Dily')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (683, 'Jan', 'Matyáš', 1, 2016, 'AK Škoda Plzeň')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (684, 'Vítězslav', 'Fronk', 1, 1974, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (685, 'Stanislava', 'Forsterová', 2, 1978, 'Nový Kramolín')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (686, 'Patrik', 'Němec', 1, 2019, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (687, 'Patrik', 'Jung', 1, 1995, 'Jabkoty Kdyně')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (688, 'Kateřina', 'Marešová', 2, 2010, 'HC Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (689, 'Jana', 'Rýdlová', 2, 1978, 'TJ Sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (690, 'Radek', 'Andrle', 1, 1981, 'TJ Baník Stříbro')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (691, 'Pavel', 'Majer', 1, 1976, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (692, 'Karel', 'Fait', 1, 1950, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (693, 'Janiela', 'Kratochvilova', 2, 2012, 'ZŠ mrakov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (694, 'Robin', 'Kratochvil', 1, 2015, 'ZŠ mrakov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (695, 'Toník', 'Cibulka', 1, 2017, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (696, 'Natálka', 'Cibulková', 2, 2020, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (697, 'Nikola', 'Závodná', 2, 2020, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (698, 'Šimon', 'Weber', 1, 2017, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (699, 'Eliška', 'Tauerová', 2, 2017, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (700, 'Jan', 'Kalous', 1, 2010, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (701, 'Radek', 'Petrásek', 1, 1979, 'Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (702, 'Vratislav', 'Lešek', 1, 1970, 'Šneci v běhu')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (703, 'Vratislav', 'Lešek', 1, 1970, 'Šneci v běhu')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (704, 'Ondřej', 'Teska', 1, 1986, 'Lesy ČR / Černá Řeka')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (705, 'František', 'Cihlář', 1, 1980, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (706, 'David', 'Cihlář', 1, 2009, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (707, 'Nela', 'Svačinová', 2, 2013, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (708, 'Simona', 'Cihlářová', 2, 2012, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (709, 'Patrik', 'Čech', 1, 2014, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (710, 'Adam', 'Rubáš', 1, 2015, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (711, 'Daniel', 'Andrle', 1, 2010, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (712, 'Mikuláš', 'Straka', 1, 2012, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (713, 'Zuzana', 'Gabrielová', 2, 2015, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (714, 'Dorota', 'Wagnerová', 2, 2013, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (715, 'Magdaléna', 'Šilhánková', 2, 2013, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (716, 'Kateřina', 'Šilhánková', 2, 2015, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (717, 'Julie', 'Šilhánková', 2, 2017, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (718, 'Mikuláš', 'Fajt', 1, 2010, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (719, 'Gábina', 'Fajtová', 2, 2013, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (720, 'Štěpán', 'Petrásek', 1, 2009, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (721, 'Nela', 'Petrásková', 2, 2012, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (722, 'Matthias', 'Němec', 1, 2014, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (723, 'Matthias', 'Němec', 1, 2014, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (724, 'Amálie', 'Šedivá', 2, 2015, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (725, 'Sebastián', 'Holý', 1, 2014, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (726, 'Lukáš', 'Pittr', 1, 1979, 'TJ Sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (727, 'Marek', 'Bartoň', 1, 2012, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (728, 'Marie', 'Bartoňová', 2, 2015, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (729, 'Elen', 'Šobrová', 2, 2013, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (730, 'Veronika', 'Rýdlová', 2, 2006, 'AC Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (731, 'Eliška', 'Štecová', 2, 2020, 'Nejmladší děti')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (732, 'Eliška', 'Dolejšová', 2, 2014, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (733, 'Jiří', 'Jandečka', 1, 1973, 'Sokol Prapořiště')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (734, 'Miroslav', 'Benda', 1, 1962, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (735, 'Rozálie', 'Dušová', 2, 2012, 'TJ Sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (736, 'Vladislav', 'Buršík', 1, 2015, 'Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (737, 'Marta', 'Kobanová', 2, 1976, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (738, 'Petra', 'Kůstová', 2, 2013, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (739, 'Ella', 'Kůstová', 2, 2015, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (740, 'Miloslava', 'Fišerová', 2, 1976, 'Klenčí pod Čerchovem')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (741, 'Bohdan', 'Pleticha', 1, 2012, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (742, 'Jasmína', 'Paitlová', 2, 2014, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (743, 'Anna', 'Němcová', 2, 2018, 'Miřkov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (744, 'Adam', 'Soukup', 1, 2011, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (745, 'Filip', 'Soukup', 1, 2016, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (746, 'Marie Ema', 'Pajmová', 2, 2011, 'Aktiv Sport Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (747, 'Martin', 'Sokol', 1, 1979, 'Axon sport team')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (748, 'Jan', 'Jahn', 1, 2017, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (749, 'Vojtěch', 'Musil', 1, 2011, 'AK Škoda Plzeň')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (750, 'Radka', 'Musilová', 2, 1979, 'Dobřany')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (751, 'Karel', 'Strnad', 1, 1977, 'TJ Spartak Klenčí pod Čerchovem')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (752, 'Petr', 'Ježo', 1, 2000, 'TJ Sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (753, 'Natalie', 'Temniaková', 2, 2014, 'Junior Akademie Plzeň')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (754, 'Julie', 'Gabrielová', 2, 2010, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (755, 'Václav', 'Dufek', 1, 1958, 'sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (756, 'Jindřich', 'Gabriel', 1, 1974, 'OKB')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (757, 'Silvestr', 'Kotek', 1, 1962, 'Atletclub Nýřany')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (758, 'Josef', 'Klufa', 1, 1979, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (759, 'Adam', 'Řezníček', 1, 2013, 'Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (760, 'Barbora', 'Řezníčková', 2, 2016, 'Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (761, 'Natálie', 'Pivoňková', 2, 2021, 'Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (762, 'emil', 'dvorsky', 1, 1955, 'Hujerojc')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (763, 'Nina', 'Bauerová', 2, 2020, 'Praha 14')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (764, 'Magdaléna', 'Bauerová', 2, 2018, 'Praha 14')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (765, 'Theodor', 'Bauer', 1, 2013, 'Kout na Šumavě')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (766, 'Matěj', 'Škultéty', 1, 2010, 'Sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (767, 'Matěj', 'Škultéty', 1, 2010, 'Sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (768, 'František', 'Škultéty', 1, 1962, 'Sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (769, 'Lenka', 'Škuderová', 2, 1978, 'Plzeň Lhota')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (770, 'David', 'Maier', 1, 2014, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (771, 'Jana', 'Vojáková', 2, 1994, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (772, 'Martin', 'Voják', 1, 1993, 'Mílaři Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (773, 'Pavel', 'Dyr', 1, 2018, 'Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (774, 'Péťa', 'Forst', 1, 2017, 'Kdyně')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (775, 'Radek', 'Zdráhal', 1, 2014, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (776, 'Jiří', 'Zdráhal', 1, 2012, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (777, 'Natálie', 'Freiová', 2, 2015, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (778, 'Nikol', 'Freiová', 2, 2015, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (779, 'Nikol', 'Freiová', 2, 2015, 'TJ Sokol Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (780, 'Josef', 'Mareš', 1, 1980, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (781, 'Julie', 'Fictumová', 2, 1989, 'Postřekov')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (782, 'Martin', 'Anderle', 1, 2006, 'Sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (783, 'Regina', 'Anderlová', 2, 2012, 'Sokol Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (784, 'Hana', 'Tomášová', 2, 1975, 'Dily')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (785, 'Václav', 'Bouberle', 1, 1980, 'Bike Run Beer')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (786, 'Iveta', 'Bouberlová', 2, 1978, 'Jump Aero Kdyně')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (787, 'Václav', 'Bouberle', 1, 2008, 'Mílaří Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (788, 'Tobiáš', 'Bouberle', 1, 2010, 'Mílaří Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (789, 'Šimon', 'Vavrečka', 1, 2009, 'Mílaří Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (790, 'Václav', 'Buršík', 1, 2012, 'Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (791, 'Václav', 'Milsimer', 1, 2009, 'Mílaří Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (792, 'Václav', 'Milsimer', 1, 2009, 'Mílaří Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (793, 'Adam', 'Buršík', 1, 2015, 'Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (794, 'Jan', 'Buršík', 1, 2017, 'Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (795, 'Ludvík', 'Buršík', 1, 2020, 'Díly')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (796, 'Roman', 'Kalous', 1, 1979, 'Domažlice')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (797, 'Honzík', 'Sokol', 1, 2019, 'Horšovský Týn')

INSERT INTO [rc].[Competitor] ([ID], [FirstName], [LastName], [Sex_Id], [BirthYear], [Team]) VALUES (798, 'Jan', 'Braun', 1, 1992, 'SportSoft')

SET IDENTITY_INSERT [rc].[Competitor] OFF

-----------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (159, 647, '20220428 08:11:10', 1)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 648, '20220428 11:57:14', 2)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 649, '20220428 11:58:09', 3)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 650, '20220428 17:47:37', 4)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 651, '20220428 20:00:31', 6)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (168, 652, '20220429 11:30:24', 7)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (168, 653, '20220429 12:26:35', 8)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (168, 654, '20220429 21:43:44', 9)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 655, '20220429 23:36:42', 10)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 656, '20220429 23:37:37', 11)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (169, 657, '20220430 12:05:37', 12)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (164, 658, '20220430 12:07:48', 13)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (168, 659, '20220501 19:22:07', 14)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 660, '20220501 19:22:24', 15)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (169, 661, '20220501 21:34:14', 16)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (161, 662, '20220502 09:17:45', 17)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 663, '20220502 09:18:17', 18)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (159, 664, '20220502 09:33:54', 19)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 665, '20220502 09:39:44', 20)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 666, '20220502 10:27:37', 21)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (155, 667, '20220502 10:28:09', 22)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 668, '20220502 10:31:10', 23)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (159, 669, '20220502 11:19:22', 24)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (159, 670, '20220502 11:19:58', 25)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (156, 671, '20220502 11:20:10', 26)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 672, '20220502 12:55:00', 27)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 673, '20220502 12:55:43', 28)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 674, '20220502 12:56:07', 29)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 675, '20220502 12:56:38', 30)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (168, 676, '20220502 13:32:54', 31)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 677, '20220502 20:50:11', 32)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 678, '20220503 11:03:21', 33)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (161, 679, '20220503 13:52:25', 34)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 680, '20220503 16:19:03', 35)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (156, 681, '20220503 16:19:49', 36)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 682, '20220503 18:44:29', 37)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 683, '20220504 08:10:25', 38)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 684, '20220504 11:09:44', 39)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 685, '20220504 13:46:08', 40)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 686, '20220504 18:35:28', 41)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (166, 687, '20220504 21:37:24', 42)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (159, 688, '20220504 21:50:38', 43)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 689, '20220505 06:26:53', 44)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 690, '20220505 08:39:52', 45)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 691, '20220505 09:40:51', 46)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (169, 692, '20220505 09:42:40', 47)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 693, '20220505 09:57:44', 48)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 694, '20220505 10:51:15', 49)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 695, '20220505 14:52:42', 50)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 696, '20220505 14:53:33', 51)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 697, '20220505 15:01:03', 52)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 698, '20220505 15:02:03', 53)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 699, '20220505 15:39:50', 54)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 700, '20220505 15:44:08', 55)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 701, '20220505 20:07:13', 56)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (168, 702, '20220505 20:32:21', 57)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (168, 703, '20220505 20:32:53', 58)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (166, 704, '20220505 20:37:09', 59)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 705, '20220505 21:06:44', 60)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 706, '20220505 21:07:40', 61)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (155, 707, '20220505 21:09:17', 62)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 708, '20220505 21:10:14', 63)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 709, '20220505 21:11:06', 64)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 710, '20220505 21:11:49', 65)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 711, '20220505 21:12:35', 66)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (156, 712, '20220505 21:13:12', 67)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 713, '20220505 21:14:14', 68)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (155, 714, '20220505 21:14:49', 69)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (155, 715, '20220505 21:16:10', 70)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 716, '20220505 21:16:50', 71)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 717, '20220505 21:17:17', 72)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 718, '20220505 21:18:05', 73)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (155, 719, '20220505 21:19:24', 74)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 720, '20220505 21:20:16', 75)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 721, '20220505 21:20:58', 76)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 722, '20220505 21:21:50', 77)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 723, '20220505 21:22:06', 78)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 724, '20220505 21:22:52', 79)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 725, '20220505 21:24:32', 80)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 726, '20220505 23:07:07', 81)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (156, 727, '20220506 05:52:37', 82)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 728, '20220506 05:53:19', 83)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (155, 729, '20220506 07:21:47', 84)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (163, 730, '20220506 08:27:44', 85)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 731, '20220506 08:43:24', 86)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (155, 732, '20220506 12:19:17', 87)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 733, '20220506 13:03:13', 88)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (169, 734, '20220506 13:03:47', 89)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 735, '20220506 19:37:04', 90)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 736, '20220506 19:37:54', 91)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 737, '20220506 19:50:39', 92)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (155, 738, '20220506 21:14:30', 93)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 739, '20220506 21:15:39', 94)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 740, '20220506 21:20:57', 95)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (156, 741, '20220506 21:58:21', 96)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (155, 742, '20220506 21:59:19', 97)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 743, '20220506 22:01:13', 98)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (156, 744, '20220506 22:01:56', 99)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 745, '20220506 22:12:50', 100)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 746, '20220506 22:13:56', 101)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 747, '20220506 22:22:47', 102)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 748, '20220507 07:30:42', 103)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (156, 749, '20220507 07:31:39', 104)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 750, '20220507 07:32:06', 105)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 751, '20220507 07:40:33', 106)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (166, 752, '20220507 07:58:57', 107)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (155, 753, '20220507 08:51:05', 108)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (159, 754, '20220507 09:09:06', 109)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (169, 755, '20220507 09:10:43', 110)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 756, '20220507 09:15:05', 111)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (169, 757, '20220507 10:29:10', 112)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 758, '20220507 10:47:39', 113)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 759, '20220507 10:54:27', 114)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 760, '20220507 10:56:03', 115)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 761, '20220507 17:57:00', 116)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (169, 762, '20220507 18:00:41', 117)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 763, '20220507 19:01:17', 118)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 764, '20220507 19:02:10', 119)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 765, '20220507 19:03:18', 120)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 766, '20220507 19:34:37', 121)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 767, '20220507 19:35:07', 122)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (169, 768, '20220507 19:36:20', 123)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 769, '20220507 19:40:07', 124)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 770, '20220507 20:17:31', 125)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (164, 771, '20220507 20:27:52', 126)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (166, 772, '20220507 20:28:51', 127)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 773, '20220507 20:33:10', 128)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 774, '20220507 20:36:06', 129)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (154, 775, '20220507 20:37:52', 130)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (156, 776, '20220507 20:38:55', 131)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 777, '20220507 21:04:41', 132)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 778, '20220507 21:05:25', 133)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (153, 779, '20220507 21:14:42', 134)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 780, '20220507 21:21:46', 135)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (164, 781, '20220507 21:26:43', 136)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (162, 782, '20220507 21:36:38', 137)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (157, 783, '20220507 21:38:03', 138)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 784, '20220507 21:54:19', 139)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 785, '20220507 22:06:43', 140)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (165, 786, '20220507 22:07:36', 141)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (160, 787, '20220507 22:08:43', 142)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 788, '20220507 22:09:07', 143)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 789, '20220507 22:09:45', 144)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (156, 790, '20220507 22:10:09', 145)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 791, '20220507 22:10:58', 146)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (158, 792, '20220507 22:11:04', 147)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 793, '20220507 22:11:24', 148)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 794, '20220507 22:14:09', 149)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 795, '20220507 22:14:45', 150)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (167, 796, '20220507 22:39:06', 151)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (152, 797, '20220507 22:54:11', 152)

INSERT INTO [rc].[CompetitorCategory] ([Category_Id], [Competitor_Id], [Created], [Number]) VALUES (166, 798, '20220508 00:05:16', 153)


