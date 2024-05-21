using System;
using System.Collections.Generic;

namespace QuanLySinhVien_CuoiKi.Models;

public partial class LopHocPhan
{
    public string MaSv { get; set; } = null!;

    public string MaHocPhan { get; set; } = null!;

    public int? Diem { get; set; }

    public virtual HocPhan? MaHocPhanNavigation { get; set; } = null!;

    public virtual SinhVien? MaSvNavigation { get; set; } = null!;
}
