-- Modifications des données de la bdd de v3.0.0. à v3.1.0

UPDATE `system` SET `value`='v3.1.0' WHERE `name`='chiro';

UPDATE `actes_base` SET `type`='Libre', `tarifS1`='0' WHERE `code` in ('ECHO', 'chiroCS');
UPDATE `actes_base` SET `tarifS2`='50' WHERE `code`='chiroCS';

SET @catID = (SELECT actes_cat.id FROM actes_cat WHERE actes_cat.name='chiroCatConsult');
UPDATE `actes` SET `details`='chiroCS:' WHERE `cat`=@catID and `label`='Consultation chiropratique';
UPDATE `actes` SET `details`='chiroCS: \nECHO: ' WHERE `cat`=@catID and `label`='Consultation + échographie';

UPDATE `data_types` SET `formValues`='baseReglementLibre' WHERE `name`='chiroReglePorteur';

INSERT IGNORE INTO `configuration` (`name`, `level`, `module`, `value`) VALUES
('administratifSecteurHonoraires', 'module', 'chiro', '');

UPDATE `forms` SET `yamlStructure`='global:\r\n  formClass: \'chiroCS hide\' \r\nstructure:\r\n####### INTRODUCTION ######\r\n  row1:\r\n    head: \'Diagnostic\'\r\n    col1:                              \r\n      size: 12\r\n      bloc:                          \r\n        - chiroDiagnostic,nolabel             		#504  \r\n  row2:                              \r\n    class: \'chiroEvolSym\'\r\n    head: \'Évolution & Symptômes\'\r\n    col1:                              \r\n      size: 12\r\n      bloc:                          \r\n        - chiroEvolSym,nolabel,rows=4    		#498  \r\n  row3:\r\n    class: \'chiroTArray\'\r\n    col1:\r\n      size: 6\r\n      bloc:\r\n         - chiroMusculaire               		#557  Musculaire\r\n         - chiroAK                       		#559  AK\r\n         - chiroNET                      		#561  NET\r\n         - chiroThompson                 		#563  Thompson\r\n         - chiroTapeStrap                		#565  Tape/Strap\r\n         - chiroExtrem                   		#583  Extrémités\r\n    col2:\r\n      size: 6\r\n      bloc:\r\n         - chiroCranien                  		#558  Cranien\r\n         - chiroTBM                      		#560  TBM\r\n         - chiroWhitesonNot              		#562  Whiteson/NOT\r\n         - chiroActivator                		#564  Activator\r\n         - chiroHIO                      		#566  HIO\r\n         - label{SOT}                        		\r\n         - chiroSOTCat1                  		#568  Cat I\r\n         - chiroSOTCat2                  		#569  Cat II\r\n         - chiroSOTCat3                  		#570  Cat III\r\n  row4:\r\n    class: \'chiroAutres\'\r\n    col1:\r\n      size: 12\r\n      bloc:\r\n         - chiroAutres                   		#567  Autres\r\n  row5:\r\n    class: \'chiroNotes\'\r\n    col1:\r\n      size: 12\r\n      bloc:\r\n        - chiroNotes,nolabel,rows=8      		#718  Notes\r\n  row6:\r\n    class: \'chiroVArray\'\r\n    col1:                              \r\n      size: 12\r\n      bloc:\r\n        - template{chiroConsult}        		\r\n        - chiroCuneiforme_I_Lt,nolabel   		#584  Cunéïforme I Lt\r\n        - chiroCuneiforme_I_Rt,nolabel   		#585  Cunéïforme I Rt\r\n        - chiroCuneiforme_II_Lt,nolabel  		#586  Cunéïforme II Lt\r\n        - chiroCuneiforme_II_Rt,nolabel  		#587  Cunéïforme II Rt\r\n        - chiroCuneiforme_III_Lt,nolabel 		#588  Cunéïforme III Lt\r\n        - chiroCuneiforme_III_Rt,nolabel 		#589  Cunéïforme III Rt\r\n        - chiroCalcaneum_Lt,nolabel       		#590  Calcanéum Lt\r\n        - chiroCalcaneum_Rt,nolabel       		#591  Calcanéum Rt\r\n        - chiroCapitatum_Lt,nolabel       		#592  Capitatum Lt\r\n        - chiroCapitatum_Rt,nolabel       		#593  Capitatum Rt\r\n        - chiroCuboide_Lt,nolabel        		#594  Cuboïde Lt\r\n        - chiroCuboide_Rt,nolabel        		#595  Cuboïde Rt\r\n        - chiroHamatum_Lt,nolabel        		#596  Hamatum Lt\r\n        - chiroHamatum_Rt,nolabel        		#597  Hamatum Rt\r\n        - chiroIlium_Lt,nolabel          		#598  Ilium Lt\r\n        - chiroIlium_Rt,nolabel          		#599  Ilium Rt\r\n        - chiroLunatum_Lt,nolabel        		#600  Lunatum Lt\r\n        - chiroLunatum_Rt,nolabel        		#601  Lunatum Rt\r\n        - chiroMetacarpe_I_Lt,nolabel    		#602  Métacarpe I Lt\r\n        - chiroMetacarpe_I_Rt,nolabel    		#603  Métacarpe I Rt\r\n        - chiroMetacarpe_II_Lt,nolabel   		#604  Métacarpe II Lt\r\n        - chiroMetacarpe_II_Rt,nolabel   		#605  Métacarpe II Rt\r\n        - chiroMetacarpe_III_Lt,nolabel  		#606  Métacarpe III Lt\r\n        - chiroMetacarpe_III_Rt,nolabel  		#607  Métacarpe III Rt\r\n        - chiroMetacarpe_IV_Lt,nolabel   		#608  Métacarpe IV Lt\r\n        - chiroMetacarpe_IV_Rt,nolabel   		#609  Métacarpe IV Rt\r\n        - chiroMetacarpe_V_Lt,nolabel    		#610  Métacarpe V Lt\r\n        - chiroMetacarpe_V_Rt,nolabel    		#611  Métacarpe V Rt\r\n        - chiroNaviculaire_Lt,nolabel    		#612  Naviculaire Lt\r\n        - chiroNaviculaire_Rt,nolabel    		#613  Naviculaire Rt\r\n        - chiroP1_I_Lt,nolabel           		#614  P1 I Lt\r\n        - chiroP1_I_Rt,nolabel           		#615  P1 I Rt\r\n        - chiroP1_II_Lt,nolabel          		#616  P1 II Lt\r\n        - chiroP1_II_Rt,nolabel          		#617  P1 II Rt\r\n        - chiroP1_III_Lt,nolabel         		#618  P1 III Lt\r\n        - chiroP1_III_Rt,nolabel         		#619  P1 III Rt\r\n        - chiroP1_IV_Lt,nolabel          		#620  P1 IV Lt\r\n        - chiroP1_IV_Rt,nolabel          		#621  P1 IV Rt\r\n        - chiroP1_V_Lt,nolabel           		#622  P1 V Lt\r\n        - chiroP1_V_Rt,nolabel           		#623  P1 V Rt\r\n        - chiroP2_I_Lt,nolabel           		#624  P2 I Lt\r\n        - chiroP2_I_Rt,nolabel           		#625  P2 I Rt\r\n        - chiroP2_II_Lt,nolabel          		#626  P2 II Lt\r\n        - chiroP2_II_Rt,nolabel          		#627  P2 II Rt\r\n        - chiroP2_III_Lt,nolabel         		#628  P2 III Lt\r\n        - chiroP2_III_Rt,nolabel         		#629  P2 III Rt\r\n        - chiroP2_IV_Lt,nolabel          		#630  P2 IV Lt\r\n        - chiroP2_IV_Rt,nolabel          		#631  P2 IV Rt\r\n        - chiroP2_V_Lt,nolabel           		#632  P2 V Lt\r\n        - chiroP2_V_Rt,nolabel           		#633  P2 V Rt\r\n        - chiroP3_II_Lt,nolabel          		#636  P3 II Lt\r\n        - chiroP3_II_Rt,nolabel          		#637  P3 II Rt\r\n        - chiroP3_III_Lt,nolabel         		#638  P3 III Lt\r\n        - chiroP3_III_Rt,nolabel         		#639  P3 III Rt\r\n        - chiroP3_IV_Lt,nolabel          		#640  P3 IV Lt\r\n        - chiroP3_IV_Rt,nolabel          		#641  P3 IV Rt\r\n        - chiroP3_V_Lt,nolabel           		#642  P3 V Lt\r\n        - chiroP3_V_Rt,nolabel           		#643  P3 V Rt\r\n        - chiro_p1_I_Lt,nolabel          		#644  p1 I Lt\r\n        - chiro_p1_I_Rt,nolabel          		#645  p1 I Rt\r\n        - chiro_p1_II_Lt,nolabel         		#646  p1 II Lt\r\n        - chiro_p1_II_Rt,nolabel         		#647  p1 II Rt\r\n        - chiro_p1_III_Lt,nolabel        		#648  p1 III Lt\r\n        - chiro_p1_III_Rt,nolabel        		#649  p1 III Rt\r\n        - chiro_p1_IV_Lt,nolabel         		#650  p1 IV Lt\r\n        - chiro_p1_IV_Rt,nolabel         		#651  p1 IV Rt\r\n        - chiro_p1_V_Lt,nolabel          		#652  p1 V Lt\r\n        - chiro_p1_V_Rt,nolabel          		#653  p1 V Rt\r\n        - chiro_p2_I_Lt,nolabel          		#654  p2 I Lt\r\n        - chiro_p2_I_Rt,nolabel          		#655  p2 I Rt\r\n        - chiro_p2_II_Lt,nolabel         		#656  p2 II Lt\r\n        - chiro_p2_II_Rt,nolabel         		#657  p2 II Rt\r\n        - chiro_p2_III_Lt,nolabel        		#658  p2 III Lt\r\n        - chiro_p2_III_Rt,nolabel        		#659  p2 III Rt\r\n        - chiro_p2_IV_Lt,nolabel         		#660  p2 IV Lt\r\n        - chiro_p2_IV_Rt,nolabel         		#661  p2 IV Rt\r\n        - chiro_p2_V_Lt,nolabel          		#662  p2 V Lt\r\n        - chiro_p2_V_Rt,nolabel          		#663  p2 V Rt\r\n        - chiroPatella_Lt,nolabel        		#664  Patella Lt\r\n        - chiroPatella_Rt,nolabel        		#665  Patella Rt\r\n        - chiroPisiforme_Lt,nolabel      		#666  Pisiforme Lt\r\n        - chiroPisiforme_Rt,nolabel      		#667  Pisiforme Rt\r\n        - chiroSacrum,nolabel            		#668  Sacrum\r\n        - chiroScaphoide_Lt,nolabel      		#669  Scaphoïde Lt\r\n        - chiroScaphoide_Rt,nolabel      		#670  Scaphoïde Rt\r\n        - chiroScapula_Lt,nolabel        		#671  Scapula Lt\r\n        - chiroScapula_Rt,nolabel        		#672  Scapula Rt\r\n        - chiroTalus_Lt,nolabel          		#673  Talus Lt\r\n        - chiroTalus_Rt,nolabel          		#674  Talus Rt\r\n        - chiroTibia_Lt,nolabel          		#675  Tibia Lt\r\n        - chiroTibia_Rt,nolabel          		#676  Tibia Rt\r\n        - chiroTrapezium_Lt,nolabel      		#677  Trapezium Lt\r\n        - chiroTrapezium_Rt,nolabel      		#678  Trapezium Rt\r\n        - chiroTrapezoide_Lt,nolabel     		#679  Trapézoïde Lt\r\n        - chiroTrapezoide_Rt,nolabel     		#680  Trapézoïde Rt\r\n        - chiroTriquetrum_Lt,nolabel     		#681  Triquetrum Lt\r\n        - chiroTriquetrum_Rt,nolabel     		#682  Triquetrum Rt\r\n        - chiroMetatarse_I_Lt,nolabel    		#683  Métatarse I Lt\r\n        - chiroMetatarse_I_Rt,nolabel    		#684  Métatarse I Rt\r\n        - chiroMetatarse_II_Lt,nolabel   		#685  Métatarse II Lt\r\n        - chiroMetatarse_II_Rt,nolabel   		#686  Métatarse II Rt\r\n        - chiroMetatarse_III_Lt,nolabel  		#687  Métatarse III Lt\r\n        - chiroMetatarse_III_Rt,nolabel  		#688  Métatarse III Rt\r\n        - chiroMetatarse_IV_Lt,nolabel   		#689  Métatarse IV Lt\r\n        - chiroMetatarse_IV_Rt,nolabel   		#690  Métatarse IV Rt\r\n        - chiroMetatarse_V_Lt,nolabel    		#691  Métatarse V Lt\r\n        - chiroMetatarse_V_Rt,nolabel    		#692  Métatarse V Rt\r\n        - chiroMetatarso_phalangienne_Lt,nolabel 		#693  Métatarso -phalangienne Lt\r\n        - chiroMetatarso_phalangienne_Rt,nolabel 		#694  Métatarso -phalangienne Rt\r\n        - chiroTibio_fibulaire_distale_Lt,nolabel 		#695  Tibio-fibulaire distale Lt\r\n        - chiroTibio_fibulaire_distale_Rt,nolabel 		#696  Tibio-fibulaire distale Rt\r\n        - chiroATM_Lt,nolabel            		#697  ATM Lt\r\n        - chiroATM_Rt,nolabel            		#698  ATM Rt\r\n        - chiroSterno_claviculaire_Lt,nolabel 		#699  Sterno-claviculaire Lt\r\n        - chiroSterno_claviculaire_Rt,nolabel 		#700  Sterno-claviculaire Rt\r\n        - chiroAcromio_claviculaire_Lt,nolabel 		#701  Acromio-claviculaire Lt\r\n        - chiroAcromio_claviculaire_Rt,nolabel 		#702  Acromio-claviculaire Rt\r\n        - chiroGleno_humerale_Lt,nolabel 		#703  Gleno-humérale Lt\r\n        - chiroGleno_humerale_Rt,nolabel 		#704  Gléno-humérale Rt\r\n        - chiroTete_radiale_Lt,nolabel   		#705  Tête radiale Lt\r\n        - chiroTete_radiale_Rt,nolabel   		#706  Tête radiale Rt\r\n        - chiroUlna_proximal_Lt,nolabel  		#707  Ulna proximal Lt\r\n        - chiroUlna_proximal_Rt,nolabel  		#708  Ulna proximal Rt\r\n        - chiroFemoro_acetabulaire_Lt,nolabel 		#709  Fémoro-acétabulaire Lt\r\n        - chiroFemoro_acetabulaire_Rt,nolabel 		#710  Fémoro-acétabulaire Rt\r\n        - chiroTibio_fibulaire_prox_Lt,nolabel 		#711  Tibio-fibulaire prox Lt\r\n        - chiroTibio_fibulaire_prox_Rt,nolabel 		#712  Tibio-fibulaire prox Rt\r\n        - chiroSymphyse,nolabel          		#713  Symphyse\r\n        - chiroStyloide_radiale_Lt,nolabel 		#714  Styloïde radiale Lt\r\n        - chiroStyloide_radiale_Rt,nolabel 		#715  Styloïde radiale Rt\r\n        - chiroUlna_distal_Lt,nolabel    		#716  Ulna distal Lt\r\n        - chiroUlna_distal_Rt,nolabel    		#717  Ulna distal Rt\r\n        - chiroC0,nolabel                		#719  C0\r\n        - chiroC1,nolabel                		#720  C1\r\n        - chiroC2,nolabel                		#721  C2\r\n        - chiroC3,nolabel                		#722  C3\r\n        - chiroC4,nolabel                		#723  C4\r\n        - chiroC5,nolabel                		#724  C5\r\n        - chiroC6,nolabel                		#725  C6\r\n        - chiroC7,nolabel                		#726  C7\r\n        - chiroT1,nolabel                		#727  T1\r\n        - chiroT2,nolabel                		#728  T2\r\n        - chiroT3,nolabel                		#729  T3\r\n        - chiroT4,nolabel                		#730  T4\r\n        - chiroT5,nolabel                		#731  T5\r\n        - chiroT6,nolabel                		#732  T6\r\n        - chiroT7,nolabel                		#733  T7\r\n        - chiroT8,nolabel                		#734  T8\r\n        - chiroT9,nolabel                		#735  T9\r\n        - chiroT10,nolabel               		#736  T10\r\n        - chiroT11,nolabel               		#737  T11\r\n        - chiroT12,nolabel               		#738  T12\r\n        - chiroK1_Lt,nolabel             		#739  K1 Lt\r\n        - chiroK1_Rt,nolabel             		#740  K1 Rt\r\n        - chiroK2_Lt,nolabel             		#741  K2 Lt\r\n        - chiroK2_Rt,nolabel             		#742  K2 Rt\r\n        - chiroK3_Lt,nolabel             		#743  K3 Lt\r\n        - chiroK3_Rt,nolabel             		#744  K3 Rt\r\n        - chiroK4_Lt,nolabel             		#745  K4 Lt\r\n        - chiroK4_Rt,nolabel             		#746  K4 Rt\r\n        - chiroK5_Lt,nolabel             		#747  K5 Lt\r\n        - chiroK5_Rt,nolabel             		#748  K5 Rt\r\n        - chiroK6_Lt,nolabel             		#749  K6 Lt\r\n        - chiroK6_Rt,nolabel             		#750  K6 Rt\r\n        - chiroK7_Lt,nolabel             		#751  K7 Lt\r\n        - chiroK7_Rt,nolabel             		#752  K7 Rt\r\n        - chiroK8_Lt,nolabel             		#753  K8 Lt\r\n        - chiroK8_Rt,nolabel             		#754  K8 Rt\r\n        - chiroK9_Lt,nolabel             		#755  K9 Lt\r\n        - chiroK9_Rt,nolabel             		#756  K9 Rt\r\n        - chiroK10_Lt,nolabel            		#757  K10 Lt\r\n        - chiroK10_Rt,nolabel            		#758  K10 Rt\r\n        - chiroK11_Lt,nolabel            		#759  K11 Lt\r\n        - chiroK11_Rt,nolabel            		#760  K11 Rt\r\n        - chiroK12_Lt,nolabel            		#761  K12 Lt\r\n        - chiroK12_Rt,nolabel            		#762  K12 Rt\r\n        - chiroL1,nolabel                		#763  L1\r\n        - chiroL2,nolabel                		#764  L2\r\n        - chiroL3,nolabel                		#765  L3\r\n        - chiroL4,nolabel                		#766  L4\r\n        - chiroL5,nolabel                		#767  L5\r\n        - chiroCoccyx,nolabel            		#768  Coccyx\r\n' , `yamlStructureDefaut`='global:\r\n  formClass: \'chiroCS hide\' \r\nstructure:\r\n####### INTRODUCTION ######\r\n  row1:\r\n    head: \'Diagnostic\'\r\n    col1:                              \r\n      size: 12\r\n      bloc:                          \r\n        - chiroDiagnostic,nolabel             		#504  \r\n  row2:                              \r\n    class: \'chiroEvolSym\'\r\n    head: \'Évolution & Symptômes\'\r\n    col1:                              \r\n      size: 12\r\n      bloc:                          \r\n        - chiroEvolSym,nolabel,rows=4    		#498  \r\n  row3:\r\n    class: \'chiroTArray\'\r\n    col1:\r\n      size: 6\r\n      bloc:\r\n         - chiroMusculaire               		#557  Musculaire\r\n         - chiroAK                       		#559  AK\r\n         - chiroNET                      		#561  NET\r\n         - chiroThompson                 		#563  Thompson\r\n         - chiroTapeStrap                		#565  Tape/Strap\r\n         - chiroExtrem                   		#583  Extrémités\r\n    col2:\r\n      size: 6\r\n      bloc:\r\n         - chiroCranien                  		#558  Cranien\r\n         - chiroTBM                      		#560  TBM\r\n         - chiroWhitesonNot              		#562  Whiteson/NOT\r\n         - chiroActivator                		#564  Activator\r\n         - chiroHIO                      		#566  HIO\r\n         - label{SOT}                        		\r\n         - chiroSOTCat1                  		#568  Cat I\r\n         - chiroSOTCat2                  		#569  Cat II\r\n         - chiroSOTCat3                  		#570  Cat III\r\n  row4:\r\n    class: \'chiroAutres\'\r\n    col1:\r\n      size: 12\r\n      bloc:\r\n         - chiroAutres                   		#567  Autres\r\n  row5:\r\n    class: \'chiroNotes\'\r\n    col1:\r\n      size: 12\r\n      bloc:\r\n        - chiroNotes,nolabel,rows=8      		#718  Notes\r\n  row6:\r\n    class: \'chiroVArray\'\r\n    col1:                              \r\n      size: 12\r\n      bloc:\r\n        - template{chiroConsult}        		\r\n        - chiroCuneiforme_I_Lt,nolabel   		#584  Cunéïforme I Lt\r\n        - chiroCuneiforme_I_Rt,nolabel   		#585  Cunéïforme I Rt\r\n        - chiroCuneiforme_II_Lt,nolabel  		#586  Cunéïforme II Lt\r\n        - chiroCuneiforme_II_Rt,nolabel  		#587  Cunéïforme II Rt\r\n        - chiroCuneiforme_III_Lt,nolabel 		#588  Cunéïforme III Lt\r\n        - chiroCuneiforme_III_Rt,nolabel 		#589  Cunéïforme III Rt\r\n        - chiroCalcaneum_Lt,nolabel       		#590  Calcanéum Lt\r\n        - chiroCalcaneum_Rt,nolabel       		#591  Calcanéum Rt\r\n        - chiroCapitatum_Lt,nolabel       		#592  Capitatum Lt\r\n        - chiroCapitatum_Rt,nolabel       		#593  Capitatum Rt\r\n        - chiroCuboide_Lt,nolabel        		#594  Cuboïde Lt\r\n        - chiroCuboide_Rt,nolabel        		#595  Cuboïde Rt\r\n        - chiroHamatum_Lt,nolabel        		#596  Hamatum Lt\r\n        - chiroHamatum_Rt,nolabel        		#597  Hamatum Rt\r\n        - chiroIlium_Lt,nolabel          		#598  Ilium Lt\r\n        - chiroIlium_Rt,nolabel          		#599  Ilium Rt\r\n        - chiroLunatum_Lt,nolabel        		#600  Lunatum Lt\r\n        - chiroLunatum_Rt,nolabel        		#601  Lunatum Rt\r\n        - chiroMetacarpe_I_Lt,nolabel    		#602  Métacarpe I Lt\r\n        - chiroMetacarpe_I_Rt,nolabel    		#603  Métacarpe I Rt\r\n        - chiroMetacarpe_II_Lt,nolabel   		#604  Métacarpe II Lt\r\n        - chiroMetacarpe_II_Rt,nolabel   		#605  Métacarpe II Rt\r\n        - chiroMetacarpe_III_Lt,nolabel  		#606  Métacarpe III Lt\r\n        - chiroMetacarpe_III_Rt,nolabel  		#607  Métacarpe III Rt\r\n        - chiroMetacarpe_IV_Lt,nolabel   		#608  Métacarpe IV Lt\r\n        - chiroMetacarpe_IV_Rt,nolabel   		#609  Métacarpe IV Rt\r\n        - chiroMetacarpe_V_Lt,nolabel    		#610  Métacarpe V Lt\r\n        - chiroMetacarpe_V_Rt,nolabel    		#611  Métacarpe V Rt\r\n        - chiroNaviculaire_Lt,nolabel    		#612  Naviculaire Lt\r\n        - chiroNaviculaire_Rt,nolabel    		#613  Naviculaire Rt\r\n        - chiroP1_I_Lt,nolabel           		#614  P1 I Lt\r\n        - chiroP1_I_Rt,nolabel           		#615  P1 I Rt\r\n        - chiroP1_II_Lt,nolabel          		#616  P1 II Lt\r\n        - chiroP1_II_Rt,nolabel          		#617  P1 II Rt\r\n        - chiroP1_III_Lt,nolabel         		#618  P1 III Lt\r\n        - chiroP1_III_Rt,nolabel         		#619  P1 III Rt\r\n        - chiroP1_IV_Lt,nolabel          		#620  P1 IV Lt\r\n        - chiroP1_IV_Rt,nolabel          		#621  P1 IV Rt\r\n        - chiroP1_V_Lt,nolabel           		#622  P1 V Lt\r\n        - chiroP1_V_Rt,nolabel           		#623  P1 V Rt\r\n        - chiroP2_I_Lt,nolabel           		#624  P2 I Lt\r\n        - chiroP2_I_Rt,nolabel           		#625  P2 I Rt\r\n        - chiroP2_II_Lt,nolabel          		#626  P2 II Lt\r\n        - chiroP2_II_Rt,nolabel          		#627  P2 II Rt\r\n        - chiroP2_III_Lt,nolabel         		#628  P2 III Lt\r\n        - chiroP2_III_Rt,nolabel         		#629  P2 III Rt\r\n        - chiroP2_IV_Lt,nolabel          		#630  P2 IV Lt\r\n        - chiroP2_IV_Rt,nolabel          		#631  P2 IV Rt\r\n        - chiroP2_V_Lt,nolabel           		#632  P2 V Lt\r\n        - chiroP2_V_Rt,nolabel           		#633  P2 V Rt\r\n        - chiroP3_II_Lt,nolabel          		#636  P3 II Lt\r\n        - chiroP3_II_Rt,nolabel          		#637  P3 II Rt\r\n        - chiroP3_III_Lt,nolabel         		#638  P3 III Lt\r\n        - chiroP3_III_Rt,nolabel         		#639  P3 III Rt\r\n        - chiroP3_IV_Lt,nolabel          		#640  P3 IV Lt\r\n        - chiroP3_IV_Rt,nolabel          		#641  P3 IV Rt\r\n        - chiroP3_V_Lt,nolabel           		#642  P3 V Lt\r\n        - chiroP3_V_Rt,nolabel           		#643  P3 V Rt\r\n        - chiro_p1_I_Lt,nolabel          		#644  p1 I Lt\r\n        - chiro_p1_I_Rt,nolabel          		#645  p1 I Rt\r\n        - chiro_p1_II_Lt,nolabel         		#646  p1 II Lt\r\n        - chiro_p1_II_Rt,nolabel         		#647  p1 II Rt\r\n        - chiro_p1_III_Lt,nolabel        		#648  p1 III Lt\r\n        - chiro_p1_III_Rt,nolabel        		#649  p1 III Rt\r\n        - chiro_p1_IV_Lt,nolabel         		#650  p1 IV Lt\r\n        - chiro_p1_IV_Rt,nolabel         		#651  p1 IV Rt\r\n        - chiro_p1_V_Lt,nolabel          		#652  p1 V Lt\r\n        - chiro_p1_V_Rt,nolabel          		#653  p1 V Rt\r\n        - chiro_p2_I_Lt,nolabel          		#654  p2 I Lt\r\n        - chiro_p2_I_Rt,nolabel          		#655  p2 I Rt\r\n        - chiro_p2_II_Lt,nolabel         		#656  p2 II Lt\r\n        - chiro_p2_II_Rt,nolabel         		#657  p2 II Rt\r\n        - chiro_p2_III_Lt,nolabel        		#658  p2 III Lt\r\n        - chiro_p2_III_Rt,nolabel        		#659  p2 III Rt\r\n        - chiro_p2_IV_Lt,nolabel         		#660  p2 IV Lt\r\n        - chiro_p2_IV_Rt,nolabel         		#661  p2 IV Rt\r\n        - chiro_p2_V_Lt,nolabel          		#662  p2 V Lt\r\n        - chiro_p2_V_Rt,nolabel          		#663  p2 V Rt\r\n        - chiroPatella_Lt,nolabel        		#664  Patella Lt\r\n        - chiroPatella_Rt,nolabel        		#665  Patella Rt\r\n        - chiroPisiforme_Lt,nolabel      		#666  Pisiforme Lt\r\n        - chiroPisiforme_Rt,nolabel      		#667  Pisiforme Rt\r\n        - chiroSacrum,nolabel            		#668  Sacrum\r\n        - chiroScaphoide_Lt,nolabel      		#669  Scaphoïde Lt\r\n        - chiroScaphoide_Rt,nolabel      		#670  Scaphoïde Rt\r\n        - chiroScapula_Lt,nolabel        		#671  Scapula Lt\r\n        - chiroScapula_Rt,nolabel        		#672  Scapula Rt\r\n        - chiroTalus_Lt,nolabel          		#673  Talus Lt\r\n        - chiroTalus_Rt,nolabel          		#674  Talus Rt\r\n        - chiroTibia_Lt,nolabel          		#675  Tibia Lt\r\n        - chiroTibia_Rt,nolabel          		#676  Tibia Rt\r\n        - chiroTrapezium_Lt,nolabel      		#677  Trapezium Lt\r\n        - chiroTrapezium_Rt,nolabel      		#678  Trapezium Rt\r\n        - chiroTrapezoide_Lt,nolabel     		#679  Trapézoïde Lt\r\n        - chiroTrapezoide_Rt,nolabel     		#680  Trapézoïde Rt\r\n        - chiroTriquetrum_Lt,nolabel     		#681  Triquetrum Lt\r\n        - chiroTriquetrum_Rt,nolabel     		#682  Triquetrum Rt\r\n        - chiroMetatarse_I_Lt,nolabel    		#683  Métatarse I Lt\r\n        - chiroMetatarse_I_Rt,nolabel    		#684  Métatarse I Rt\r\n        - chiroMetatarse_II_Lt,nolabel   		#685  Métatarse II Lt\r\n        - chiroMetatarse_II_Rt,nolabel   		#686  Métatarse II Rt\r\n        - chiroMetatarse_III_Lt,nolabel  		#687  Métatarse III Lt\r\n        - chiroMetatarse_III_Rt,nolabel  		#688  Métatarse III Rt\r\n        - chiroMetatarse_IV_Lt,nolabel   		#689  Métatarse IV Lt\r\n        - chiroMetatarse_IV_Rt,nolabel   		#690  Métatarse IV Rt\r\n        - chiroMetatarse_V_Lt,nolabel    		#691  Métatarse V Lt\r\n        - chiroMetatarse_V_Rt,nolabel    		#692  Métatarse V Rt\r\n        - chiroMetatarso_phalangienne_Lt,nolabel 		#693  Métatarso -phalangienne Lt\r\n        - chiroMetatarso_phalangienne_Rt,nolabel 		#694  Métatarso -phalangienne Rt\r\n        - chiroTibio_fibulaire_distale_Lt,nolabel 		#695  Tibio-fibulaire distale Lt\r\n        - chiroTibio_fibulaire_distale_Rt,nolabel 		#696  Tibio-fibulaire distale Rt\r\n        - chiroATM_Lt,nolabel            		#697  ATM Lt\r\n        - chiroATM_Rt,nolabel            		#698  ATM Rt\r\n        - chiroSterno_claviculaire_Lt,nolabel 		#699  Sterno-claviculaire Lt\r\n        - chiroSterno_claviculaire_Rt,nolabel 		#700  Sterno-claviculaire Rt\r\n        - chiroAcromio_claviculaire_Lt,nolabel 		#701  Acromio-claviculaire Lt\r\n        - chiroAcromio_claviculaire_Rt,nolabel 		#702  Acromio-claviculaire Rt\r\n        - chiroGleno_humerale_Lt,nolabel 		#703  Gleno-humérale Lt\r\n        - chiroGleno_humerale_Rt,nolabel 		#704  Gléno-humérale Rt\r\n        - chiroTete_radiale_Lt,nolabel   		#705  Tête radiale Lt\r\n        - chiroTete_radiale_Rt,nolabel   		#706  Tête radiale Rt\r\n        - chiroUlna_proximal_Lt,nolabel  		#707  Ulna proximal Lt\r\n        - chiroUlna_proximal_Rt,nolabel  		#708  Ulna proximal Rt\r\n        - chiroFemoro_acetabulaire_Lt,nolabel 		#709  Fémoro-acétabulaire Lt\r\n        - chiroFemoro_acetabulaire_Rt,nolabel 		#710  Fémoro-acétabulaire Rt\r\n        - chiroTibio_fibulaire_prox_Lt,nolabel 		#711  Tibio-fibulaire prox Lt\r\n        - chiroTibio_fibulaire_prox_Rt,nolabel 		#712  Tibio-fibulaire prox Rt\r\n        - chiroSymphyse,nolabel          		#713  Symphyse\r\n        - chiroStyloide_radiale_Lt,nolabel 		#714  Styloïde radiale Lt\r\n        - chiroStyloide_radiale_Rt,nolabel 		#715  Styloïde radiale Rt\r\n        - chiroUlna_distal_Lt,nolabel    		#716  Ulna distal Lt\r\n        - chiroUlna_distal_Rt,nolabel    		#717  Ulna distal Rt\r\n        - chiroC0,nolabel                		#719  C0\r\n        - chiroC1,nolabel                		#720  C1\r\n        - chiroC2,nolabel                		#721  C2\r\n        - chiroC3,nolabel                		#722  C3\r\n        - chiroC4,nolabel                		#723  C4\r\n        - chiroC5,nolabel                		#724  C5\r\n        - chiroC6,nolabel                		#725  C6\r\n        - chiroC7,nolabel                		#726  C7\r\n        - chiroT1,nolabel                		#727  T1\r\n        - chiroT2,nolabel                		#728  T2\r\n        - chiroT3,nolabel                		#729  T3\r\n        - chiroT4,nolabel                		#730  T4\r\n        - chiroT5,nolabel                		#731  T5\r\n        - chiroT6,nolabel                		#732  T6\r\n        - chiroT7,nolabel                		#733  T7\r\n        - chiroT8,nolabel                		#734  T8\r\n        - chiroT9,nolabel                		#735  T9\r\n        - chiroT10,nolabel               		#736  T10\r\n        - chiroT11,nolabel               		#737  T11\r\n        - chiroT12,nolabel               		#738  T12\r\n        - chiroK1_Lt,nolabel             		#739  K1 Lt\r\n        - chiroK1_Rt,nolabel             		#740  K1 Rt\r\n        - chiroK2_Lt,nolabel             		#741  K2 Lt\r\n        - chiroK2_Rt,nolabel             		#742  K2 Rt\r\n        - chiroK3_Lt,nolabel             		#743  K3 Lt\r\n        - chiroK3_Rt,nolabel             		#744  K3 Rt\r\n        - chiroK4_Lt,nolabel             		#745  K4 Lt\r\n        - chiroK4_Rt,nolabel             		#746  K4 Rt\r\n        - chiroK5_Lt,nolabel             		#747  K5 Lt\r\n        - chiroK5_Rt,nolabel             		#748  K5 Rt\r\n        - chiroK6_Lt,nolabel             		#749  K6 Lt\r\n        - chiroK6_Rt,nolabel             		#750  K6 Rt\r\n        - chiroK7_Lt,nolabel             		#751  K7 Lt\r\n        - chiroK7_Rt,nolabel             		#752  K7 Rt\r\n        - chiroK8_Lt,nolabel             		#753  K8 Lt\r\n        - chiroK8_Rt,nolabel             		#754  K8 Rt\r\n        - chiroK9_Lt,nolabel             		#755  K9 Lt\r\n        - chiroK9_Rt,nolabel             		#756  K9 Rt\r\n        - chiroK10_Lt,nolabel            		#757  K10 Lt\r\n        - chiroK10_Rt,nolabel            		#758  K10 Rt\r\n        - chiroK11_Lt,nolabel            		#759  K11 Lt\r\n        - chiroK11_Rt,nolabel            		#760  K11 Rt\r\n        - chiroK12_Lt,nolabel            		#761  K12 Lt\r\n        - chiroK12_Rt,nolabel            		#762  K12 Rt\r\n        - chiroL1,nolabel                		#763  L1\r\n        - chiroL2,nolabel                		#764  L2\r\n        - chiroL3,nolabel                		#765  L3\r\n        - chiroL4,nolabel                		#766  L4\r\n        - chiroL5,nolabel                		#767  L5\r\n        - chiroCoccyx,nolabel            		#768  Coccyx\r\n' WHERE internalName='chiroConsult';
