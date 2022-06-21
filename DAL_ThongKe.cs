using PBL3_TeamSuperGao.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PBL3_TeamSuperGao.DAL
{
    class DAL_ThongKe
    {
        private static DAL_ThongKe _Instance;
        public static DAL_ThongKe Instance
        {
            get
            {
                if(_Instance == null)
                {
                    _Instance = new DAL_ThongKe();
                }
                return _Instance;
            }
            private set
            {

            }
        }
        // DAL chuc nang thong ke hoa don tra ve list cac hoa don
        public List<HoaDon> DAL_GetListHoaDon(DateTime org, DateTime des)
        {
            List<HoaDon> ListHoaDon = new List<HoaDon>();
            DTDoAn db = new DTDoAn();

            foreach(int i in DAL_GetIdbyDate(org, des))
            {
                ListHoaDon.Add(db.HoaDons.Find(i));
            }
            return ListHoaDon;
        }
        public double DAL_GetTongTienHoaDon(int ID)
        {
            DTDoAn db = new DTDoAn();
            HoaDon hd = db.HoaDons.Find(ID);
            return (double)hd.TongTien;
        }
        // get date by ID Hoa Don
        public DateTime Getdate(int Idbill)
        {
            DateTime dateTemp = new DateTime();
            DTDoAn db = new DTDoAn();
            var getdate = (from tbChiTietHD in db.ChiTietHoaDons
                           where tbChiTietHD.IDHoaDon == Idbill
                           select new
                           {
                               tbChiTietHD.NgayThanhToan
                           }).Take(1);
            foreach (var i in getdate)
            {
                dateTemp = (DateTime)i.NgayThanhToan;
            }
            return dateTemp;
        }
        // Phuong thuc tra ve danh sach cac id tu ngay org den ngay des
        public List<int> DAL_GetIdbyDate(DateTime org,DateTime des)
        {
            DTDoAn db = new DTDoAn();
            List<int> listId = new List<int>();
            var ListHoaDonView = from tbHoaDon in db.HoaDons
                                 join tbChiTietHD in db.ChiTietHoaDons on tbHoaDon.IDHoaDon equals tbChiTietHD.IDHoaDon
                                 where tbChiTietHD.NgayThanhToan >= org.Date
                                 where tbChiTietHD.NgayThanhToan <= des.Date
                                 group tbChiTietHD by tbChiTietHD.IDHoaDon into g
                                 select new
                                 {
                                     g.Key
                                 };
            foreach (var i in ListHoaDonView)
            {
                listId.Add(i.Key);
            }
            return listId;
        }
        public List<Mon> GetAllMon()
        {
            DTDoAn db = new DTDoAn();
            var ListMon = db.Mons;
            return ListMon.ToList();
        }
        public List<ChiTietHoaDon> GetChiTietHoaDons(DateTime org, DateTime des)
        {
            DTDoAn db = new DTDoAn();
            var ListCTHD = from tbChiTietHD in db.ChiTietHoaDons
                           where tbChiTietHD.NgayThanhToan >= org.Date
                           where tbChiTietHD.NgayThanhToan <= des.Date
                           select tbChiTietHD;
            return ListCTHD.ToList();
        }
    }
}
