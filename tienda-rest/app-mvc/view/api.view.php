<?php

class ApiView {

    public function response($data, $status = 200) {
        header("Content-Type: application/json");
        header("HTTP/1.1 " . $status . " " . $this->_requestStatus($status));
        
        // convierte los datos a un formato json
        echo json_encode($data);
    }

    private function _requestStatus($code){
        $status = array(
          200 => "200 - OK",
          201 => "201 - Created",
          400 => "400 - Bad request",
          401 => "401 - Unauthorized",
          404 => "404 - Not found",
          500 => "500 - Internal Server Error",
          501 => "501 - Not Implemented",
        );
        return (isset($status[$code])) ? $status[$code] : $status[500];
      }
}