using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BEUAsistencia;
using BEUAsistencia.Transaction;

namespace ControlAsistencias.Controllers
{
    public class AsistenciasController : Controller
    {
        Asistencia asistencia = new Asistencia();
        // GET: Asistencias

        //GET: Empleado
        [HttpGet]
        public ActionResult Search(string Busqueda)
        {
            Entities db = new Entities();
            
            var empleado = from e in db.Empleado select e;
            
            if (!string.IsNullOrEmpty(Busqueda))
            {
                empleado = empleado.Where(se => se.cedula.EndsWith(Busqueda));
                Empleado[] empleado1 = empleado.ToArray();
                var entrada = from a in db.Asistencia select a.fecha_ingreso;
            
                var salida = from a in db.Asistencia select a.fecha_salida;
          

                if (entrada.Equals(DateTime.Today))
                {
                    asistencia.id_emp = empleado1[0].id_emp;
                    asistencia.fecha_salida = DateTime.Today;
                    if (ModelState.IsValid)
                    {
                        db.Asistencia.Add(asistencia);
                        db.SaveChanges();
                    }
                }
                else {
                    asistencia.id_emp = empleado1[0].id_emp;
                    asistencia.fecha_ingreso = DateTime.Today;
                    if (ModelState.IsValid)
                    {
                        db.Asistencia.Attach(asistencia);
                        db.SaveChanges();
                    }
                }


            }
            return View(empleado.ToList());
        }
        public ActionResult Index()
        {
            return View(AsistenciaBLL.List());
        }

        // GET: Asistencias/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Asistencia asistencia = AsistenciaBLL.Get(id);
            if (asistencia == null)
            {
                return HttpNotFound();
            }
            return View(asistencia);
        }

        // GET: Asistencias/Create
        public ActionResult Create()
        {
            ViewBag.id_emp = new SelectList(EmpleadoBLL.List(), "id_emp", "nombre_completo");
            return View();
        }

        // POST: Asistencias/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id_asis,fecha_ingreso,fecha_salida,id_emp")] Asistencia asistencia)
        {
            if (ModelState.IsValid)
            {
                AsistenciaBLL.Create(asistencia);
                return RedirectToAction("Index");
            }

            ViewBag.id_emp = new SelectList(EmpleadoBLL.List(), "id_emp", "nombre_completo", asistencia.id_emp);
            return View(asistencia);
        }

        // GET: Asistencias/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Asistencia asistencia = AsistenciaBLL.Get(id);
            if (asistencia == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_emp = new SelectList(EmpleadoBLL.List(), "id_emp", "nombre_completo", asistencia.id_emp);
            return View(asistencia);
        }

        // POST: Asistencias/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id_asis,fecha_ingreso,fecha_salida,id_emp")] Asistencia asistencia)
        {
            if (ModelState.IsValid)
            {
                AsistenciaBLL.Update(asistencia);
                return RedirectToAction("Index");
            }
            ViewBag.id_emp = new SelectList(EmpleadoBLL.List(), "id_emp", "nombre_completo", asistencia.id_emp);
            return View(asistencia);
        }

        // GET: Asistencias/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Asistencia asistencia = AsistenciaBLL.Get(id);
            if (asistencia == null)
            {
                return HttpNotFound();
            }
            return View(asistencia);
        }

        // POST: Asistencias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AsistenciaBLL.Delete(id);
            return RedirectToAction("Index");
        }

        
    }
}
