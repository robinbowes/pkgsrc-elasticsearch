# $NetBSD$

DISTNAME=	elasticsearch-${VERSION}
VERSION=	0.90.3
CATEGORIES=	www
MASTER_SITES=	https://download.elasticsearch.org/elasticsearch/elasticsearch/

MAINTAINER=	robin.bowes@yo61.com
HOMEPAGE=	http://www.elasticsearch.org/
COMMENT=	Distributed real-time search and analytics engine for the cloud
LICENSE=	apache-2.0

DIST_SUBDIR=	${PKGNAME_NOREV}

#WRKSRC=		${WRKDIR}
USE_LANGUAGES=	# none

USE_JAVA=	run
USE_JAVA2=	7

NO_CONFIGURE=	yes
NO_BUILD=	yes

INSTALLATION_DIRS=	share/elasticsearch

do-install:
	${INSTALL_DATA} -d ${DESTDIR}${PREFIX}/share/elasticsearch
	${INSTALL_DATA} -d ${DESTDIR}${PREFIX}/share/elasticsearch/bin
	${INSTALL_DATA} -d ${DESTDIR}${PREFIX}/share/elasticsearch/config
	${INSTALL_DATA} -d ${DESTDIR}${PREFIX}/share/elasticsearch/lib
	${INSTALL_DATA} -d ${DESTDIR}${PREFIX}/share/elasticsearch/lib/sigar
	${INSTALL_DATA} ${WRKSRC}/*.t* ${DESTDIR}${PREFIX}/share/elasticsearch/
	${INSTALL_SCRIPT} ${WRKSRC}/bin/* ${DESTDIR}${PREFIX}/share/elasticsearch/bin
	${INSTALL_DATA} ${WRKSRC}/config/* ${DESTDIR}${PREFIX}/share/elasticsearch/config
	${INSTALL_DATA} ${WRKSRC}/lib/*.jar ${DESTDIR}${PREFIX}/share/elasticsearch/lib
	${INSTALL_LIB} ${WRKSRC}/lib/sigar/* ${DESTDIR}${PREFIX}/share/elasticsearch/lib/sigar

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"