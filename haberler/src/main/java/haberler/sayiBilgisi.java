package haberler;


public class sayiBilgisi {
//kategori 	
	private String KtgAdi;
	private int KategoriID;
	
	public int getKategoriID() {
		return KategoriID;
	}
	
	public String getKtgAdi() {
		return KtgAdi;
	}
	public void setKtgAdi(String KtgAdi) {
		this.KtgAdi = KtgAdi;
	}
//yazar	
	private String AdSoyad;
	private String Telefon;
	private String Mail;
	private int KtgId;
	
	public String getAdSoyad() {
		return AdSoyad;
	}
	public void setAdSoyad(String AdSoyad) {
		this.AdSoyad = AdSoyad;
	}
	public String getTelefon() {
		return Telefon;
	}
	public void setTelefon(String Telefon) {
		this.Telefon = Telefon;
	}
	public String getMail() {
		return Mail;
	}
	public void setMail(String Mail) {
		this.Mail = Mail;
	}
	public int getKtgId() {
		return KtgId;
	}
	public void setKtgId(int KtgId) {
		this.KtgId = KtgId;
	}
//haber	
	private String Baslik;
	private String Ozet;
	private String Icerik;
	private String YayimTrh; 
	private int YzrId;
	private String Resimyol;
	
	public String getBaslik() {
		return Baslik;
	}
	public void setBaslik(String Baslik) {
		this.Baslik = Baslik;
	}
	public String getOzet() {
		return Ozet;
	}
	public void setOzet(String Ozet) {
		this.Ozet = Ozet;
	}
	public String getIcerik() {
		return Icerik;
	}
	public void setIcerik(String Icerik) {
		this.Icerik = Icerik;
	}
	public String getYayimTrh() {
		return YayimTrh;
	}
	public void setYayimTrh(String YayimTrh) {
		this.YayimTrh = YayimTrh;
	}
	public int getYzrId() {
		return YzrId;
	}
	public void setYzrId(int YzrId) {
		this.YzrId = YzrId;
	}
	public String getResimyol() {
		return Resimyol;
	}
	public void setResimyol(String Resimyol) {
		this.Resimyol = Resimyol;
	}
//kullanici	
	private String KullaniciAdi;
	private String Sifre;
	private String SonGiris;
	private String KullaniciMail;
	
	public String getKullaniciAdi() {
		return KullaniciAdi;
	}
	public void setKullaniciAdi(String KullaniciAdi) {
		this.KullaniciAdi = KullaniciAdi;
	}
	
	public String getSifre() {
		return Sifre;
	}
	public void setSifre(String Sifre) {
		this.Sifre = Sifre;
	}
	public String getSonGiris() {
		return SonGiris;
	}
	public void setSonGiris(String SonGiris) {
		this.SonGiris = SonGiris;
	}
	
	public String getKullaniciMail() {
		return KullaniciMail;
	}
	public void setKullaniciMail(String KullaniciMail) {
		this.KullaniciMail = KullaniciMail;
	}
//uye	
	private String UyeKullaniciAdi;
	private String UyeSifre;
	private String UyeMail;
	
	
	public String getUyeKullaniciAdi() {
		return UyeKullaniciAdi;
	}
	public void setUyeKullaniciAdi(String UyeKullaniciAdi) {
		this.UyeKullaniciAdi = UyeKullaniciAdi;
	}
	public String getUyeSifre() {
		return  UyeSifre;
	}
	public void setUyeSifre(String  UyeSifre) {
		this. UyeSifre =  UyeSifre;
	}
	public String getUyeMail() {
		return  UyeMail;
	}
	public void setUyeMail(String  UyeMail) {
		this. UyeMail =  UyeMail;
	}
//yorum
	private String UyeAdSoyad;
	private String Tarih;
	private String YorumIcerik;
	private String Onay;
	private int UyeId;
	private int HaberID;
	
	public String getUyeAdSoyad() {
		return  UyeAdSoyad;
	}
	public void setUyeAdSoyad(String  UyeAdSoyad) {
		this. UyeAdSoyad =  UyeAdSoyad;
	}
	public String getTarih() {
		return  Tarih;
	}
	public void setTarih(String  Tarih) {
		this. Tarih =  Tarih;
	}
	public String getYorumIcerik() {
		return  YorumIcerik;
	}
	public void setYorumIcerik(String  YorumIcerik) {
		this. YorumIcerik =  YorumIcerik;
	}
	public String getOnay() {
		return  Onay;
	}
	public void setOnay(String  Onay) {
		this. Onay =  Onay;
	}
	public int getUyeId() {
		return  UyeId;
	}
	public void setUyeId(int  UyeId) {
		this. UyeId =  UyeId;
	}
	public int getHaberID() {
		return  HaberID;
	}
	public void setHaberID(int  HaberID) {
		this. HaberID =  HaberID;
	}
}
