<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        // Conectar a la base de datos usando la configuración por defecto
        $db = \Config\Database::connect();

        try {
            // Consulta para obtener datos de la tabla "estudiantes"
            $queryestudiantes = $db->query('SELECT * FROM estudiantes');
            $estudiantes = $queryestudiantes->getResult();

            // Consulta para obtener datos de la tabla "cursos"
            $querycursos = $db->query('SELECT * FROM cursos  ');
            $cursos = $querycursos->getResult();

            // Crear un arreglo con los datos ficticios
            $valor = [
                'estudiantes' => $estudiantes,
                'cursos' => $cursos
            ];

            // Devolver los datos como respuesta JSON
            return $this->response->setJSON($valor);

        } catch (\Exception $e) {
            // Manejar errores de la base de datos
            return $this->response->setJSON(['error' => $e->getMessage()]);
        }
    }
}