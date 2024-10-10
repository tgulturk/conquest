USE [ConquestBackup2]
GO
/****** Object:  StoredProcedure [dbo].[BinaKontrol]    Script Date: 10.10.2024 19:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Tunç Gültürk>
-- Create date: <14.05.2012>
-- Description:	<Süre Kontrol Prosedürü>
-- =============================================
ALTER PROCEDURE [dbo].[BinaKontrol] 
AS
BEGIN
	SET NOCOUNT ON;
	
	Declare @tablo table(
		tur int,
		islemID int,
		mtur int,
		vID int,
		bID int,		
		islem int,
		kil int,
		odun int,
		demir int,
		endtime datetime,
		gvID int,
		mCount int,
		issended bit,
		uID int,
		sayi int);
	
	Declare @tur int;
	Declare @mtur int;
	
	--İLK DEĞER--	
	INSERT INTO @tablo Select TOP 1 * from (Select tur,islemID,mtur,vID,bID,islem,kil,odun,demir,endtime,gvID,mCount,issended,null as uID,null as sayi from (Select 0 as tur,islemID,null as mtur,vID,bID,islem,kil,odun,demir,endtime,null as gvID,null as mCount,null as issended from BinaIslem 
					UNION 
					Select 1 as tur,s.islemID,s.mtur,s.vID,null as bID,null as islem,s.kil,s.odun,s.demir,s.endtime,s.gvID,s.mCount,s.issended from (Select islemID,0 as mtur,vID,gvID,kil,odun,demir,mCount,gtime as endtime,issended from MarketIslem where issended=0
					UNION
					Select islemID,1 as mtur,vID,gvID,null as kil,null as odun,null as demir,mCount,rtime as endtime,null as issended from MarketIslem) s) ss
					UNION
					Select 2 as tur,islemID,null as mtur,vID,null as bID,null as islem,kil,odun,demir,sdate as endtime,null as gvID,null as mCount,null as issended,uID,sayi from AskerIslem
					UNION
					Select 3 as tur,ss.islemID,ss.stur as mtur,ss.vID,null as bID,null as islem,ss.kil,ss.odun,ss.demir,ss.endtime,ss.gvID,null as mCount,ss.issended,null as uID,null as sayi from (Select 0 as stur,islemID,vID,gvID,gtime as endtime,kil,odun,demir,issended from SaldiriIslem where issended=0	
					UNION
					Select 1 as stur,islemID,vID,gvID,rtime as endtime,kil,odun,demir,issended from SaldiriIslem) ss) sss where sss.endtime <GETDATE() order by endtime asc	

	while (Select islemID from @tablo) is not null
	begin
		set @tur = (Select tur from @tablo)
		
		IF(@tur=0)
		begin
			Update VillageBuildings set 
				bLevel = bLevel+(Select islem from @tablo)
				where vID=(Select vID from @tablo) and
					bID=(Select bID from @tablo);
			Delete from BinaIslem where islemID=(Select islemID from @tablo) and endtime<GETDATE();
			Delete from @tablo;
		end
		
		ELSE IF(@tur=1)
		begin
			set @mtur = (Select mtur from @tablo)
			
			IF(@mtur = 0 and (Select issended from @tablo)=0)
			begin
				Update VillageResources set rCount+=(Select odun from @tablo) where vID=(Select gvID from @tablo) and rID=1
				Update VillageResources set rCount+=(Select kil from @tablo) where vID=(Select gvID from @tablo) and rID=2
				Update VillageResources set rCount+=(Select demir from @tablo) where vID=(Select gvID from @tablo) and rID=3
				Update MarketIslem set issended=1 where islemID = (Select islemID from @tablo)
				Insert into MarketRapor Values((Select vID from @tablo),(Select gvID from @tablo),(Select odun from @tablo),
					(Select kil from @tablo),(Select demir from @tablo),GETDATE(),0,0,0)
			end
			ELSE
			begin
				IF(@mtur=1)
				begin
					Delete from MarketIslem where islemID = (Select islemID from @tablo)
				end
			end
		end
		
		ELSE IF(@tur=2)
		begin
			Declare @birimsure int,@i int,@j int
			set @birimsure = (Select uTime from Units where uID = (Select uID from @tablo))
			--set @i = FLOOR(DATEDIFF(second,(Select endtime from @tablo),GETDATE())/(Select uTime from Units where uID=(Select uID from @tablo)))
			set @j = (select sayi from @tablo)
				IF (@j>1)
				begin
					Update AskerIslem set sayi-=1,sdate=DATEADD(second,@birimsure,GETDATE()) where islemID=(select islemID from @tablo)
					Update VillageUnits set uCount+=1 where vID=(select vID from @tablo) and uID=(select uID from @tablo)
				end
				ELSE
				begin
					Update VillageUnits set uCount+=1 where vID=(select vID from @tablo) and uID=(select uID from @tablo)
					Delete from AskerIslem where islemID=(select islemID from @tablo)
				end
		end
		ELSE IF(@tur=3)
		begin
			set @mtur = (Select mtur from @tablo)
			
			IF(@mtur = 0 and (Select issended from @tablo)=0)
			begin
				Declare @AS float,@PS float,@AA float,@PA float,@duvar float,@sans float,@AAY float,@APY float,@DAY float,@DPY float,@temp float,@DK float,@AK float
				set @AA = (Select SUM(u.uAttack*s.uCount) from SaldiriOrdu s inner join Units u on u.uID=s.uID where islemID=(Select islemID from @tablo) and u.uID in (5,6))
				set @PA = (Select SUM(u.uAttack*s.uCount) from SaldiriOrdu s inner join Units u on u.uID=s.uID where islemID=(Select islemID from @tablo) and u.uID<4)
				set @AS = (Select SUM((vu.uCount-ouCount)*u.uCDefense) from VillageUnits vu inner join Units u on u.uID=vu.uID where vu.vID=(Select gvID from @tablo))
				set @PS = (Select SUM((vu.uCount-ouCount)*u.uGDefense) from VillageUnits vu inner join Units u on u.uID=vu.uID where vu.vID=(Select gvID from @tablo))
				
				set @duvar = (Select ISNULL((Select wDefense from WallDefense w where w.bLevel = (Select bLevel from VillageBuildings where bID=11 and vID=(Select gvID from @tablo))),0))
				
				Declare @maxRandomValue tinyint = 50,@minRandomValue tinyint = 0; 
				set @sans = 50-(Select Cast(((@maxRandomValue + 1) - @minRandomValue)* Rand() + @minRandomValue As tinyint))
				
				set @AS = @AS * (@duvar + 100 - @sans)/100;
				set @PS = @PS * (@duvar + 100 - @sans)/100;
				
				IF(@AS = 0) set @AAY = 0
				ELSE set @AAY = @AA*100/@AS
				
				IF(@PS = 0) set @APY = 0
				ELSE set @APY = @PA*100/@PS
				
				IF(@AA = 0) set @DAY = 0
				ELSE set @DAY = @AS*100/@AA
				
				IF(@PA = 0) set @DPY = 0
				ELSE set @DPY = @PS*100/@PA
				
				IF (@AAY = 0 AND @APY = 0 and @DAY = 0 and @DPY = 0)
				begin
					set @DK = 0
					set @AK = 0
				end
				
				else
				begin
					IF (@AAY > 100) 
					begin 
						set @temp = 100 
						set @DK = 100 
					end
					ELSE set @temp = @AAY

					IF (@temp = 100) 
					begin 
						set @AK = @DAY / 2
						set @DK = 100
					end
					
					ELSE
					begin
						set @APY = (@PA * 100 / (@PS * (100 - @temp) / 100));
						
						IF (@APY > 100)
						begin
							set @DK = 100;
							set @AK = @DPY / 2;
						end
						else
						begin
							set @DK = (@APY + @AAY) / 2;
							set @AK = 100;
						end
					end
				end
				
				Declare @SKmizrak int,@SKkilic int,@SKbaltaci int,@SKcasus int,@SKhafif int,@SKagir int,@SKmisyoner int,
						@DKmizrak int,@DKkilic int,@DKbaltaci int,@DKcasus int,@DKhafif int,@DKagir int,@DKmisyoner int
				
				set @SKmizrak = ROUND((Select uCount from SaldiriOrdu where uID=1 and islemID=(Select islemID from @tablo))*@AK/100,0)
				set @SKkilic = ROUND((Select uCount from SaldiriOrdu where uID=2 and islemID=(Select islemID from @tablo))*@AK/100,0)
				set @SKbaltaci = ROUND((Select uCount from SaldiriOrdu where uID=3 and islemID=(Select islemID from @tablo))*@AK/100,0)
				set @SKhafif = ROUND((Select uCount from SaldiriOrdu where uID=5 and islemID=(Select islemID from @tablo))*@AK/100,0)
				set @SKagir = ROUND((Select uCount from SaldiriOrdu where uID=6 and islemID=(Select islemID from @tablo))*@AK/100,0)
				set @SKmisyoner = ROUND((Select uCount from SaldiriOrdu where uID=7 and islemID=(Select islemID from @tablo))*@AK/100,0)
				IF((Select uCount-ouCount from VillageUnits where uID=4 and vID=(Select gvID from @tablo))>(Select uCount from SaldiriOrdu where uID=4 and islemID=(Select islemID from @tablo)))
				begin
					set @SKcasus = (Select uCount from SaldiriOrdu where uID=4 and islemID=(Select islemID from @tablo))
				end
				ELSE
				begin
					set @SKcasus = (Select uCount-ouCount from VillageUnits where uID=4 and vID=(Select gvID from @tablo))
				end
				
				set @DKmizrak = ROUND((Select uCount-ouCount from VillageUnits where uID=1 and vID=(Select gvID from @tablo))*@DK/100,0)
				set @DKkilic = ROUND((Select uCount-ouCount from VillageUnits where uID=2 and vID=(Select gvID from @tablo))*@DK/100,0)
				set @DKbaltaci = ROUND((Select uCount-ouCount from VillageUnits where uID=3 and vID=(Select gvID from @tablo))*@DK/100,0)
				set @DKcasus = ROUND((Select uCount-ouCount from VillageUnits where uID=4 and vID=(Select gvID from @tablo))*@DK/100,0)
				set @DKhafif = ROUND((Select uCount-ouCount from VillageUnits where uID=5 and vID=(Select gvID from @tablo))*@DK/100,0)
				set @DKagir = ROUND((Select uCount-ouCount from VillageUnits where uID=6 and vID=(Select gvID from @tablo))*@DK/100,0)
				set @DKmisyoner = ROUND((Select uCount-ouCount from VillageUnits where uID=7 and vID=(Select gvID from @tablo))*@DK/100,0)
				
				Declare @GNMT float,@gkil int,@godun int,@gdemir int,@dkil int,@dodun int,@ddemir int,@misreduce int,@winner int,@mis int
				
				set @GNMT = (Select SUM(s.uCount*u.uCarry)*(100-@AK)/100 from SaldiriOrdu s inner join Units u on s.uID=u.uID where s.islemID=(Select islemID from @tablo))
				
				IF(@GNMT = 0)
				begin
					set @gkil = 0
					set @godun = 0
					set @gdemir = 0
				end
				ELSE
				begin
					set @dodun = (Select rCount from VillageResources where rID=1 and vID=(Select gvID from @tablo))
					set @dkil = (Select rCount from VillageResources where rID=2 and vID=(Select gvID from @tablo))
					set @ddemir = (Select rCount from VillageResources where rID=3 and vID=(Select gvID from @tablo))
					
					IF (@dkil < @GNMT / 3) set @gkil = @dkil
					ELSE set @gkil = Round(@GNMT / 3,0)
                
					IF (@dodun < @GNMT / 3) set @godun = @dodun
					ELSE set @godun = Round(@GNMT / 3,0)
					
					IF (@ddemir < @GNMT / 3) set @gdemir = @ddemir
					ELSE set @gdemir = Round(@GNMT / 3,0)
				end
				
				IF ((Select uCount from SaldiriOrdu where uID=7 and islemID=(select islemID from @tablo))>@SKmisyoner)				
				begin
					Declare @maxRandomValue1 tinyint = 30,@minRandomValue1 tinyint = 20; 
					set @misreduce =(Select Cast(((@maxRandomValue1 + 1) - @minRandomValue1)* Rand() + @minRandomValue1 As tinyint))
					set @mis = 1
					Update Villages set Loyalty-= @misreduce where vID=(Select gvID from @tablo)
					IF((Select Loyalty from Villages where vID=(Select gvID from @tablo))<0)
					begin
						Update Villages set uID=(Select uID from Villages where vID=(Select vID from @tablo)),Loyalty=20 where vID=(Select gvID from @tablo)
						Update SaldiriOrdu set uCount=0 where islemID=(select islemID from @tablo) and uID=7						
					end
				end
				ELSE
				begin
					set @mis = 0
					set @misreduce = 0
				end
				
				IF(@AK=100) set @winner=1
				ELSE set @winner=0
				
				Declare @walllevel int,@wkil int,@wodun int,@wdemir int,@isscouted int
				IF((Select uCount from SaldiriOrdu where uID=4 and islemID=(Select islemID from @tablo))-@SKcasus>0)
				begin
					set @walllevel = (Select bLevel from VillageBuildings where bID=11 and vID=(Select gvID from @tablo))
					set @wodun = (Select rCount from VillageResources where rID=1 and vID=(Select gvID from @tablo))
					set @wkil = (Select rCount from VillageResources where rID=2 and vID=(Select gvID from @tablo))
					set @wdemir = (Select rCount from VillageResources where rID=3 and vID=(Select gvID from @tablo))
					set @isscouted = 1
				end
				ELSE
				begin
					set @walllevel = 0
					set @wodun = 0
					set @wkil = 0
					set @wdemir = 0
					set @isscouted = 0
				end
				
				Insert into SaldiriRapor 
					Values((Select vID from @tablo),(Select gvID from @tablo),@gkil,@godun,@gdemir,0,0,0,0,GETDATE(),@winner,@walllevel,@wkil,@wodun,@wdemir,@isscouted,@mis,@misreduce)
				Declare @reportID int
				set @reportID = (Select MAX(reportID) from SaldiriRapor where vID=(Select vID from @tablo) and gvID=(Select gvID from @tablo))
				
				UPDATE RaporOrdu set sCount = (Select uCount from SaldiriOrdu where uID=1 and islemID=(Select islemID from @tablo)),skCount=@SKmizrak,dCount=(Select uCount-ouCount from VillageUnits where uID=1 and vID=(Select gvID from @tablo)),dkCount=@DKmizrak where uID=1 and reportID=@reportID
				UPDATE RaporOrdu set sCount = (Select uCount from SaldiriOrdu where uID=2 and islemID=(Select islemID from @tablo)),skCount=@SKkilic,dCount=(Select uCount-ouCount from VillageUnits where uID=2 and vID=(Select gvID from @tablo)),dkCount=@DKkilic where uID=2 and reportID=@reportID
				UPDATE RaporOrdu set sCount = (Select uCount from SaldiriOrdu where uID=3 and islemID=(Select islemID from @tablo)),skCount=@SKbaltaci,dCount=(Select uCount-ouCount from VillageUnits where uID=3 and vID=(Select gvID from @tablo)),dkCount=@DKbaltaci where uID=3 and reportID=@reportID
				UPDATE RaporOrdu set sCount = (Select uCount from SaldiriOrdu where uID=4 and islemID=(Select islemID from @tablo)),skCount=@SKcasus,dCount=(Select uCount-ouCount from VillageUnits where uID=4 and vID=(Select gvID from @tablo)),dkCount=@DKcasus where uID=4 and reportID=@reportID
				UPDATE RaporOrdu set sCount = (Select uCount from SaldiriOrdu where uID=5 and islemID=(Select islemID from @tablo)),skCount=@SKhafif,dCount=(Select uCount-ouCount from VillageUnits where uID=5 and vID=(Select gvID from @tablo)),dkCount=@DKhafif where uID=5 and reportID=@reportID
				UPDATE RaporOrdu set sCount = (Select uCount from SaldiriOrdu where uID=6 and islemID=(Select islemID from @tablo)),skCount=@SKagir,dCount=(Select uCount-ouCount from VillageUnits where uID=6 and vID=(Select gvID from @tablo)),dkCount=@DKagir where uID=6 and reportID=@reportID
				UPDATE RaporOrdu set sCount = (Select uCount from SaldiriOrdu where uID=7 and islemID=(Select islemID from @tablo)),skCount=@SKmisyoner,dCount=(Select uCount-ouCount from VillageUnits where uID=7 and vID=(Select gvID from @tablo)),dkCount=@DKmisyoner where uID=7 and reportID=@reportID
				
				UPDATE SaldiriOrdu set uCount-=@SKmizrak where uID=1 and islemID=(Select islemID from @tablo)
				UPDATE SaldiriOrdu set uCount-=@SKkilic where uID=2 and islemID=(Select islemID from @tablo)
				UPDATE SaldiriOrdu set uCount-=@SKbaltaci where uID=3 and islemID=(Select islemID from @tablo)
				UPDATE SaldiriOrdu set uCount-=@SKcasus where uID=4 and islemID=(Select islemID from @tablo)
				UPDATE SaldiriOrdu set uCount-=@SKhafif where uID=5 and islemID=(Select islemID from @tablo)
				UPDATE SaldiriOrdu set uCount-=@SKagir where uID=6 and islemID=(Select islemID from @tablo)
				UPDATE SaldiriOrdu set uCount-=@SKmisyoner where uID=7 and islemID=(Select islemID from @tablo)
				
				UPDATE VillageUnits set uCount-=@SKmizrak where uID=1 and vID=(Select vID from @tablo)
				UPDATE VillageUnits set uCount-=@SKkilic where uID=2 and vID=(Select vID from @tablo)
				UPDATE VillageUnits set uCount-=@SKbaltaci where uID=3 and vID=(Select vID from @tablo)
				UPDATE VillageUnits set uCount-=@SKcasus where uID=4 and vID=(Select vID from @tablo)
				UPDATE VillageUnits set uCount-=@SKhafif where uID=5 and vID=(Select vID from @tablo)
				UPDATE VillageUnits set uCount-=@SKagir where uID=6 and vID=(Select vID from @tablo)
				UPDATE VillageUnits set uCount-=@SKmisyoner where uID=7 and vID=(Select vID from @tablo)
				
				UPDATE VillageUnits set uCount-=@DKmizrak where uID=1 and vID=(Select gvID from @tablo)
				UPDATE VillageUnits set uCount-=@DKkilic where uID=2 and vID=(Select gvID from @tablo)
				UPDATE VillageUnits set uCount-=@DKbaltaci where uID=3 and vID=(Select gvID from @tablo)
				UPDATE VillageUnits set uCount-=@DKcasus where uID=4 and vID=(Select gvID from @tablo)
				UPDATE VillageUnits set uCount-=@DKhafif where uID=5 and vID=(Select gvID from @tablo)
				UPDATE VillageUnits set uCount-=@DKagir where uID=6 and vID=(Select gvID from @tablo)
				UPDATE VillageUnits set uCount-=@DKmisyoner where uID=7 and vID=(Select gvID from @tablo)
				
				Update VillageResources set rCount-=@godun where vID=(Select gvID from @tablo) and rID=1
				Update VillageResources set rCount-=@gkil where vID=(Select gvID from @tablo) and rID=2
				Update VillageResources set rCount-=@gdemir where vID=(Select gvID from @tablo) and rID=3
				
				UPDATE SaldiriIslem set issended=1,kil=@gkil,odun=@godun,demir=@gdemir where islemID=(Select islemID from @tablo)
				IF(@AK=100)
				begin
					Delete from SaldiriIslem where islemID = (Select islemID from @tablo)
				end
			end
			ELSE
			begin
				IF(@mtur=1)
				begin
					Update VillageResources set rCount+=(Select odun from @tablo) where vID=(Select vID from @tablo) and rID=1
					Update VillageResources set rCount+=(Select kil from @tablo) where vID=(Select vID from @tablo) and rID=2
					Update VillageResources set rCount+=(Select demir from @tablo) where vID=(Select vID from @tablo) and rID=3
					Delete from SaldiriIslem where islemID = (Select islemID from @tablo)
				end
			end
		end
		Delete from @tablo
		--SONRAKİ--
	INSERT INTO @tablo Select TOP 1 * from (Select tur,islemID,mtur,vID,bID,islem,kil,odun,demir,endtime,gvID,mCount,issended,null as uID,null as sayi from (Select 0 as tur,islemID,null as mtur,vID,bID,islem,kil,odun,demir,endtime,null as gvID,null as mCount,null as issended from BinaIslem 
					UNION 
					Select 1 as tur,s.islemID,s.mtur,s.vID,null as bID,null as islem,s.kil,s.odun,s.demir,s.endtime,s.gvID,s.mCount,s.issended from (Select islemID,0 as mtur,vID,gvID,kil,odun,demir,mCount,gtime as endtime,issended from MarketIslem where issended=0
					UNION
					Select islemID,1 as mtur,vID,gvID,null as kil,null as odun,null as demir,mCount,rtime as endtime,null as issended from MarketIslem) s) ss
					UNION
					Select 2 as tur,islemID,null as mtur,vID,null as bID,null as islem,kil,odun,demir,sdate as endtime,null as gvID,null as mCount,null as issended,uID,sayi from AskerIslem
					UNION
					Select 3 as tur,ss.islemID,ss.stur as mtur,ss.vID,null as bID,null as islem,ss.kil,ss.odun,ss.demir,ss.endtime,ss.gvID,null as mCount,ss.issended,null as uID,null as sayi from (Select 0 as stur,islemID,vID,gvID,gtime as endtime,kil,odun,demir,issended from SaldiriIslem where issended=0	
					UNION
					Select 1 as stur,islemID,vID,gvID,rtime as endtime,kil,odun,demir,issended from SaldiriIslem) ss) sss where sss.endtime <GETDATE() order by endtime asc	

	end
END
