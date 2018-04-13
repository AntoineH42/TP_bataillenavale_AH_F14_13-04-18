PROGRAM bataille_navale_correction;

USES crt;

CONST
	MINLIGNE=1;
	MAXLIGNE=50;
	MINCOL=1;
	MAXCOL=50;
	NBBATEAUX=2;
	MAXCASES=5;

TYPE
	cell=record
		ligne,colonne:INTEGER;
		end;

	bateau=record
		mcase:array[1..MAXCASES] OF cell;
		end;

	flotte=record
		nbateau:array[1..NBBATEAUX] OF bateau;
		end;

	bool=(VRAI,FAUX);

	posbateau=(horizontal,vertical,diagonal);

	etatbateau=(touche,coule);

	etatflotte=(aflot,asombre);

	etatjoueur=(gagne,perdu);

PROCEDURE createcell (l,c:INTEGER; VAR mcell:cell);
	begin
		mcell.ligne:=l;
		mcell.colonne:=c;
	end;

FUNCTION cmpcell (mcell,tcell:cell):BOOLEAN;
	begin
		IF ((mcell.ligne=tcell.ligne) AND (mcell.colonne=tcell.colonne)) THEN
		cmpcell:=TRUE;
	end;

FUNCTION createbateau (mcase:cell; taille:INTEGER):bateau;
	VAR
		i, pos:INTEGER;
		res:bateau;
		positionB:posbateau;

	BEGIN
		randomize;
		pos:=random(3);
		positionB:=posbateau(pos);
		FOR i:=1 TO MAXCASES DO
		begin

			IF (i<=taille) THEN
				begin
				res.mcase[i].ligne:=mcase.ligne;
				res.mcase[i].colonne:=mcase.colonne;
				end
			ELSE
				begin
				res.mcase[i].ligne:=0;
				res.mcase[i].colonne:=0;
				end;

			IF (positionB=horizontal) THEN
				mcase.colonne:=mcase.colonne+1;
			ELSE
				IF (positionB=vertical) THEN
					mcase.ligne:=mcase.ligne+1;
				ELSE
					IF (positionB=diagonal) THEN
						begin
						mcase.colonne:=mcase.colonne+1;
						mcase.ligne:=mcase.ligne+1;
						end;
			end;
	END;

FUNCTION ctrlcell(mbat:bateau;ncell:cell):BOOLEAN;
	VAR
		i:INTEGER;
		valtest:BOOLEAN;

	BEGIN
		valtest:=FAUX;
		FOR i:=1 TO MAXCASES DO
			begin
				IF (cmpcell(mbat.mcase[i],ncase)=TRUE) THEN
					valtest:=TRUE;
			end;
		ctrlcell:=valtest;
	END;

FUNCTION ctrlflotte(mflotte:flotte;ncell:cell):BOOLEAN;
	VAR
		i:INTEGER;
		res:BOOLEAN;

	BEGIN
		res:=FALSE;
		FOR i:=1 TO NBBATEAUX DO
			begin
				IF (cmpcell(mflotte.mbat[i],ncase)=TRUE) THEN
					res:=TRUE;
			end;
		ctrlflotte:=res;
	END;

PROCEDURE flottejoueur(ncell:cell; VAR nflotte:flotte);
	VAR
		val_posligne, val_poscol, val_taillebat, i:INTEGER;

	BEGIN
		FOR i:=1 TO NBBATEAUX DO
			begin
				val_posligne:=random(1..MAXLIGNE);
				val_poscol:=random(1..MAXCOL);
				val_taillebat:=random(1..MAXCASES);
				createcell(val_posligne,val_poscol,ncell);
				nflotte.bateau[i]:=createbateau(ncell,val_taillebat);
			end;
	END;

VAR
	fin:BOOLEAN;

//programme principal
BEGIN

	clrscr;

	fin:=FALSE;

		REPEAT
			//debut partie, joueur commence

			//placement des bateaux

			//tentative de tir, touché/coulé ou manqué

			//si toutes les cases d'un bateau sont touchées, le bateau est coulé

			//si tous les bateaux de la flotte ennemie sont coulés, le joueur gagne

		UNTIL fin=TRUE;


	readkey;
	
END.