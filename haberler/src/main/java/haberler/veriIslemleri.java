package haberler;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import haberler.sayiBilgisi;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.xdevapi.Collection;
public class veriIslemleri {

	private Connection con;
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://127.0.0.1:3306/habersitesi_db?characterEncoding=ISO-8859-9"; //useUnicode=true&characterEncoding=UTF-8
	private Statement stm;
	private ResultSet resultSet = null;
	private String KtgAdi;
    private String AdSoyad;
    private String Telefon;
    private String Mail;
    private int KtgId;
    private String Baslik;
    private String Ozet;
    private String Icerik;
    private String YayimTrh;
    private int YzrId;
    private String Resimyol;
    private String UyeKullaniciAdi;
    private String UyeSifre;
    private String UyeMail;
    private String UyeAdSoyad;
	private String Tarih;
	private String YorumIcerik;
	private String Onay;
	private int UyeId;
	private int HaberID;
   

public veriIslemleri()
{
	try { 
		Class.forName(driver); 
	   System.out.println("JDBC surucu basari ile yüklendi.");
	}
	catch (Exception e) 
	{ 
		System.out.println("JDBC surucu Yüklenemedi. Hata:"+e.getMessage()); System.exit(0); 
	}
	try{
		con=DriverManager.getConnection(url,"root","123456");System.out.println("Veritabanýna baðlanýldý.");
		}
	catch (Exception e) { 
		System.out.println("Veri Tabanýna Baðlanýlamadý. Hata:"+e.getMessage()); System.exit(0);
		}
	try {
		stm=con.createStatement();
		}
	catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); System.exit(0); 
	
		}
}

//***********KATEGORI ISLEMLERI
public boolean ekle(sayiBilgisi kategori)
{
	KtgAdi=kategori.getKtgAdi();
	
	try
	{
		String query = "INSERT INTO kategori(KtgAdi) values('"+KtgAdi+"')"; 
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
	
}
public ResultSet selectData(int id)
{	
	resultSet=null;
	try
	{
		String query = "SELECT * FROM kategori where KategoriID="+id;
		resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
	
}
public ResultSet selectAllData()
{	
	resultSet=null;
	try
	{
		String query = "SELECT * FROM kategori";
		resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
}
public boolean deleteData(int id)
{
	try
	{
		String query = "DELETE FROM kategori WHERE KategoriID="+id+"";
		stm.executeUpdate(query);
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}
public ResultSet kategoriaraselectData()
{	
	resultSet=null;
	try
	{
		String query = "select KategoriID,KtgAdi from kategori";
		resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
}
public boolean updateData(sayiBilgisi kategori,int id)
{
	String KtgAdi=kategori.getKtgAdi();
	try
	{
		String query = "UPDATE kategori SET KtgAdi='"+KtgAdi+"' WHERE KategoriID='"+id+"'";
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}
//*********YAZAR ISLEMLERI
public boolean yazarekle(sayiBilgisi yazar)
{
	AdSoyad=yazar.getAdSoyad();
	Telefon=yazar.getTelefon();
	Mail=yazar.getMail();
	KtgId=yazar.getKtgId();
	
	try
	{
		String query = "INSERT INTO yazar(AdSoyad,Telefon,Mail,KtgId) values('"+AdSoyad+"','"+Telefon+"','"+Mail+"','"+KtgId+"')"; 
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
	
}

public ResultSet yazarselectData(int YzrID)
{	
	resultSet=null;
	try
	{
		String query = "SELECT * FROM yazar where YzrID="+YzrID;
		resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
	
}
public ResultSet yazarselectAllData()
{	
	resultSet=null;
	try
	{
		String query = "SELECT yazar.YzrID,yazar.AdSoyad, yazar.Telefon, yazar.Mail, kategori.KtgAdi FROM yazar INNER JOIN kategori ON yazar.KtgId=kategori.KategoriID";
				resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
}
public boolean yazardeleteData(int id)
{
	try
	{
		String query = "DELETE FROM yazar WHERE YzrID="+id+"";
		stm.executeUpdate(query);
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}
public boolean yazarupdateData(sayiBilgisi yazar,int id)
{
	String AdSoyad=yazar.getAdSoyad();
	String Telefon=yazar.getTelefon();
	String Mail=yazar.getMail();
	int KtgId=yazar.getKtgId();
	try
	{
		String query = "UPDATE yazar SET AdSoyad='"+AdSoyad+"',Telefon='"+Telefon+"',Mail='"+Mail+"',KtgId='"+KtgId+"' WHERE YzrID='"+id+"'";
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}

//**********HABER ISLEMLERI
public boolean haberekle(sayiBilgisi haber)
{
	Baslik=haber.getBaslik();
	Ozet=haber.getOzet();
	Icerik=haber.getIcerik();
	YayimTrh=haber.getYayimTrh();
	YzrId=haber.getYzrId();
	KtgId=haber.getKtgId();
	Resimyol=haber.getResimyol();
	try
	{
		String query = "INSERT INTO haber(Baslik,Ozet,Icerik,YayimTrh,YzrId,KtgId,Resimyol) values ('"+Baslik+"','"+Ozet+"','"+Icerik+"','"+YayimTrh+"','"+YzrId+"','"+KtgId+"','"+Resimyol+"')"; 
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
	
}
public ResultSet haberselectData(int HbrID)
{	
	resultSet=null;
	try
	{
		String query = "SELECT * FROM haber where HbrID="+HbrID;
		resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
}
public ResultSet haberselectAllData()
{	
	resultSet=null;
	try
	{
		String query ="SELECT haber.HbrID, haber.Baslik, haber.Ozet, haber.Icerik, haber.YayimTrh, yazar.Adsoyad, kategori.KtgAdi, haber.Resimyol FROM haber INNER JOIN yazar ON haber.YzrID=yazar.YzrID INNER JOIN kategori ON haber.KtgId=kategori.KategoriID";
		//	String query="SELECT * FROM haber"	;
		resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
}

public boolean haberdeleteData(int id)
{
	try
	{
		String query = "DELETE FROM haber WHERE HbrID="+id+"";
		stm.executeUpdate(query);
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}
public boolean haberupdateData(sayiBilgisi haber,int id)
{
	String Baslik=haber.getBaslik();
	String Ozet=haber.getOzet();
	String Icerik=haber.getIcerik();
	String YayimTrh=haber.getYayimTrh();
	int YzrId=haber.getYzrId();
	int KtgId=haber.getKtgId();
	String Resimyol=haber.getResimyol();
	try
	{
		String query = "UPDATE haber SET Baslik='"+Baslik+"',Ozet='"+Ozet+"',Icerik='"+Icerik+"',YayimTrh='"+YayimTrh+"',YzrId='"+YzrId+"',KtgId='"+KtgId+"',Resimyol='"+Resimyol+"'  WHERE HbrID='"+id+"'";
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}
public ResultSet kategoriyegoreaberselectAllData()
{	
	resultSet=null;
	try
	{
		String query = "SELECT haber.HbrID,haber.Baslik, haber.Ozet, haber.Icerik, haber.YayimTrh, haber.Resimyol,haber.KtgId, kategori.KtgAdi FROM haber INNER JOIN kategori ON haber.KtgId=kategori.KategoriID";
				resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
}

//*********KULLANICI ISLEMLERI

public ResultSet kullaniciSifreselectData(int id)//belirli sureden sonra sifreyi guncellemek için ekrana bilgi getiren 
{	
	resultSet=null;
	try
	{
		String query = "select KullaniciAdi,Sifre from kullanici  WHERE KullaniciID='"+id+"'";
		resultSet=stm.executeQuery(query);
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
}
public ResultSet kullaniciupdateselectData(int id)//tum bilgiler güncelelnirken ekrana getirme
{	
	resultSet=null;
	try
	{
		String query = "select KullaniciAdi,KullaniciMail,Sifre from kullanici  WHERE KullaniciID='"+id+"'";
		resultSet=stm.executeQuery(query);
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
}
public ResultSet kullaniciselectData()//giris yaparken kullanýcýlarý almak için
{	
	resultSet=null;
	try
	{
		String query = "select KullaniciID,KullaniciAdi,KullaniciMail,Sifre from kullanici";
		resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
}
public boolean kullaniciupdateData(sayiBilgisi kullanici,int id)//sadece sifre update 
{
	String Sifre=kullanici.getSifre();
	try
	{
		String query = "UPDATE kullanici SET Sifre='"+Sifre+"' WHERE KullaniciID='"+id+"'";
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}
public boolean kullaniciupdateDataIslem(sayiBilgisi kullanici,int id)
{
	String Sifre=kullanici.getSifre();
	String KullaniciAdi=kullanici.getKullaniciAdi();
	String KullaniciMail=kullanici.getKullaniciMail();
	try
	{
		String query = "UPDATE kullanici SET Sifre='"+Sifre+"',KullaniciAdi='"+KullaniciAdi+"',KullaniciMail='"+KullaniciMail+"' WHERE KullaniciID='"+id+"'";
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}
//*********UYE ISLEMLERI

public boolean uyeekle(sayiBilgisi uye)
{
	UyeKullaniciAdi=uye.getUyeKullaniciAdi();
	UyeSifre=uye.getUyeSifre();
	UyeMail=uye.getUyeMail();
	try
	{
		String query = "INSERT INTO uyeler(UyeKullaniciAdi,UyeSifre,UyeMail) values('"+UyeKullaniciAdi+"','"+UyeSifre+"','"+UyeMail+"')"; 
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
	
}
public ResultSet uyeselectAllData()
{	
	resultSet=null;
	try
	{
		String query = "SELECT * FROM uyeler";
		resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
}
public ResultSet uyeSifreselectData(int id)
{	
	resultSet=null;
	try
	{
		String query = "select UyeKullaniciAdi,UyeSifre from uyeler  WHERE UyeID='"+id+"'";
		resultSet=stm.executeQuery(query);
		

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
}
public boolean uyeupdateData(sayiBilgisi uye,int id)
{
	String UyeSifre=uye.getUyeSifre();
	try
	{
		String query = "UPDATE uyeler SET UyeSifre='"+UyeSifre+"' WHERE UyeID='"+id+"'";
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}
public boolean uyesifreupdateData(sayiBilgisi uye,String UyeMail)
{
	String UyeSifre=uye.getUyeSifre();
	try
	{
		String query = "UPDATE uyeler SET UyeSifre='"+UyeSifre+"' WHERE UyeMail='"+UyeMail+"'";
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}
//YORUM ISLEMLERI
public ResultSet yorumselectAllData()
{	
	resultSet=null;
	try
	{
		String query ="SELECT yorum.YrmID, yorum.UyeAdSoyad, yorum.YorumIcerik, yorum.Tarih, yorum.Onay, uyeler.UyeMail, haber.Baslik FROM yorum INNER JOIN uyeler ON yorum.UyeId=uyeler.UyeID INNER JOIN haber ON yorum.HaberID=haber.HbrID";
		resultSet=stm.executeQuery(query);

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
	
}
public boolean yorumekle(sayiBilgisi yorum)
{
	HaberID=yorum.getHaberID();
	UyeAdSoyad=yorum.getUyeAdSoyad();
	UyeMail=yorum.getUyeMail();
	Tarih=yorum.getTarih();
	YorumIcerik=yorum.getYorumIcerik();
	Onay=yorum.getOnay();
	UyeId=yorum.getUyeId();
	try
	{
		String query = "INSERT INTO yorum(HaberID,UyeAdSoyad,UyeMail,Tarih,YorumIcerik,Onay,UyeId) values ('"+HaberID+"','"+UyeAdSoyad+"','"+UyeMail+"','"+Tarih+"','"+YorumIcerik+"','"+Onay+"','"+UyeId+"')"; 
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
	
}
public boolean yorumupdateData(sayiBilgisi uye,int id)
{
	String Onay=uye.getOnay();
	try
	{
		String query = "UPDATE yorum SET Onay='"+Onay+"' WHERE YrmID='"+id+"'";
		stm.executeUpdate(query); 
		return true;
	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	
}
public ResultSet yorumselectData(int id)
{	
	resultSet=null;
	try
	{
		String query = "select Onay from yorum  WHERE YrmID='"+id+"'";
		resultSet=stm.executeQuery(query);
		

	}
	catch (Exception e) { System.out.println("Hata:"+e.getMessage());
		
	}
	return resultSet;
}
}