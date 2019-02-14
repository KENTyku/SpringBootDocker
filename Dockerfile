FROM openjdk:8-jdk-alpine
VOLUME /tmp
#объявляем переменную
ARG DEPENDENCY=target/dependency
#копируем из папок файлы в будующий образ
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
#запускаем исполняемые файлы в образе
ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]