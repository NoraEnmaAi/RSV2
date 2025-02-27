FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID

WORKDIR /app
EXPOSE 8080
EXPOSE 8081


COPY publish ./


USER root
RUN chmod -R 777 /app/wwwroot
RUN chown -R $APP_UID /app/wwwroot

# Run the app
ENTRYPOINT ["dotnet", "RSV2.Server.dll"]