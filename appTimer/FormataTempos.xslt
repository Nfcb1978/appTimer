<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>





	<!-- Parâmetros para controlar a página atual e o número de itens por página -->
	<xsl:param name="page" select="1" />
	<xsl:param name="itemsPerPage" select="5" />

	<!-- Calcula o início e o fim da página -->
	<xsl:variable name="start" select="($page - 1) * $itemsPerPage + 1" />
	<xsl:variable name="end" select="$page * $itemsPerPage" />


	<xsl:template match="/NewDataSet">
		<div class="container mt-5">
			<div class="text-justify">
				<table class="table">
					<thead class="bg-primary">
						<tr >
							<td>
								<h5 style="color: white;">
									<b>Data e Hora</b>
								</h5>
							</td>
							<td>
								<h5 style="color: white;">
									<b>Minutos Trabalhados</b>
								</h5>
							</td>
							

						</tr>
					</thead>
					<!-- Exibe apenas os itens que estão na página atual -->
					<xsl:for-each select="Table[position() &gt;= $start and position() &lt;= $end]">

						<tr >



							<div class="center">
								<td>
									<h5 style="color: white;"> 
										
					   
											<xsl:value-of select="Data"/>
										
									</h5>

								</td>
								<td>
									<h5 style="color: white;">									
					 
											<xsl:value-of select="format-number(TotalMinutos, '0.00')" /> Minutos 
										
									</h5>
								</td>
								
					

							</div>


						</tr>
					</xsl:for-each>
					<!-- Exibir o total de minutos somado -->
					<tfoot class="bg-primary">
						<tr>
						<td >
							<h5 style="color: white;">
								
									<b>Total</b>
								</h5>
								</td>

							<td >
							<h5 style="color: white;">
								<!-- Soma de todos os TotalMinutos do NewDataSet -->
								<xsl:value-of select="format-number(sum(Table/TotalMinutos), '0.00')"/> Minutos
							</h5>
						</td>
					</tr>
						
					</tfoot>
				</table>
			</div>
		</div>
    </xsl:template>
</xsl:stylesheet>
