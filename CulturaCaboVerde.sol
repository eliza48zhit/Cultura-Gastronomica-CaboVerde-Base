// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaCaboVerde
 * @dev Registro de procesos de expansion de almidon y coccion lenta insular.
 * Serie: Sabores de Africa (52/55)
 */
contract CulturaCaboVerde {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 integridadGrano;      // Resistencia a la sobrecoccion (1-100)
        uint256 tiempoHidratacion;    // Horas de coccion lenta (1-24)
        bool usaPescadoSeco;          // Conservacion tradicional
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con la Cachupa (Ingenieria del Grano de Maiz)
        registrarPlato(
            "Cachupa Rica", 
            "Maiz, frijoles, pescado o carne, mandioca, batata.",
            "Expansion lenta de granos de maiz y legumbres en caldo para lograr una textura tierna pero firme.",
            95, 
            6, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _integridad, 
        uint256 _tiempo,
        bool _pescado
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            integridadGrano: _integridad,
            tiempoHidratacion: _tiempo,
            usaPescadoSeco: _pescado,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
