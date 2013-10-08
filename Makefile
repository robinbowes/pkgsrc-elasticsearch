# $NetBSD$

DISTNAME=	elasticsearch-0.90.5
CATEGORIES=	wip
MASTER_SITES=	https://download.elasticsearch.org/elasticsearch/elasticsearch/

MAINTAINER=	robin.bowes@yo61.com
HOMEPAGE=	http://www.elasticsearch.org/
COMMENT=	Distributed real-time search and analytics engine for the cloud
LICENSE=	apache-2.0

DIST_SUBDIR=	${PKGNAME_NOREV}

USE_LANGUAGES=	# none

USE_JAVA=	run
USE_JAVA2=	6

NO_CONFIGURE=	yes
NO_BUILD=	yes

INIT_SYSTEM=	smf

ES_HOME=${PREFIX}/share/elasticsearch
ES_BIN_DIR=${ES_HOME}/bin
ES_CONF_DIR=${ES_HOME}/config
ES_LIB_DIR=${ES_HOME}/lib

SUBST_CLASSES+=	fix-vars

SUBST_STAGE.fix-vars=	pre-install
SUBST_MESSAGE.fix-vars=	Fixing ES vars
SUBST_FILES.fix-vars=	bin/wrapper.sh
SUBST_VARS.fix-vars=	ES_BIN_DIR
SUBST_VARS.fix-vars+=	ES_CONF_DIR

FILES_SUBST+=	JAVA_HOME=${PKG_JAVA_HOME}
FILES_SUBST+=	ES_BIN_DIR=${ES_BIN_DIR}
FILES_SUBST+=	ES_CONF_DIR=${ES_CONF_DIR}

INSTALLATION_DIRS=	share/elasticsearch/{bin,config,lib/sigar}

post-extract:
	${CP} ${FILESDIR}/wrapper.sh ${WRKSRC}/bin/
	${CP} ${FILESDIR}/local.conf ${WRKSRC}/config/

do-install:
	${INSTALL_DATA} ${WRKSRC}/*.t* ${DESTDIR}${ES_HOME}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/* ${DESTDIR}${ES_BIN_DIR}
	${INSTALL_DATA} ${WRKSRC}/config/* ${DESTDIR}${ES_CONF_DIR}
	${INSTALL_DATA} ${WRKSRC}/lib/*.jar ${DESTDIR}${ES_LIB_DIR}
	${INSTALL_LIB} ${WRKSRC}/lib/sigar/* ${DESTDIR}${ES_LIB_DIR}/sigar

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
