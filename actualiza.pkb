DROP TABLE TEMP1O;
CREATE TABLE TEMP1O (idped number(4), idart number(4));

CREATE OR REPLACE PACKACE ACTUALIZA AS
procedure NuevoPedido (p_idped in pedidos. idped%type,
	p_artid in articulos idarti%type,
	p_cantidad in detalle cantidad%type,
	p_codelcli in clientes. codclis%type) ;

procedure baja_pedido(p_codcli in clientes codclittype) ;
type t_pedidos is table of pedidos.idped%type index by BINARY INTEGER;

	procedure listar(p_codcli in clientes.codcli%type, p_tbpedidos out t_pedidos);
END ACTUALIZA;
/

CREATE OR REPLACE PACKACE BODY ACTUALIZA AS
	procedure MuevoPedido (p_codcli in clientes.codcli%type,
				p_idped in pedidos.idped%type,
				p_idart in articulos.idart%type,
				p_cantidad in detalle.cantidad%type) AS
BEGIN
	INSERT INTO PEDIDOS VALUES(P_IDPED, P_CODCLI, SYSDATE, SYSDATE);
	INSERT INTO DETALLE VALUES(P_IDPED, P_IDART, P CANTIDAD);
	UPDATE ARTICULOS SET STOCK = STOCK - Y CANTIDAD WIERE IDART = D_IDART;
END NuevoPedido;

PROCEDURE baja pedido(p_codcli in clientes codcli%type) AS
BEGIN
	delete from detalle where idped in (Select idped from pedidos where codcli=p_codcli) ;
	delete from pedidos where codcli = p_codcli;
END baja_pedido;

Procedure listar(p_codcli in clientes codcli%type, p_tbpedidos cut t_pedidos) AS
	p_indice binary_integer;
CURSOR c table IS select idart.idped from detalle
	where idped in (select idped from pedidos where codcli = p_codcli);
	v_registro c_table%ROWTYPE;

BEGIN
	p_indice :=();
	open c_tabla;
	LOOP
		FETCH c_tabla INTO v_registro;
		EXIT when c_tabla%notfound;
		p_indice := pindice+1;
		p_tbpedidos(p_indice):=v_registro.idped;
		insert into temp values(v_registro.idped, v_registro.idart);
	END LOOP;
	close c_tabla;
END listar;
END ACTUALIZA;
/
		

