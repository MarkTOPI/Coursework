//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Theatre
{
    using System;
    using System.Collections.Generic;
    
    public partial class TicketsSale
    {
        public int ID { get; set; }
        public int Play { get; set; }
        public System.DateTime PlayDate { get; set; }
        public System.TimeSpan PlayTime { get; set; }
        public System.DateTime DateOfPurchase { get; set; }
        public int TicketsBought { get; set; }
    
        public virtual Play Play1 { get; set; }
    }
}
