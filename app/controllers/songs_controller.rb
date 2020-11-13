class SongsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET projects/1/songs
  def index
    @songs = @project.songs
  end

  # GET projects/1/songs/1
  def show
  end

  # GET projects/1/songs/new
  def new
    @song = @project.songs.build
  end

  # GET projects/1/songs/1/edit
  def edit
  end

  # POST projects/1/songs
  def create
    @song = @project.songs.build(song_params)

    if @song.save
      redirect_to([@song.project, @song], notice: 'Song was successfully saved.')
    else
      render action: 'new'
    end
  end

  # PUT projects/1/songs/1
  def update
    if @song.update_attributes(song_params)
      redirect_to([@song.project, @song], notice: 'Song was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/songs/1
  def destroy
    @song.destroy

    redirect_to @project #project_songs_url(@project)
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find(params[:project_id])
    end

    def set_song
      @song = @project.songs.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      params.require(:song).permit(:name, :content, :tag, :project_id)
    end
end
