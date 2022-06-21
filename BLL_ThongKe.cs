using PBL3_TeamSuperGao.DAL;
using PBL3_TeamSuperGao.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PBL3_TeamSuperGao.BLL
{
    class BLL_ThongKe
    {
        private static BLL_ThongKe _Instance;
        public static BLL_ThongKe Instance
        {
            get
            {
                if(_Instance == null)
                {
                    _Instance = new BLL_ThongKe();
                }
                return _Instance;
            }
            private set
            {

            }
        }
        public List<HoaDonView> ThongKeHoaDon(DateTime org, DateTime des)
        {
            List<HoaDonView> ListThongKeHoaDon = new List<HoaDonView>();
            foreach(var i in DAL_ThongKe.Instance.DAL_GetListHoaDon(org, des))
            {
                ListThongKeHoaDon.Add(new HoaDonView
                {
                    IDHoaDon = i.IDHoaDon,
                    NgayThanhToan = DAL_ThongKe.Instance.Getdate(i.IDHoaDon),
                    GiamGia = i.GiamGia.ToString() + " %",
                    TongTien = (double)i.TongTien
                });
            }
            ListThongKeHoaDon.Sort();
            return ListThongKeHoaDon;
        }
        public List<DoanhThuView> BLL_ThongKeDoanhThu(DateTime org,DateTime des)
        {
            List<DoanhThuView> ListDTV = new List<DoanhThuView>();
            for(DateTime step = org;step <= des; step = step.AddDays(1))
            {
                double ToTal = 0;
                foreach(int i in DAL_ThongKe.Instance.DAL_GetIdbyDate(step, step))
                {
                    ToTal += DAL_ThongKe.Instance.DAL_GetTongTienHoaDon(i);
                }
                ListDTV.Add(new DoanhThuView
                {
                    Ngay = step.Date,
                    TongTien = ToTal
                });
            }
            return ListDTV;
        }
        public List<MonView> BLL_ThongKeMon(DateTime org,DateTime des)
        {
            List<MonView> ListMV = new List<MonView>();
            foreach(var i in DAL_ThongKe.Instance.GetAllMon())
            {
                int TongLG = 0;
                foreach(var j in DAL_ThongKe.Instance.GetChiTietHoaDons(org,des))
                {
                    if (j.IDMon == i.IDMon) TongLG += (int)j.SoLuong;
                }
                ListMV.Add(new MonView
                {
                    IDMon = i.IDMon,
                    TenMon = i.TenMon,
                    DonGia = (double)i.DonGia,
                    LuotGoi = TongLG
                });
            }
            ListMV.Sort();
            return ListMV;
        } 
    }
}
