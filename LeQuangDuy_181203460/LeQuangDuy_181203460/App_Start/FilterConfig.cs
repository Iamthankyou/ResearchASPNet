using System.Web;
using System.Web.Mvc;

namespace LeQuangDuy_181203460
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
