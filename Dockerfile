# Use the R Shiny base image
FROM rocker/shiny:latest

# Install R packages
COPY R/install.R /srv
RUN Rscript /srv/install.R

# Copy your app into the container
RUN rm -rf /srv/shiny-server/ && cp -r /usr/local/lib/R/site-library/AIRSpec/ShinyApp/ /srv/shiny-server/

# Set proper permissions
RUN chown -R shiny:shiny /srv/shiny-server

# Switch to non-root user
USER shiny

# Make the app available at port 3838
EXPOSE 3838

# Run the app
CMD ["/usr/bin/shiny-server"]