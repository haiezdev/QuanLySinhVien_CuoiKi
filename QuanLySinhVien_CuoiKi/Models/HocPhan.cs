using System;
using System.Collections.Generic;

namespace QuanLySinhVien_CuoiKi.Models;

public partial class HocPhan
{
    public string MaHocPhan { get; set; } = null!;

    public string? TenHocPhan { get; set; }

    public int? SoTinChi { get; set; }

    public string? MaGv { get; set; }

    public string? MaKhoa { get; set; }

    public virtual ICollection<LopHocPhan> LopHocPhans { get; set; } = new List<LopHocPhan>();

    public virtual GiaoVien? MaGvNavigation { get; set; }

    public virtual Khoa? MaKhoaNavigation { get; set; }
}
