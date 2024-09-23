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

		<!-- Exibe apenas os itens que estão na página atual -->
		<xsl:for-each select="Table[position() &gt;= $start and position() &lt;= $end]">


			<div class="card mb-3" style=" background-color:#333 ;">
				<div class="row g-0">

					<div class="col-md-12">
						<div class="card-body" >
							<div class="center">

								<h5 >
									<a  href="https://localhost:44388/Iniciar_Trabalho.aspx?servico={servico}&amp;idservico={id}"
				   target ="_blank" style="color: white;">
										<xsl:value-of select="servico"/>
									</a>&#160;&#160;=>
								</h5>

								<h5 >
									<a  href="https://localhost:44388/Iniciar_Trabalho.aspx?descricao={descricao}"
				   target ="_blank" style="color: white;">
										<xsl:value-of select="descricao"/>
								
									</a>
								
								</h5>
							
								

							</div>
						</div>
					</div>
				</div>
			</div>
			
		</xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
