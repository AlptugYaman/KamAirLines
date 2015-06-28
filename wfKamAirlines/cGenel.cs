using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wfKamAirlines
{
    class cGenel
    {
        public static string musteriID;
        public static string musteri;
        public static string ucusID;
        public static string ucusNereden;
        public static string ucusNereye;
        public static string ktarih;
        public static string vtarih;
        public static string fiyat;
        public static string kontenjan;

        public string connStr = "Data Source = ASUS-Bilgisayar\\Besiktas; Initial Catalog=KamAirLines; Integrated Security=True"; 
        //public string connStr = "Data Source = ASUS-Bilgisayar\\Besiktas; Initial Catalog=KamAirLines; uid=sa; pwd=12345";
        //public string connStr = "Data Source = KEREMSENTURK\\GALATASARAY; Initial Catalog=KamAirLines; uid=sa; pwd=12345";
        //public string connStr = "Data Source = WISSEN315; Initial Catalog=KamAirLines; uid=sa; pwd=12345";
    }
}
