using System;
using System.Collections.Generic;

namespace QuanLySinhVien_CuoiKi.Models;

public partial class Khoa
{
    public string MaKhoa { get; set; } = null!;

    public string? TenKhoa { get; set; }

    public string? MaTruong { get; set; }

    public virtual ICollection<GiaoVien> GiaoViens { get; set; } = new List<GiaoVien>();

    public virtual ICollection<HocPhan> HocPhans { get; set; } = new List<HocPhan>();

    public virtual ICollection<LopSinhHoat> LopSinhHoats { get; set; } = new List<LopSinhHoat>();

    public virtual Truong? MaTruongNavigation { get; set; }
}
