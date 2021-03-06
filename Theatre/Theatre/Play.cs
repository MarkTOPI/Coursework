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
    
    public partial class Play
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Play()
        {
            this.Repertoirs = new HashSet<Repertoir>();
            this.TicketsSales = new HashSet<TicketsSale>();
            this.Workers = new HashSet<Worker>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public string Author { get; set; }
        public string PlayType { get; set; }
        public int Duration { get; set; }
        public int AmountOfActs { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Repertoir> Repertoirs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TicketsSale> TicketsSales { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Worker> Workers { get; set; }
    }
}
