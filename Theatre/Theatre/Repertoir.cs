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
    
    public partial class Repertoir
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Repertoir()
        {
            this.RolesOfActorsOfRepertoirs = new HashSet<RolesOfActorsOfRepertoir>();
        }
    
        public int ID { get; set; }
        public int Play { get; set; }
        public System.DateTime DateOfPerformance { get; set; }
        public System.TimeSpan TimeOfPerformance { get; set; }
        public int TicketsSold { get; set; }
    
        public virtual Play Play1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RolesOfActorsOfRepertoir> RolesOfActorsOfRepertoirs { get; set; }
    }
}
