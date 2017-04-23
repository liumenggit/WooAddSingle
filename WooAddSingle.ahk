#NoEnv
#Persistent
#SingleInstance, force
Git_Update("https://github.com/liumenggit/WooAddSingle","Show")
ComObjError(false)

ie:=ComObjCreate("InternetExplorer.Application")
Gui +HwndMyGuiHwnd
Gui,Add,ActiveX,xm ym w500 h800 vie,ie
Gui,Add,ListView,ym w500 hp+ vmylistview,id|name|email|date|Phonen|address
ie.visible :=true
Loop, read,% A_YYYY A_MM A_DD ".txt"
    last_line := A_Index
Gui,Show
start:
fName:=RandomEnName()
StringReplace,fName,fName,`",,All
StringSplit, fName_array, fName, %A_Space%,
UEmail:=RandomEmail()
pass:=RandomPass("wd",10)
udate:= RandomDateBetween(19300101,20001231,"dd/MM/yyyy")
Phonen:=RandomPhonenumber()
Random,Rooms,1,4883
FileReadLine,FileLine,4886 Australian Address.txt,%Rooms%
address:=StrSplit(FileLine,"`t")
ie.Navigate("127.0.0.1")
while ie.busy or ie.ReadyState != 4
    Sleep, 100
ie.Navigate("https://my.woolworthsrewards.com.au/coa/#/register/5f934a94-a5bd-4adf-9287-a65580f90122")
    Sleep, 5000
ie.document.GetElementsByTagName("input")[0].Focus()
ControlSend,,%fName_array1%,ahk_id %MyGuiHwnd%
ie.document.GetElementsByTagName("input")[1].Focus()
ControlSend,,%fName_array2%,ahk_id %MyGuiHwnd%
ie.document.GetElementsByTagName("input")[2].Focus()
ControlSend,,%UEmail%,ahk_id %MyGuiHwnd%

LABEL:=ie.document.GetElementsByTagName("LABEL")
Loop % LABEL.length {
if ( LABEL.item(A_Index-1).classname="checkbox-tick" ) {
	ie.document.GetElementsByTagName("LABEL").item(A_Index-1).Click()
}}

ie.document.GetElementsByTagName("input")[1].Focus()
Sleep,5000

BUTTON:=ie.document.GetElementsByTagName("BUTTON")
Loop % BUTTON.length {
if ( BUTTON.item(A_Index-1).classname="btn btn-large grey-btn btn-fullwidth waves-effect waves-light ng-isolate-scope"){
;if ( BUTTON.item(A_Index-1).classname="btn btn-large grey-btn btn-fullwidth waves-effect waves-light ng-isolate-scope vwo_loaded vwo_loaded_19" ) {
	ie.document.GetElementsByTagName("BUTTON").item(A_Index-1).click()
	BUTTON.item(A_Index-1).Click()
	break
}}
sleep,5000

A:=ie.document.GetElementsByTagName("A")
Loop % A.length {
if ( A.item(A_Index-1).classname="mailing-address-manual-btn styled-link" ) {
	A.item(A_Index-1).Click()
	break
}}

ie.document.getElementById("mailing-fullAddress-1").Focus()
ControlSend,,% address[1],ahk_id %MyGuiHwnd%
ie.document.getElementById("mailing-suburb").Focus()
ControlSend,,% address[2],ahk_id %MyGuiHwnd%
ie.document.getElementById("mailing-postcode").Focus()
ControlSend,,% address[3],ahk_id %MyGuiHwnd%
ie.document.getElementById("mailing-state").value:=address[4]
ie.document.getElementById("mailing-state").Focus()
ControlSend,,{NumpadUp}{NumpadDown}{NumpadEnter},ahk_id %MyGuiHwnd%
ie.document.getElementById("password").Focus()
ControlSend,,Mima2017,ahk_id %MyGuiHwnd%
ie.document.getElementById("confirmpassword").Focus()
ControlSend,,Mima2017,ahk_id %MyGuiHwnd%
ie.document.getElementById("dateofbirth").Focus()
ControlSend,,%udate%,ahk_id %MyGuiHwnd%
ie.document.getElementById("mobile").Focus()
ControlSend,,%Phonen%,ahk_id %MyGuiHwnd%
ie.document.getElementById("step2nextbtn").Focus()
ie.document.getElementById("step2nextbtn").click()
sleep,5000
Thanks:="Thanks"
Tha:=ie.document.GetElementsByTagName("H1").item(1).innerhtml
IfInString,Tha,%Thanks%
{
	last_line++
	StringReplace,FileLine,FileLine,`t, ,All
    FileAppend, % "`n" last_line "`t" fName "`t" UEmail "`t" udate "`t" Phonen "`t" FileLine,% A_YYYY A_MM A_DD ".txt"
        lv_add("" ,last_line,fName,UEmail,udate,Phonen,FileLine)
        LV_ModifyCol()
}
Goto,start
return

GuiClose:
ExitApp

RandomEnName(){
    ALL_ENG_NAMES =
    (
    "fAaliyah","mAaron","fAarushi","fAbagail","fAbbey","fAbbi","fAbbie","fAbby","mAbdul","mAbdullah"
            ,"mAbe","mAbel","fAbi","fAbia","fAbigail","mAbraham","mAbram","fAbrianna","mAbriel","fAbrielle"
            ,"fAby","fAcacia","mAce","fAda","fAdalia","fAdalyn","mAdam","mAdan","fAddie","mAddison"
            ,"fAddison","mAde","fAdelaide","fAdele","fAdelene","fAdelia","fAdelina","fAdeline","mAden","mAdnan"
            ,"mAdonis","fAdreanna","mAdrian","fAdriana","fAdrianna","fAdrianne","mAdriel","fAdrienne","fAerona","fAgatha"
            ,"fAggie","fAgnes","mAhmad","mAhmed","fAida","mAidan","mAiden","fAileen","fAilsa","fAimee"
            ,"fAine","fAinsleigh","fAinsley","mAinsley","fAisha","fAisling","fAislinn","mAjay","mAl","mAlain"
            ,"fAlaina","mAlan","fAlana","fAlanis","fAlanna","fAlannah","fAlaska","mAlastair","fAlayah","fAlayna"
            ,"fAlba","mAlbert","fAlberta","mAlberto","mAlbie","mAlden","mAldo","fAleah","mAlec","fAlecia"
            ,"fAleisha","fAlejandra","mAlejandro","mAlen","fAlena","mAlesandro","fAlessandra","fAlessia","mAlex","fAlex"
            ,"fAlexa","mAlexander","fAlexandra","fAlexandria","fAlexia","fAlexis","mAlexis","fAlexus","mAlfie","mAlfonso"
            ,"mAlfred","mAlfredo","mAli","fAli","fAlia","fAlice","fAlicia","fAlina","fAlisa","fAlisha"
            ,"fAlison","fAlissa","mAlistair","fAlivia","fAliyah","fAliza","fAlize","fAlka","mAllan","mAllen"
            ,"fAllie","fAllison","fAlly","fAllyson","fAlma","fAlondra","mAlonzo","mAloysius","mAlphonso","mAlton"
            ,"mAlvin","fAlycia","fAlyshialynn","fAlyson","fAlyssa","fAlyssia","fAmalia","fAmanda","fAmani","fAmara"
            ,"mAmari","fAmari","fAmaris","fAmaya","fAmber","fAmberly","fAmelia","fAmelie","fAmerica","fAmethyst"
            ,"fAmie","fAmina","mAmir","fAmirah","mAmit","fAmity","mAmos","fAmy","fAmya","fAna"
            ,"fAnabel","fAnabelle","fAnahi","fAnais","fAnamaria","mAnand","fAnanya","fAnastasia","mAnderson","fAndie"
            ,"mAndre","fAndrea","mAndreas","mAndres","mAndrew","fAndromeda","mAndy","mAngel","fAngel","fAngela"
            ,"fAngelia","fAngelica","fAngelina","fAngeline","fAngelique","mAngelo","fAngie","mAngus","fAnika","fAnisa"
            ,"fAnita","fAniya","fAniyah","fAnjali","fAnn","fAnna","fAnnabel","fAnnabella","fAnnabelle","fAnnabeth"
            ,"fAnnalisa","fAnnalise","fAnne","fAnneke","fAnnemarie","fAnnette","fAnnie","fAnnika","fAnnmarie","mAnsel"
            ,"mAnson","fAnthea","mAnthony","fAntoinette","mAnton","fAntonia","mAntonio","mAntony","fAnuja","fAnusha"
            ,"fAnushka","fAnya","fAoibhe","fAoibheann","fAoife","fAphrodite","mApollo","fApple","fApril","fAqua"
            ,"fArabella","fArabelle","mAran","mArcher","mArchie","mAri","fAria","fAriadne","fAriana","fArianna"
            ,"fArianne","fAriel","fAriella","fArielle","fArisha","mArjun","fArleen","fArlene","fArlette","mArlo"
            ,"mArman","mArmando","mArnold","mAron","mArran","mArrie","mArt","fArtemis","mArthur","mArturo"
            ,"mArun","fArwen","mArwin","fArya","mAsa","mAsad","mAsh","fAsha","fAshanti","mAshby"
            ,"mAsher","fAshlee","fAshleigh","fAshley","mAshley","fAshlie","fAshlyn","fAshlynn","mAshton","fAshton"
            ,"fAshvini","fAsia","fAsma","mAspen","fAspen","mAston","fAstrid","mAthan","fAthena","fAthene"
            ,"mAtticus","fAubreanna","fAubree","fAubrey","mAubrey","fAudra","fAudrey","fAudrina","mAudwin","mAugust"
            ,"fAugustina","mAugustus","fAurelia","fAurora","mAusten","mAustin","fAutumn","fAva","fAvalon","mAvery"
            ,"fAvery","fAvril","mAxel","fAya","mAyaan","fAyana","fAyanna","mAyden","fAyesha","fAyisha"
            ,"fAyla","fAzalea","fAzaria","fAzariah","fBailey","mBailey","mBarack","fBarbara","fBarbie","mBarclay"
            ,"mBarnaby","mBarney","mBarrett","mBarron","mBarry","mBart","mBartholomew","mBasil","mBastian","mBaxter"
            ,"mBay","fBay","fBaylee","mBaylor","fBea","mBear","fBeatrice","fBeatrix","mBeau","fBecca"
            ,"fBeccy","mBeck","mBeckett","fBecky","fBelinda","fBella","mBellamy","fBellatrix","fBelle","mBen"
            ,"mBenedict","fBenita","mBenjamin","mBenji","mBenjy","mBennett","mBennie","mBenny","mBenson","mBentley"
            ,"mBently","fBernadette","mBernard","mBernardo","fBernice","mBernie","mBert","fBertha","mBertie","mBertram"
            ,"fBeryl","fBess","fBeth","fBethan","fBethanie","fBethany","fBetsy","fBettina","fBetty","mBev"
            ,"mBevan","fBeverly","fBeyonce","fBianca","mBill","fBillie","mBilly","mBjorn","mBladen","mBlain"
            ,"mBlaine","mBlair","fBlair","fBlaire","mBlaise","mBlake","fBlake","fBlakely","fBlanche","fBlaze"
            ,"mBlaze","fBlessing","fBliss","fBloom","fBlossom","mBlue","fBlythe","mBob","fBobbi","fBobbie"
            ,"fBobby","mBobby","mBodie","fBonita","fBonnie","fBonquesha","mBoris","mBoston","mBowen","mBoyd"
            ,"mBrad","mBraden","mBradford","mBradley","mBradwin","mBrady","mBraeden","fBraelyn","mBram","mBranden"
            ,"fBrandi","mBrandon","fBrandy","mBrantley","mBraxton","mBrayan","mBrayden","mBraydon","fBraylee","mBraylon"
            ,"fBrea","fBreanna","fBree","fBreeze","fBrenda","mBrendan","mBrenden","mBrendon","fBrenna","mBrennan"
            ,"mBrent","mBrenton","mBret","mBrett","mBrevin","mBrevyn","fBria","mBrian","fBriana","fBrianna"
            ,"fBrianne","fBriar","mBrice","fBridget","fBridgette","mBridie","fBridie","fBriella","fBrielle","mBrighton"
            ,"fBrigid","fBriley","fBrinley","mBrinley","fBriony","fBrisa","fBristol","fBritney","fBritt","fBrittany"
            ,"fBrittney","mBrock","mBrodie","mBrody","mBrogan","fBrogan","fBronagh","mBronson","fBronte","fBronwen"
            ,"fBronwyn","fBrook","fBrooke","fBrooklyn","fBrooklynn","mBrooks","mBruce","mBruno","mBryan","fBryanna"
            ,"mBryant","mBryce","mBryden","mBrydon","fBrylee","fBryn","fBrynlee","fBrynn","mBryon","fBryony"
            ,"mBryson","mBuck","mBuddy","fBunty","mBurt","mBurton","mBuster","mButch","mByron","mCadby"
            ,"mCade","mCaden","fCadence","mCael","mCaelan","mCaesar","mCai","mCaiden","fCailin","mCain"
            ,"fCaitlan","fCaitlin","fCaitlyn","mCaius","mCal","mCale","mCaleb","fCaleigh","mCalhoun","fCali"
            ,"fCalista","mCallan","mCallen","fCallie","fCalliope","fCallista","mCallum","mCalum","mCalvin","fCalypso"
            ,"mCam","fCambria","mCamden","mCameron","fCameron","fCami","fCamila","fCamilla","fCamille","mCampbell"
            ,"mCamron","fCamryn","fCandace","fCandice","fCandis","fCandy","fCaoimhe","fCaprice","fCara","mCarey"
            ,"fCarina","fCaris","fCarissa","mCarl","fCarla","fCarlene","fCarley","fCarlie","mCarlisle","mCarlos"
            ,"mCarlton","fCarly","fCarlynn","fCarmel","fCarmela","fCarmen","fCarol","fCarole","fCarolina","fCaroline"
            ,"fCarolyn","fCarrie","mCarsen","mCarson","mCarter","fCarter","mCary","fCarys","fCasey","mCasey"
            ,"mCash","mCason","mCasper","fCassandra","fCassia","fCassidy","fCassie","mCassius","mCastiel","mCastor"
            ,"fCat","fCatalina","fCate","fCaterina","mCathal","fCathalina","fCatherine","fCathleen","fCathy","fCatlin"
            ,"mCato","fCatrina","fCatriona","mCavan","mCayden","mCaydon","fCayla","fCece","fCecelia","mCecil"
            ,"fCecilia","fCecily","mCedric","fCeleste","fCelestia","fCelestine","fCelia","fCelina","fCeline","fCelise"
            ,"fCerise","fCerys","mCesar","mChad","mChance","mChandler","fChanel","fChanelle","mChanning","fChantal"
            ,"fChantelle","fCharis","fCharissa","fCharity","fCharlene","mCharles","fCharley","mCharley","mCharlie","fCharlie"
            ,"fCharlize","fCharlotte","mCharlton","fCharmaine","mChase","fChastity","mChaz","mChe","fChelsea","fChelsey"
            ,"fChenai","fChenille","fCher","fCheri","fCherie","fCherry","fCheryl","mChesney","mChester","mChevy"
            ,"fCheyanne","fCheyenne","fChiara","mChip","fChloe","mChris","fChris","fChrissy","fChrista","fChristabel"
            ,"fChristal","fChristen","fChristi","mChristian","fChristiana","fChristie","fChristina","fChristine","mChristopher","fChristy"
            ,"fChrystal","mChuck","mCian","fCiara","mCiaran","fCici","fCiel","fCierra","mCillian","fCindy"
            ,"fClaire","mClancy","fClara","fClarabelle","fClare","mClarence","fClarice","fClaris","fClarissa","fClarisse"
            ,"fClarity","mClark","fClary","mClaude","fClaudette","fClaudia","fClaudine","mClay","mClayton","fClea"
            ,"mClement","fClementine","fCleo","fCleopatra","mCliff","mClifford","mClifton","mClint","mClinton","mClive"
            ,"fClodagh","fClotilde","fClover","mClyde","mCoby","fCoco","mCody","mCohen","mColby","mCole"
            ,"fColette","mColin","fColleen","mCollin","mColm","mColt","mColton","mConan","mConner","fConnie",
    )
    ALL_ENG_NAMES = %ALL_ENG_NAMES%`n
    (
    "mConnor","mConor","mConrad","fConstance","mConstantine","mCooper","fCora","fCoral","fCoralie","fCoraline"
            ,"mCorbin","fCordelia","mCorey","fCori","fCorina","fCorinne","mCormac","fCornelia","mCornelius","fCorra"
            ,"mCory","fCosette","fCourtney","mCraig","fCressida","fCristal","mCristian","fCristina","mCristobal","mCrosby"
            ,"mCruz","fCrystal","mCullen","mCurt","mCurtis","mCuthbert","fCyndi","fCynthia","mCyril","mCyrus"
            ,"mDacey","fDagmar","fDahlia","mDaire","fDaisy","fDakota","mDakota","mDale","mDallas","mDalton"
            ,"mDamian","mDamien","mDamion","mDamon","mDan","fDana","mDana","mDane","fDanette","fDani"
            ,"fDanica","mDaniel","fDaniela","fDaniella","fDanielle","fDanika","mDanny","mDante","fDaphne","mDara"
            ,"fDara","mDaragh","fDarby","fDarcey","fDarcie","mDarcy","fDarcy","mDaren","fDaria","mDarian"
            ,"mDarin","mDario","mDarius","fDarla","fDarlene","mDarnell","mDarragh","mDarrel","mDarrell","mDarren"
            ,"mDarrin","mDarryl","mDarryn","mDarwin","mDaryl","mDash","mDashawn","fDasia","mDave","mDavid"
            ,"fDavida","mDavin","fDavina","mDavion","mDavis","fDawn","mDawson","mDax","mDaxter","mDaxton"
            ,"fDayna","fDaysha","mDayton","mDeacon","mDean","fDeana","fDeandra","mDeandre","fDeann","fDeanna"
            ,"fDeanne","fDeb","fDebbie","fDebby","fDebora","fDeborah","fDebra","mDeclan","fDee","fDeedee"
            ,"fDeena","mDeepak","fDeidre","fDeirdre","fDeja","fDelaney","fDelanie","fDelany","mDelbert","fDelia"
            ,"fDelilah","fDella","fDelores","fDelphine","fDemetria","mDemetrius","fDemi","fDena","mDenis","fDenise"
            ,"mDennis","fDenny","mDenver","mDenzel","mDeon","mDerek","mDermot","mDerrick","mDeshaun","mDeshawn"
            ,"fDesiree","mDesmond","fDestinee","fDestiny","mDev","mDevin","mDevlin","mDevon","mDewayne","mDewey"
            ,"mDexter","fDiamond","fDiana","fDiane","fDianna","fDianne","mDiarmuid","mDick","fDido","mDiego"
            ,"mDilan","mDillon","mDimitri","fDina","mDinesh","mDino","mDion","fDionne","fDior","mDirk"
            ,"fDixie","mDjango","mDmitri","fDolly","fDolores","mDominic","mDominick","fDominique","mDon","mDonald"
            ,"fDonna","mDonnie","mDonovan","fDora","fDoreen","mDorian","fDoris","fDorothy","fDot","mDoug"
            ,"mDouglas","mDoyle","mDrake","mDrew","fDrew","mDuane","mDuke","fDulce","mDuncan","mDustin"
            ,"mDwayne","mDwight","mDylan","fEabha","mEamon","mEarl","mEarnest","mEason","mEaston","fEbony"
            ,"fEcho","mEd","mEddie","mEddy","fEden","mEden","mEdgar","fEdie","mEdison","fEdith"
            ,"mEdmund","fEdna","mEdouard","mEdric","mEdsel","mEduardo","mEdward","mEdwardo","mEdwin","fEdwina"
            ,"fEffie","mEfrain","mEfren","mEgan","mEgon","fEileen","fEilidh","fEimear","fElaina","fElaine"
            ,"fElana","fEleanor","fElectra","fElektra","fElena","mEli","fEliana","mElias","mElijah","fElin"
            ,"fElina","fElinor","mEliot","fElisa","fElisabeth","fElise","mElisha","fEliza","fElizabeth","fElla"
            ,"fElle","fEllen","fEllery","fEllie","mEllington","mElliot","mElliott","fEllis","mEllis","fElly"
            ,"mElmer","mElmo","fElodie","fEloise","fElora","fElsa","fElsie","fElspeth","mElton","fElva"
            ,"fElvira","mElvis","mElwyn","fElysia","fElyza","mEmanuel","fEmanuela","fEmber","fEmelda","fEmely"
            ,"fEmer","fEmerald","mEmerson","fEmerson","mEmery","mEmet","mEmil","fEmilee","fEmilia","mEmiliano"
            ,"fEmilie","mEmilio","fEmily","fEmma","fEmmalee","fEmmaline","fEmmalyn","mEmmanuel","fEmmanuelle","fEmmeline"
            ,"mEmmerson","mEmmet","mEmmett","fEmmie","fEmmy","fEnid","mEnnio","mEnoch","mEnrique","fEnya"
            ,"mEnzo","mEoghan","mEoin","mEric","fErica","mErick","mErik","fErika","fErin","fEris"
            ,"mErnest","mErnesto","mErnie","mErrol","mErvin","mErwin","fEryn","fEsmay","fEsme","fEsmeralda"
            ,"fEsparanza","fEsperanza","mEsteban","fEstee","fEstelle","fEster","fEsther","fEstrella","mEthan","fEthel"
            ,"mEthen","mEtienne","mEuan","mEuen","mEugene","fEugenie","fEunice","mEustace","fEva","mEvan"
            ,"fEvangelina","fEvangeline","mEvangelos","fEve","fEvelin","fEvelyn","mEvelyn","mEverett","fEverly","fEvie"
            ,"fEvita","mEwan","mEzekiel","mEzio","mEzra","mFabian","mFabio","fFabrizia","mFaisal","fFaith"
            ,"fFallon","fFanny","fFarah","mFarley","fFarrah","fFatima","fFawn","fFay","fFaye","mFebian"
            ,"fFelicia","fFelicity","mFelipe","mFelix","mFergus","fFern","mFernand","fFernanda","mFernando","fFfion"
            ,"mFidel","fFifi","mFinbar","mFinlay","mFinley","mFinn","mFinnian","mFinnigan","fFiona","mFionn"
            ,"mFletcher","fFleur","fFlick","fFlo","fFlora","fFlorence","mFloyd","mFlynn","mFord","mForest"
            ,"mForrest","mFoster","mFox","fFran","fFrances","fFrancesca","mFrancesco","fFrancine","mFrancis","mFrancisco"
            ,"mFrank","fFrankie","mFrankie","mFranklin","mFranklyn","mFraser","mFred","fFreda","mFreddie","mFreddy"
            ,"mFrederick","mFredrick","fFreya","fFrida","mFritz","fGabby","mGabe","mGabriel","fGabriela","fGabriella"
            ,"fGabrielle","mGael","mGaelan","mGage","fGail","mGale","mGalen","mGannon","mGareth","mGarman"
            ,"fGarnet","mGarrett","mGarrison","mGarry","mGarth","mGary","mGaston","mGavin","fGayle","fGaynor"
            ,"fGeena","fGemma","fGena","mGene","fGenesis","fGenevieve","mGeoff","mGeoffrey","mGeorge","fGeorgette"
            ,"fGeorgia","fGeorgie","fGeorgina","mGeraint","mGerald","fGeraldine","mGerard","mGerardo","mGermain","mGerry"
            ,"fGert","fGertrude","fGia","mGian","fGianna","mGibson","mGideon","fGigi","mGil","mGilbert"
            ,"mGilberto","mGiles","fGillian","fGina","fGinger","fGinny","mGino","mGiorgio","fGiovanna","mGiovanni"
            ,"fGisela","fGiselle","fGisselle","fGladys","mGlen","fGlenda","mGlenn","fGlenys","fGloria","mGlyndwr"
            ,"fGlynis","mGodfrey","mGodric","mGodwin","fGolda","fGoldie","mGonzalo","mGordon","fGrace","fGracelyn"
            ,"fGracie","mGrady","mGraeme","mGraham","fGrainne","mGrant","mGrayson","mGreg","mGregg","mGregor"
            ,"mGregory","fGreta","fGretchen","mGrey","mGreyson","mGriffin","fGriselda","fGuadalupe","mGuillermo","fGuinevere"
            ,"mGunnar","mGunner","mGus","mGustav","mGustavo","mGuy","fGwen","fGwendolyn","fGwyneth","fHabiba"
            ,"mHaden","fHadley","mHaiden","fHailee","fHailey","mHal","fHaleigh","fHaley","fHalle","fHallie"
            ,"mHamish","mHan","mHank","fHanna","fHannah","mHans","mHarlan","fHarley","mHarley","fHarmony"
            ,"mHarold","fHarper","fHarriet","mHarris","mHarrison","mHarry","mHarvey","mHassan","fHattie","fHaven"
            ,"mHayden","fHayden","mHayes","fHaylee","fHayley","fHazel","fHazeline","mHeath","fHeather","fHeaven"
            ,"mHector","fHeidi","fHelen","fHelena","fHelene","fHelga","fHelina","mHendrik","mHendrix","mHenley"
            ,"mHenri","fHenrietta","mHenry","fHepsiba","fHera","mHerbert","mHerman","fHermione","fHester","mHeston"
            ,"fHetty","fHilary","mHilary","fHilda","fHillary","mHolden","fHollie","fHolly","mHomer","fHonesty"
            ,"fHoney","fHonor","fHonour","fHope","mHorace","mHoratio","mHoward","mHubert","mHudson","mHugh"
            ,"mHugo","mHumberto","mHumphrey","mHunter","mHuw","fHyacinth","mHywel","mIain","mIan","fIanthe"
            ,"mIanto","mIbrahim","fIda","mIdris","mIeuan","mIggy","mIgnacio","mIgor","mIke","fIla"
            ,"fIlene","fIliana","fIlona","fIlse","fImani","fImelda","fImogen","mImran","fIndia","mIndiana"
            ,"fIndie","fIndigo","fIndira","fInes","fIngrid","mInigo","fIona","mIra","fIra","fIrene"
            ,"fIrina","fIris","fIrma","mIrvin","mIrving","mIrwin","fIsa","mIsaac","fIsabel","fIsabell"
            ,"fIsabella","fIsabelle","fIsadora","mIsaiah","fIsha","mIsiah","mIsidore","fIsis","fIsla","mIsmael"
            ,"fIsobel","fIsolde","mIsrael","mIssac","fItzel","mIvan","fIvana","mIvor","fIvy","fIyanna"
            ,"fIzabella","fIzidora","fIzzie","fIzzy","mJace","fJacinda","fJacinta","mJack","mJackie","fJackie"
            ,"mJackson","mJacob","mJacoby","fJacqueline","fJacquelyn","mJacques","fJada","fJade","fJaden","mJaden"
            ,"mJadon","fJadyn","fJaelynn","mJagger","mJago","mJai","fJaida","mJaiden","fJaime","mJaime"
            ,"mJak","mJake","mJakob","mJalen","mJamal","mJames","mJameson","mJamie","fJamie","mJamison"
            ,"fJamiya","fJan","mJan","fJana","fJancis","fJane","fJanelle","fJanessa","fJanet","fJanette"
            ,"fJania","fJanice","fJanie","fJanine","fJanis","fJaniya","fJanuary","fJaqueline","mJared","mJarod",
    )
    ALL_ENG_NAMES = %ALL_ENG_NAMES%`n
    (
    "mJarrett","mJarrod","mJarvis","mJase","fJasmin","fJasmine","mJason","mJasper","mJavier","mJavon"
            ,"mJax","mJaxon","mJaxson","mJay","fJaya","mJayce","fJayda","mJayden","fJayden","mJaydon"
            ,"fJayla","mJaylen","fJaylene","mJaylin","fJaylinn","mJaylon","fJaylynn","fJayne","mJayson","fJazlyn"
            ,"fJazmin","fJazmine","fJazz","fJean","fJeanette","fJeanine","fJeanne","fJeannette","fJeannie","fJeannine"
            ,"mJeb","mJebediah","mJed","mJediah","mJedidiah","mJeff","mJefferson","mJeffery","mJeffrey","mJeffry"
            ,"fJemima","fJemma","fJen","fJena","fJenelle","fJenessa","fJenna","fJennette","fJenni","fJennie"
            ,"fJennifer","fJenny","fJensen","mJensen","mJenson","mJerald","mJeremiah","mJeremy","fJeri","mJericho"
            ,"mJermaine","mJerome","fJerri","mJerry","fJess","fJessa","mJesse","fJessica","mJessie","fJessie"
            ,"mJesus","fJet","mJet","mJethro","mJett","fJewel","fJill","fJillian","mJim","mJimmie"
            ,"mJimmy","fJo","mJoachim","fJoan","fJoann","fJoanna","fJoanne","mJoaquin","fJocelyn","fJodi"
            ,"fJodie","fJody","mJody","mJoe","mJoel","fJoelle","mJoey","mJohan","fJohanna","mJohn"
            ,"mJohnathan","mJohnathon","mJohnnie","mJohnny","fJoleen","fJolene","fJolie","mJon","mJonah","mJonas"
            ,"mJonathan","mJonathon","fJoni","mJonty","mJordan","fJordan","fJordana","mJordon","mJordy","fJordyn"
            ,"mJorge","fJorja","mJose","fJoselyn","mJoseph","fJosephine","mJosh","mJoshua","mJosiah","fJosie"
            ,"mJosue","mJovan","fJoy","fJoyce","mJuan","fJuanita","mJudah","mJudas","mJudd","fJude"
            ,"mJude","fJudith","fJudy","fJules","fJulia","mJulian","fJuliana","fJulianna","fJulianne","fJulie"
            ,"fJulienne","fJuliet","fJuliette","mJulio","fJulissa","mJulius","fJuly","fJune","fJuniper","fJuno"
            ,"fJustice","mJustice","mJustin","fJustina","fJustine","fKacey","mKade","mKaden","fKadence","mKai"
            ,"mKaiden","fKaidence","fKailey","fKailyn","mKaine","fKaitlin","fKaitlyn","fKaitlynn","mKale","fKalea"
            ,"mKaleb","fKaleigh","fKali","fKalia","fKalista","fKallie","fKamala","mKameron","fKamryn","mKane"
            ,"fKara","fKaren","fKari","fKarin","fKarina","fKarissa","mKarl","fKarla","fKarlee","fKarly"
            ,"fKarolina","mKarson","fKaryn","fKasey","mKash","mKasper","fKassandra","fKassidy","fKassie","fKat"
            ,"fKatara","fKatarina","fKate","fKatelyn","fKatelynn","fKaterina","fKatharine","fKatherine","fKathleen","fKathryn"
            ,"fKathy","fKatia","fKatie","fKatlyn","fKatniss","fKatrina","fKaty","fKatya","fKay","fKaya"
            ,"mKayden","fKaye","fKayla","fKaylee","fKayleigh","mKaylen","fKayley","fKaylie","fKaylin","mKayson"
            ,"mKeanu","fKeara","mKeaton","mKedrick","mKeegan","fKeeley","fKeely","mKeenan","fKeira","fKeisha"
            ,"mKeith","fKelis","mKellan","mKellen","fKelley","fKelli","fKellie","mKellin","mKelly","fKelly"
            ,"fKelsey","fKelsie","mKelvin","mKen","fKendall","mKendall","fKendra","mKendrick","fKenna","fKennedy"
            ,"mKennedy","mKenneth","mKenny","mKent","mKenton","fKenzie","fKera","fKeri","fKerian","fKerri"
            ,"fKerry","mKerry","mKevin","mKhalid","mKhalil","fKia","mKian","fKiana","fKiara","mKiefer"
            ,"fKiera","mKieran","mKieron","fKierra","fKiersten","fKiki","fKiley","mKillian","fKim","mKim"
            ,"fKimberlee","fKimberley","fKimberly","fKimbriella","fKimmy","mKingsley","mKingston","fKinley","fKinsey","fKinsley"
            ,"mKip","fKira","mKiran","mKirby","mKirk","fKirsten","fKirstin","fKirsty","mKit","fKitty"
            ,"fKizzy","mKlaus","mKlay","fKloe","mKnox","mKobe","mKoby","mKody","mKolby","fKora"
            ,"fKori","fKourtney","mKris","fKris","mKrish","fKrista","fKristen","fKristi","mKristian","fKristie"
            ,"fKristin","fKristina","fKristine","mKristoff","mKristopher","fKristy","fKrystal","mKurt","mKurtis","mKye"
            ,"fKyla","mKylar","mKyle","fKylee","fKyleigh","mKylen","mKyler","fKylie","fKyra","mKyran"
            ,"mKyrin","mKyron","fLacey","mLacey","mLachlan","fLacie","fLacy","fLadonna","fLaila","fLainey"
            ,"mLake","fLakyn","fLala","mLamar","mLamont","fLana","mLance","mLanden","mLandon","mLandyn"
            ,"mLane","fLaney","mLangdon","mLangston","fLara","fLarissa","mLarry","mLars","fLatoya","fLaura"
            ,"fLaurel","fLauren","mLaurence","fLaurie","mLaurie","fLauryn","fLavana","fLavender","fLavinia","mLawrence"
            ,"mLawson","fLayla","mLayne","mLayton","fLea","mLeaf","fLeah","fLeandra","mLeandro","fLeann"
            ,"fLeanna","fLeanne","mLebron","fLee","mLee","fLeela","fLeena","fLeia","mLeigh","fLeigh"
            ,"mLeighton","fLeila","fLeilani","fLela","mLeland","fLena","mLennie","mLennon","mLennox","mLenny"
            ,"fLenore","mLeo","mLeon","fLeona","mLeonard","mLeonardo","mLeonel","fLeonie","mLeopold","fLeora"
            ,"mLeroy","mLes","fLesley","mLeslie","fLeslie","fLesly","mLester","fLeticia","fLetitia","fLettie"
            ,"mLeuan","mLev","mLeven","mLevi","mLewis","mLex","fLexi","fLexia","fLexie","fLexis"
            ,"fLeyla","fLia","mLiam","fLiana","fLianne","fLibbie","fLibby","fLiberty","fLidia","mLief"
            ,"fLiesl","fLila","fLilac","fLilah","fLili","fLilian","fLiliana","fLilita","fLilith","fLillia"
            ,"fLillian","fLillie","fLilly","fLily","fLina","mLincoln","fLinda","fLindsay","fLindsey","fLindy"
            ,"mLink","mLinus","mLionel","fLisa","mLisandro","fLisette","fLiv","fLivia","fLivvy","fLiz"
            ,"fLiza","fLizbeth","fLizette","fLizzie","fLizzy","mLloyd","mLochlan","mLogan","fLogan","fLois"
            ,"mLoki","fLola","fLolita","fLondon","mLondon","mLonnie","fLora","fLoran","mLorcan","fLorelei"
            ,"mLoren","fLoren","fLorena","mLorenzo","fLoretta","fLori","fLorie","mLoris","fLorna","fLorraine"
            ,"fLorri","fLorrie","fLottie","fLotus","fLou","mLou","fLouella","mLouie","mLouis","fLouisa"
            ,"fLouise","mLowell","fLuann","mLuca","mLucas","fLucia","mLucian","fLuciana","mLuciano","fLucie"
            ,"fLucille","fLucinda","fLucky","fLucy","mLuigi","mLuis","fLuisa","mLukas","mLuke","fLulu"
            ,"fLuna","fLupita","mLuther","fLuz","fLydia","fLyla","mLyle","fLynda","mLyndon","fLyndsey"
            ,"fLynette","mLynn","fLynn","fLynne","fLynnette","fLynsey","fLyra","fLyric","mLysander","fMabel"
            ,"fMacey","fMacie","mMack","fMackenzie","fMacy","fMadalyn","fMaddie","fMaddison","mMaddox","fMaddy"
            ,"fMadeleine","fMadeline","fMadelyn","fMadison","fMadisyn","fMadonna","fMadyson","fMae","fMaeve","fMagda"
            ,"fMagdalena","fMagdalene","fMaggie","mMagnus","fMaia","fMaire","fMairead","fMaisie","mMaison","fMaisy"
            ,"fMaja","fMakayla","fMakenna","fMakenzie","mMalachi","mMalakai","mMalcolm","fMalia","mMalik","fMalina"
            ,"fMalinda","fMallory","mMalloy","fMalory","fMandy","mManny","mManuel","fManuela","fMara","mMarc"
            ,"mMarcel","fMarcela","fMarcella","fMarcelle","fMarci","fMarcia","fMarcie","mMarco","mMarcos","mMarcus"
            ,"fMarcy","fMargaret","fMargarita","fMargaux","fMarge","fMargie","fMargo","fMargot","fMargret","fMaria"
            ,"fMariah","fMariam","fMarian","fMariana","fMarianna","fMarianne","fMaribel","fMarie","fMariela","fMariella"
            ,"mMarik","fMarilyn","fMarina","mMario","mMarion","fMarion","fMarisa","fMarisol","fMarissa","fMaritza"
            ,"fMarjorie","mMark","fMarla","fMarlee","fMarlena","fMarlene","mMarley","fMarley","mMarlon","fMarnie"
            ,"mMarquis","fMarsha","mMarshall","fMartha","mMartin","fMartina","mMarty","mMartyn","mMarvin","fMary"
            ,"fMaryam","fMaryann","fMarybeth","fMasie","mMason","mMassimo","mMat","mMateo","mMathew","fMatilda"
            ,"mMatt","mMatthew","mMatthias","fMaude","fMaura","fMaureen","mMaurice","mMauricio","mMaverick","fMavis"
            ,"mMax","mMaxim","mMaximilian","mMaximus","fMaxine","mMaxwell","fMay","fMaya","fMazie","fMckayla"
            ,"fMckenna","fMckenzie","fMea","fMeadow","fMeagan","fMeera","fMeg","fMegan","fMeghan","mMehdi"
            ,"mMehtab","fMei","mMekhi","mMel","fMel","fMelanie","fMelina","fMelinda","fMelissa","fMelody"
            ,"mMelvin","fMercedes","fMercy","fMeredith","mMerick","fMerida","mMervyn","fMeryl","fMia","mMicah"
            ,"mMichael","fMichaela","mMicheal","fMichele","fMichelle","mMick","mMickey","mMiguel","fMika","fMikaela"
            ,"fMikayla","mMike","mMikey","fMikhaela","fMila","mMilan","fMildred","fMilena","mMiles","fMiley"
            ,"mMiller","fMillicent","fMillie","fMilly","mMilo","mMilton","fMimi","fMina","fMindy","fMinerva"
            ,"fMinnie","fMira","fMirabel","fMirabelle","fMiracle","fMiranda","fMiriam","fMirielle","mMisha","fMissie"
            ,"fMisty","mMitch","mMitchell","mMitt","fMitzi","mMoe","mMohamed","mMohammad","mMohammed","fMoira"
            ,"mMoises","fMollie","fMolly","fMona","fMonica","fMonika","fMonique","fMontana","mMonte","fMontserrat"
            ,"mMonty","mMordecai","mMorgan","fMorgan","fMorgana","mMorris","mMoses","fMoya","mMuhammad","fMuriel"
            ,"mMurphy","mMurray","fMya","fMyfanwy","fMyla","mMyles","fMyra","fMyrna","mMyron","fMyrtle",
    )
    ALL_ENG_NAMES = %ALL_ENG_NAMES%`n
    (
    "fNadene","fNadia","fNadine","fNaja","fNala","fNana","fNancy","fNanette","fNaomi","mNash"
            ,"mNasir","fNatalia","fNatalie","fNatasha","mNate","mNath","mNathan","mNathanael","mNathaniel","fNaya"
            ,"fNayeli","mNeal","mNed","mNehemiah","mNeil","fNell","fNellie","fNelly","mNelson","fNena"
            ,"fNerissa","mNesbit","fNessa","mNestor","fNevaeh","fNeve","mNeville","mNevin","fNia","mNiall"
            ,"fNiamh","fNichola","mNicholas","fNichole","mNick","fNicki","mNickolas","fNicky","mNicky","mNico"
            ,"fNicola","mNicolas","fNicole","fNicolette","fNieve","mNigel","fNiki","fNikita","fNikki","mNiklaus"
            ,"mNikolai","mNikolas","fNila","mNile","mNils","fNina","fNishka","mNoah","mNoe","mNoel"
            ,"fNoelle","fNoemi","fNola","mNolan","fNora","fNorah","mNorbert","fNoreen","fNorma","mNorman"
            ,"fNova","fNyla","mOakes","mOakley","fOasis","fOcean","fOctavia","mOctavio","fOdalis","fOdalys"
            ,"fOdele","fOdelia","fOdette","mOisin","mOlaf","fOlga","mOli","fOlive","mOliver","fOlivia"
            ,"mOllie","mOlly","mOmar","fOona","fOonagh","fOpal","fOphelia","fOprah","mOran","fOriana"
            ,"fOrianna","mOrion","fOrla","fOrlaith","mOrlando","mOrson","mOscar","mOsvaldo","mOswald","mOtis"
            ,"mOtto","mOwen","mOzzie","mOzzy","mPablo","mPaco","mPaddy","mPadraig","fPage","fPaige"
            ,"fPaisley","mPalmer","fPaloma","fPam","fPamela","fPandora","fPansy","fPaola","mPaolo","fParis"
            ,"mParker","mPascal","mPat","fPatience","fPatrice","fPatricia","mPatrick","fPatsy","fPatti","fPatty"
            ,"mPaul","fPaula","fPaulette","fPaulina","fPauline","mPaxton","fPayton","mPayton","fPeace","mPearce"
            ,"fPearl","mPedro","fPeggy","fPenelope","fPenny","mPercy","fPerla","fPerrie","mPerry","fPersephone"
            ,"mPetar","mPete","mPeter","fPetra","fPetunia","fPeyton","mPeyton","mPhebian","mPhil","mPhilip"
            ,"mPhilippe","mPhillip","fPhillipa","fPhilomena","mPhineas","fPhoebe","fPhoenix","mPhoenix","fPhyllis","mPierce"
            ,"mPiers","mPip","fPiper","fPippa","fPixie","fPolly","fPollyanna","fPoppy","mPorter","fPortia"
            ,"mPoul","mPrakash","fPrecious","fPresley","fPreslie","mPreston","fPrimrose","mPrince","fPrincess","mPrinceton"
            ,"fPriscilla","fPriya","fPromise","fPrudence","fPrue","fQueenie","mQuentin","fQuiana","mQuincy","mQuinlan"
            ,"fQuinn","mQuinn","mQuinton","mQuintrell","fRabia","fRachael","fRachel","fRachelle","fRae","fRaegan"
            ,"fRaelyn","mRafael","mRafferty","mRaheem","mRahul","mRaiden","fRaina","fRaine","mRaj","mRajesh"
            ,"mRalph","mRam","mRameel","mRamon","fRamona","mRamsey","fRamsha","mRandal","mRandall","fRandi"
            ,"mRandolph","mRandy","fRani","fRania","mRaoul","mRaphael","fRaquel","mRashad","mRashan","mRashid"
            ,"mRaul","fRaven","mRavi","mRay","fRaya","mRaylan","mRaymond","fRayna","fRayne","fReagan"
            ,"fReanna","fReanne","fRebecca","fRebekah","mReece","mReed","mReef","fReese","mReese","fRegan"
            ,"mReggie","fRegina","mReginald","mRehan","mReid","mReilly","fReilly","fReina","mRemco","fRemi"
            ,"mRemington","mRemy","mRen","fRena","fRenata","mRene","fRene","fRenee","fRenesmee","mReuben"
            ,"mRex","fReyna","mReynaldo","mReza","fRhea","mRhett","fRhian","fRhianna","fRhiannon","fRhoda"
            ,"fRhona","fRhonda","mRhys","fRia","mRian","fRianna","mRicardo","mRich","mRichard","mRichie"
            ,"mRick","mRickey","fRicki","mRickie","mRicky","mRico","mRider","fRihanna","mRik","mRiker"
            ,"fRikki","mRiley","fRiley","mRio","fRita","mRiver","fRiver","fRiya","mRoan","fRoanne"
            ,"mRob","mRobbie","mRobby","mRobert","fRoberta","mRoberto","fRobin","mRobin","fRobyn","mRocco"
            ,"fRochelle","fRocio","mRock","mRocky","mRod","mRoderick","mRodger","mRodney","mRodolfo","mRodrigo"
            ,"mRogelio","mRoger","mRohan","fRoisin","mRoland","fRolanda","mRolando","mRoman","mRomeo","mRon"
            ,"mRonald","mRonan","fRonda","fRoni","mRonnie","mRonny","mRoosevelt","mRory","fRosa","fRosalie"
            ,"fRosalina","fRosalind","fRosalinda","fRosalynn","fRosanna","mRoscoe","fRose","fRoseanne","fRosella","fRosemarie"
            ,"fRosemary","fRosetta","fRosie","mRoss","fRosy","fRowan","mRowan","fRowena","fRoxana","fRoxanne"
            ,"fRoxie","fRoxy","mRoy","mRoyce","fRozlynn","mRuairi","mRuben","mRubin","fRuby","mRudolph"
            ,"mRudy","fRue","mRufus","mRupert","mRuss","mRussell","mRusty","fRuth","fRuthie","mRyan"
            ,"fRyanne","fRydel","mRyder","mRyker","mRylan","mRyland","fRylee","fRyleigh","mRyley","fRylie"
            ,"fSabina","fSabine","fSable","fSabrina","mSacha","fSade","fSadhbh","fSadie","fSaffron","fSafire"
            ,"fSafiya","fSage","fSahara","mSaid","fSaige","fSaira","fSally","fSalma","fSalome","mSalvador"
            ,"mSalvatore","mSam","fSam","fSamantha","fSamara","fSamia","mSamir","fSamira","fSammie","fSammy"
            ,"mSammy","mSamson","mSamuel","mSandeep","fSandra","fSandy","mSandy","fSania","mSanjay","mSantiago"
            ,"fSaoirse","fSapphire","fSara","fSarah","fSarina","fSariya","fSascha","fSasha","mSasha","fSaskia"
            ,"mSaul","fSavanna","fSavannah","mSawyer","fScarlet","fScarlett","mScot","mScott","mScottie","mScotty"
            ,"mSeamus","mSean","mSeb","mSebastian","fSebastianne","mSebastien","mSebestian","fSelah","fSelena","fSelene"
            ,"fSelina","fSelma","fSenuri","fSeptember","fSeren","fSerena","fSerenity","mSergio","mSeth","mShadrach"
            ,"fShakira","fShana","mShane","fShania","mShannon","fShannon","fShari","fSharon","fShary","mShaun"
            ,"fShauna","mShawn","fShawn","fShawna","fShawnette","mShay","fShayla","fShayna","mShayne","fShea"
            ,"mShea","fSheba","fSheena","fSheila","fShelby","mSheldon","fShelia","fShelley","fShelly","mShelton"
            ,"fSheri","fSheridan","mSherlock","mSherman","fSherri","fSherrie","fSherry","fSheryl","mShiloh","fShirley"
            ,"fShivani","fShona","fShonagh","fShreya","fShyla","fSian","mSid","fSidney","mSidney","fSienna"
            ,"fSierra","fSigourney","mSilas","fSilvia","mSimeon","mSimon","fSimone","fSimran","fSinead","fSiobhan"
            ,"fSky","mSky","fSkye","mSkylar","fSkylar","mSkyler","fSkyler","mSlade","fSloane","fSnow"
            ,"fSofia","fSofie","mSol","mSolomon","fSondra","fSonia","fSonja","mSonny","fSonya","fSophia"
            ,"fSophie","fSophy","mSoren","fSorrel","mSpencer","mSpike","fSpring","mStacey","fStacey","fStaci"
            ,"fStacie","mStacy","fStacy","mStan","mStanley","fStar","fStarla","mStefan","fStefanie","fStella"
            ,"fSteph","mStephan","fStephanie","mStephen","mSterling","mSteve","mSteven","mStevie","mStewart","mStone"
            ,"mStorm","mStuart","fSue","mSufyan","fSugar","fSuki","mSullivan","fSummer","fSusan","fSusanna"
            ,"fSusannah","fSusanne","fSusie","fSutton","fSuzanna","fSuzanne","fSuzette","fSuzie","fSuzy","mSven"
            ,"fSybil","fSydney","mSylvester","fSylvia","fSylvie","fTabatha","fTabitha","mTadhg","fTahlia","fTala"
            ,"fTalia","fTalitha","fTaliyah","fTallulah","mTalon","mTam","fTamara","fTamera","fTami","fTamia"
            ,"fTamika","fTammi","fTammie","fTammy","fTamra","fTamsin","fTania","fTanika","fTanisha","mTanner",
    )
    ALL_ENG_NAMES = %ALL_ENG_NAMES%`n
    (
    "fTanya","fTara","mTariq","mTarquin","fTaryn","fTasha","fTasmin","mTate","fTatiana","fTatum"
            ,"fTawana","fTaya","fTayah","fTayla","fTaylah","fTayler","mTaylor","fTaylor","fTeagan","mTed"
            ,"mTeddy","fTeegan","fTegan","fTeigan","fTenille","mTeo","mTerence","fTeresa","fTeri","mTerrance"
            ,"mTerrell","mTerrence","fTerri","fTerrie","fTerry","mTerry","fTess","fTessa","mTevin","mTex"
            ,"mThad","mThaddeus","fThalia","fThea","fThelma","mTheo","fTheodora","mTheodore","mTheophilus","fTheresa"
            ,"fTherese","mThomas","fThomasina","mThor","fTia","mTiago","fTiana","mTiberius","fTiegan","fTiffany"
            ,"mTiger","fTilly","mTim","mTimmy","mTimothy","fTina","fTisha","mTito","mTitus","mTobias"
            ,"mTobin","mToby","mTod","mTodd","mTom","mTomas","mTommie","mTommy","fToni","fTonia"
            ,"mTony","fTonya","fTori","mTorin","mToryn","mTrace","fTracey","mTracey","fTraci","fTracie"
            ,"mTracy","fTracy","mTravis","mTray","mTremaine","mTrent","mTrenton","mTrevon","mTrevor","mTrey"
            ,"fTricia","fTrina","fTrinity","fTrish","fTrisha","fTrista","mTristan","mTristen","mTriston","fTrixie"
            ,"fTrixy","mTroy","fTrudy","mTruman","mTucker","fTula","fTulip","mTy","mTyler","fTyra"
            ,"mTyrese","mTyrone","mTyson","fUlrica","mUlysses","fUma","mUmar","fUna","mUriah","mUriel"
            ,"fUrsula","mUsama","mValentin","fValentina","mValentine","mValentino","fValeria","fValerie","fValery","mVan"
            ,"mVance","fVanessa","mVasco","mVaughn","fVeda","fVelma","fVenetia","fVenus","fVera","fVerity"
            ,"mVernon","fVeronica","fVicki","fVickie","fVicky","mVictor","fVictoria","fVienna","mVihan","mVijay"
            ,"mVikram","mVince","mVincent","mVinnie","fViola","fViolet","fVioletta","mVirgil","fVirginia","mVishal"
            ,"fVivian","mVivian","fViviana","fVivien","fVivienne","mVlad","mVladimir","mWade","mWalker","mWallace"
            ,"fWallis","mWalter","fWanda","mWarren","fWaverley","mWaylon","mWayne","mWendell","fWendi","fWendy"
            ,"mWes","mWesley","mWeston","fWhitney","mWilbert","mWilbur","mWiley","mWilfred","mWilhelm","fWilhelmina"
            ,"mWill","fWilla","mWillam","mWillard","mWillem","mWilliam","mWillie","mWillis","fWillow","fWilma"
            ,"mWilson","fWinnie","fWinnifred","fWinona","mWinston","fWinter","mWolfgang","mWoody","mWyatt","mXander"
            ,"fXandra","fXanthe","mXavier","fXaviera","fXena","mXerxes","fXia","fXimena","fXochil","fXochitl"
            ,"mYahir","mYardley","fYasmin","fYasmine","fYazmin","mYehudi","fYelena","fYesenia","mYestin","fYolanda"
            ,"mYork","fYsabel","fYulissa","mYuri","mYusuf","fYvaine","mYves","fYvette","fYvonne","mZac"
            ,"mZach","mZachariah","mZachary","mZachery","mZack","mZackary","mZackery","fZada","fZaheera","fZahra"
            ,"mZaiden","mZain","mZaine","fZaira","mZak","fZakia","fZali","mZander","mZane","fZara"
            ,"fZaria","fZaya","mZayden","fZayla","mZayn","mZayne","mZeb","mZebulon","mZed","mZeke"
            ,"fZelda","fZelida","fZelina","fZena","fZendaya","mZeph","fZia","mZiggy","fZina","mZion"
            ,"fZiva","fZoe","fZoey","fZola","mZoltan","fZora","fZoya","fZula","fZuri","mZuriel"
            ,"fZyana","mZylen",
    )
    StringSplit, ENG_NAMES_Array, ALL_ENG_NAMES,`,,"
    size := ENG_NAMES_Array0

    Random, idx_first, 1, %size%
    Random, idx_last, 1, %size%
    first_words := SubStr(ENG_NAMES_Array%idx_first%,2)
    last_words := SubStr(ENG_NAMES_Array%idx_last%,2)

    return % first_words A_Space last_words
}

RandomPhonenumber(){
    Random,randnum,400000000,499999999
    randnum:= % 0 randnum
    return randnum
}


RandomDateBetween(startday,endday,FormatStyle){
    EnvSub, endday, %startday%, days
    Random,RandomDays,1,%endday%
    EnvAdd,startday,RandomDays,Days
    FormatTime ,startday,%startday% ,%FormatStyle%
    return startday
}



randomchr(Chrlen:=8){
    loop,26
        n .= Chr(64+a_index)
    n .= "0123456789"
    loop,% ChrLen {
        Random,rnd,1,% StrLen(n)
        Random,UL,0,1
        b .= RegExReplace(SubStr(n,rnd,1),".$","$" (Round(UL)? "U":"L") "0")
    }
    return b
}

RandomEmail(ChrLen:=8){
    loop,26
        n .= Chr(64+a_index)
    n .= "0123456789"
    loop,% ChrLen {
        Random,rnd,1,% StrLen(n)
        Random,UL,0,1
        username1 .= RegExReplace(SubStr(n,rnd,1),".$","$" (Round(UL)? "U":"L") "0")
    }
    hostname=
    (
@hotmail.com
@gmail.com
@33.33mail.com
    )
    StringSplit, hostname_Array, hostname,`n
    Random, idx_host, 1, %hostname_Array0%
    rand_hostname := SubStr(hostname_Array%idx_host%,1)
    return % username1  rand_hostname
}

setWbCom(name=false, url=false) {
    if (!name AND !url) {
        return false
    }
    wb:=false
    For wb in ComObjCreate( "Shell.Application" ).Windows {
        Try {
            If ((InStr(wb.locationName, name) AND name) OR (InStr(wb.locationURL, url) AND url)) && InStr(wb.FullName, "iexplore.exe") {
                return wb
            }
        } Catch, e {
            if (e AND this.debug) {
                FileAppend, % "`r`nCOM Error: " . e, % this.debug_file
            }
        }
    }
    if (debug) {
        this.errorWindow("Failed to find web browser.`r`nName:`t" . name . "`r`nURL:`t" . url)
    }
    return false
}

RandomPass(kind:="Wwd",length:=8){
;kind:类型 W大写 w小写 d数字 可以组合 length:长度
char := [1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",0,1,2,3,4,5,6,7,8,9]
char[0] := 0 ;定义数组
option := kind
kind = 0 ;必须先赋值  不然后面的加法无效
kind := InStr(option,"W",1) ? kind+100 : kind ;InStr区分大小写
kind := InStr(option,"w",1) ? kind+10 : kind
kind := InStr(option,"d") ? kind+1 : kind
;判断类型并设置随机数最小最大值
if kind=111
    min:=0,max:=61
else if kind=110
    min:=10,max:=61
else if kind=11
    min:=0,max:=35
else if kind=101
    min:=36,max:=71
else if kind=1
    min:=0,max=9
else if kind=10
    min:=10,max=35
else if kind=100
    min:=36,max=61
loop % length
{
Random, l, %min%, %max%
str .= char[l]
}
return str
}

WBGet(WinTitle="ahk_class IEFrame", Svr#=1) {               ;// based on ComObjQuery docs
   static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
        , IID := "{0002DF05-0000-0000-C000-000000000046}"   ;// IID_IWebBrowserApp
;//     , IID := "{332C4427-26CB-11D0-B483-00C04FD90119}"   ;// IID_IHTMLWindow2
   SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%

   if (ErrorLevel != "FAIL") {
      lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
      if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
         DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
         return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
      }
   }
}


;作者：请勿打扰
;功能：适用GItHub项目更新，加入脚本中即可使用自己的GitHub项目地址
;介绍：根据GitHub中Commitkey获取是否更新
;注意：能够使用GitHub的朋友应该对代码都非常熟悉那么有其他需要请自行修改

Git_Update(GitUrl,GressSet:="Hide"){
	if not W_InternetCheckConnection(GitUrl)
		Return
	SplitPath,GitUrl,Project_Name
	RegRead,Reg_Commitkey,HKEY_CURRENT_USER,%Project_Name%,Commitkey
	if GressSet=Show
		Progress,100,% Reg_Commitkey " >>> " Git_CcommitKey.Edition,检查更新请稍等...,% Project_Name
	Git_CcommitKey:=Git_CcommitKey(GitUrl)
	if not Git_CcommitKey.Edition{	;获取更新失败返回
		Progress,Off
		return
	}
	if not Reg_Commitkey or (Reg_Commitkey<>Git_CcommitKey.Edition){	;存在更新开始更新
		Progress,1 T Cx0 FM10,初始化下载,% Reg_Commitkey " >>> " Git_CcommitKey.Edition " 简介：" Git_CcommitKey.Commit,% Project_Name
		Git_Downloand(Git_CcommitKey,Project_Name)
	}else{
		Progress,,,暂无更新,% Project_Name
	}
	Progress,Off
	return
}

Git_Downloand(DownloandInfo,Project_Name){
	DownUrl:="https://github.com" DownloandInfo.Down
	SplitPath,A_ScriptName,,,,A_name
	SplitPath,DownUrl,DownName,,,OutNameNoExt
	if not Z_Down(DownUrl,"",A_name,A_Temp "\" DownName){
		Progress,Off
		return
	}
	UncoilUrl:=A_Temp "\" A_NowUTC
	SmartZip(A_Temp "\" DownName,UncoilUrl)
	FileDelete,% A_Temp "\" DownName
	Git_Bat(UncoilUrl "\" Project_Name "-" OutNameNoExt,Project_Name,DownloandInfo.Edition)
	ExitApp
}

Git_Bat(File,RegAdd_name,Add_Edition){
bat=
		(LTrim
:start
	ping 127.0.0.1 -n 2>nul
	del `%1
	if exist `%1 goto start
	xcopy %File% %A_ScriptDir% /s/e/y
	reg add HKEY_CURRENT_USER\%RegAdd_name% /v Commitkey /t REG_SZ /d %Add_Edition% /f
	start %A_ScriptFullPath%
	del `%0
	)
	IfExist GitDelete.bat
		FileDelete GitDelete.bat
	FileAppend,%bat%,GitDelete.bat
	Run,GitDelete.bat,,Hide
	ExitApp
}

SmartZip(s, o, t = 16)	;内置解压函数
{
	IfNotExist, %s%
		return, -1
	oShell := ComObjCreate("Shell.Application")
	if InStr(FileExist(o), "D") or (!FileExist(o) and (SubStr(s, -3) = ".zip"))
	{
		if !o
			o := A_ScriptDir
		else ifNotExist, %o%
			FileCreateDir, %o%
		Loop, %o%, 1
			sObjectLongName := A_LoopFileLongPath
		oObject := oShell.NameSpace(sObjectLongName)
		Loop, %s%, 1
		{
			oSource := oShell.NameSpace(A_LoopFileLongPath)
			oObject.CopyHere(oSource.Items, t)
		}
	}
}

Git_CcommitKey(Project_Url){
	whr:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	;whr.SetProxy("HTTPREQUEST_PROXYSETTING_PROXY","proxy_server:80","*.GitHub.com") ;https://msdn.microsoft.com/en-us/library/aa384059(v=VS.85).aspx
	whr.Open("GET",Project_Url,True)
	whr.SetRequestHeader("Content-Type","application/x-www-form-urlencoded")
	Try
	{
		whr.Send()
		whr.WaitForResponse()
		RegExMatch(whr.ResponseText,"`a)(?<=data-pjax>\n\s{8})\S{7}",NewEdition)
		RegExMatch(whr.ResponseText,"`a)\/.*\.zip",Downloand)
		RegExMatch(whr.ResponseText,"`a)(?<=class=""message"" data-pjax=""true"" title="").+(?="">)",Committitle)
		;MsgBox % NewEdition "`n" Downloand "`n" Committitle "`n-------------------------"
		Return {Edition:NewEdition,Down:Downloand,Commit:Committitle}
	}catch e {
		Return
	}
}

W_InternetCheckConnection(lpszUrl){ ;检查FTP服务是否可连接
	FLAG_ICC_FORCE_CONNECTION := 0x1
	dwReserved := 0x0
	return, DllCall("Wininet.dll\InternetCheckConnection", "Ptr", &lpszUrl, "UInt", FLAG_ICC_FORCE_CONNECTION, "UInt", dwReserved, "Int")
}
Z_Down(url:="http://61.135.169.125/forbiddenip/forbidden.html", Proxy:="",e:="utf-8", File:="",byref buf:=""){
	if (!(File?o:=FileOpen(File, "w"):1) or !DllCall("LoadLibrary", "str", "wininet") or !(h := DllCall("wininet\InternetOpen", "str", "", "uint", Proxy?3:1, "str", Proxy, "str", "", "uint", 0)))
		return 0
	c:=s:=0
	if (f := DllCall("wininet\InternetOpenUrl", "ptr", h, "str", url, "ptr", 0, "uint", 0, "uint", 0x80003000, "ptr", 0, "ptr"))
		{
			if File or IsByRef(buf)
			{
				VarSetCapacity(buffer,1024,0),VarSetCapacity(bufferlen,4,0)
				Loop, 5
				if (DllCall("wininet\HttpQueryInfo","uint",f, "uint", 22, "uint", &buffer, "uint", &bufferlen, "uint", 0) = 1)
				{
					Progress,+20
					y:= Trim(StrGet(&buffer)," `r`n"),q:=[]
					Loop,parse,y,`r`n
						(x:=InStr(A_LoopField,":"))?q[SubStr(A_LoopField, 1,x-1)]:=Trim(SubStr(A_LoopField, x+1)):q[A_LoopField]:=""
					if (e=0)
						return q
					((i:= Round((fj:=q["Content-Length"])/1024)) < 1024) ?(fx:=1024,fz:= "/" i " K",percent:=i) : (fx:=1048576,fz:= "/" Round(i/1024, 1) " M",percent:=i/1024)
					,VarSetCapacity(Buf, fj, 0),DllCall("QueryPerformanceFrequency", "Int64*", i), DllCall("QueryPerformanceCounter", "Int64*", x)
					break
				}
			}
			Progress,100
			While (DllCall("Wininet.dll\InternetQueryDataAvailable", "Ptr", F, "UIntP", S, "UInt", 0, "Ptr", 0) && (S > 0)) {             
				fj	?(DllCall("Wininet.dll\InternetReadFile", "Ptr", F, "Ptr", &Buf + C, "UInt", S, "UIntP", R),C += R,DllCall("QueryPerformanceCounter", "Int64*", y),((t:=(y-x)/i) >=1)?(Test(e,Round(c/fx,2) fz " | " Round(((c-w)/1024)/t) "KB/秒",Round(c/fx/percent*100)),x:=y,w:=c):"")
					:(VarSetCapacity(b, c+s, 0),DllCall("RtlMoveMemory", "ptr", &b, "ptr", &buf, "ptr", c),DllCall("wininet\InternetReadFile", "ptr", f, "ptr", &b+c, "uint", s, "uint*", r),VarSetCapacity(buf, c+=r, 0), DllCall("RtlMoveMemory", "ptr", &buf, "ptr", &b, "ptr", c))
			}
			(q?((fj=c)?"":q["Error"]:=c):""),(File?(o.rawWrite(buf, c), o.close()):""), DllCall("wininet\InternetCloseHandle", "ptr", f)
		}
	DllCall("wininet\InternetCloseHandle", "ptr", h)
	return (File or IsByRef(buf)?q:StrGet(&buf, c>>(e="utf-16"||e="cp1200"), e))
}
Test(A,b,c){
	Progress,%c%,%b%
}
