class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @students = Student.all
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Formação criado com sucesso!" }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    # Buscar todos os participantes no banco que foram passados no
    # parametro student_ids
    # SELECT * FROM STUDENTS WHERE ID = [1, 2, 3]
    if !params[:student_ids].blank?
      students = Student.where(id: params[:student_ids])

      # Exclui todos os participantes existentes no evento que nao foram
      # passados no params[:student_ids], isso significa que foram desmarcados
      # no frontend.
      # event => 3, student_id: 1, student_id: 2, student_id: 3
      # SELECT * FROM PARTICIPANTES WHERE NOT [1, 3]
      @event.participations.where.not(student_id: students.ids).delete_all

      if students.present?
        students.each do |student|
          unless student.has_participation?(@event.id)
            Participation.create(student: student, event: @event, user: Current.user)
          end
        end
      end
    end

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Formação atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_path, status: :see_other, notice: "Formação excluida com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.expect(event: [ :event_at, :title, :user_id ])
    end
end
