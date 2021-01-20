namespace HelloASP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Student_Course
    {
        [Key]
        [StringLength(20)]
        public string StudentCourseId { get; set; }

        [StringLength(20)]
        public string CourseId { get; set; }

        [StringLength(20)]
        public string StudentId { get; set; }

        public virtual Course Course { get; set; }

        public virtual Student Student { get; set; }
    }
}
