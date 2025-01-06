# Use the R Shiny base image
FROM rocker/shiny:latest

# Install R packages
COPY R/install.R /srv
RUN Rscript /srv/install.R

# Copy your app into the container
COPY R/app.R /srv/shiny-server/

# Create a new user
RUN useradd -m -u 1000 shiny_user \
    && chown -R shiny_user:shiny_user /srv/shiny-server

# Set proper permissions
RUN chown -R shiny_user:shiny_user /usr/local/lib/R/site-library/AIRSpec/ShinyApp/

# Switch to non-root user
USER shiny_user
    
# Make the app available at port 3838
EXPOSE 3838

# Run the app
#CMD ["/usr/bin/shiny-server"]
CMD ["Rscript", "/srv/shiny-server/app.R"]