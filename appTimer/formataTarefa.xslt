<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
		<xsl:for-each select="NewDataSet/Table">




			<div class="card mb-3" style=" background-color:#333 ">
				<div class="row g-0">

					<div class="col-md-12">
						<div class="card-body" >
							<div class="center">
								<h5 style="color: white;">
									<a href="https://localhost:44388/Iniciar_Trabalho.aspx?nome={nome}"
				   target ="_blank" style="color: white;">
										<xsl:value-of select="nome"/>
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
