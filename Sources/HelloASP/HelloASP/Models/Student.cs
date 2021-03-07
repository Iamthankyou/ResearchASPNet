namespace HelloASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Student")]
    public partial class Student
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Student()
        {
            Student_Course = new HashSet<Student_Course>();
        }

        [StringLength(20)]
        [Display(Name = "Student ID")]
        public string StudentId { get; set; }

        [Required(ErrorMessage = "Please enter firstname")]
        [StringLength(50)]
        [Display(Name = "First Name")]
        public string FisrtName { get; set; }

        [Display(Name = "Last Name")]
        [StringLength(50)]
        public string LastName { get; set; }

        //[RegularExpression(@"^(((0)[0-9])|((1)[0-2]))(\/)([0-2][0-9]|(3)[0-1])(\/)\d{4}$", ErrorMessage = "Not type datetime")]
        [DataType(DataType.DateTime, ErrorMessage = "Please enter a valid date in the format")]
        public DateTime? Grade { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Student_Course> Student_Course { get; set; }
    }
}
