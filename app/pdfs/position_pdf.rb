class PositionPdf < Prawn::Document
  def initialize(position, dictionary, conceptual, implementation, support, compliance)
    super(top_margin: 70)
    @position = position
    @dictionary = dictionary
    @conceptual = conceptual
    @implementation = implementation
    @support = support
    @compliance = compliance
    title
    line_space_little
    stroke_horizontal_rule
    line_space_little
    general_info
    line_space
    purpose
    line_space
    scope
    line_space
    responsibilities
    line_space
    competency_profile
    line_space
    attitude
    line_space
    specific_work_environment
    line_space
  end

  def title
    text "#{@position.job_title}", size: 30, style: :bold
    text "Greenpeace #{@position.office_name}", size: 18, style: :bold
  end

  def line_space
    move_down 20
  end

  def line_space_little
    move_down 10
  end

  def general_info
    text "Job title: #{@position.job_title}", size: 11
    text "Valid from: #{@position.valid_from.strftime("%d %B %Y") unless @position.valid_from.nil?}", size: 11
    text "Job grade: #{@position.job_grade}", size: 11
    text "Reports to: #{@position.reports_to}", size: 11
    if @position.line_manages.present?
      text "Line manages: #{@position.line_manages}", size: 11
    end
  end

  def purpose
    text "OVERALL PURPOSE OF THE JOB", size: 14, style: :bold
    text "#{@position.purpose}", size: 11
  end

  def scope
    text "SCOPE", size: 14, style: :bold
    text "#{@position.scope}", size: 11
  end

  def responsibilities
    text "MAJOR FUNCTIONS / RESPONSIBILITIES", size: 14, style: :bold
    move_down 10
    text "<u>Conceptual tasks, Strategy Development and/or Project Development</u>", size: 11, style: :bold, :inline_format => true
    conceptual
    move_down 10
    text "<u>Implementation</u>", size: 11, style: :bold, :inline_format => true
    implementation
    move_down 10
    text "<u>Support/ Coaching/ Leadership</u>", size: 11, style: :bold, :inline_format => true
    support
    move_down 10
    text "<u>Compliance/ Keeping Framework Conditions</u>", size: 11, style: :bold, :inline_format => true
    compliance
  end

  def conceptual
    move_down 5
    @conceptual.each do |r|
      text "- #{r.content}", size: 11
    end
  end

  def implementation
    move_down 5
    @implementation.each do |i|
      text "- #{i.content}", size: 11
    end
  end

  def support
    move_down 5
    @support.each do |s|
      text "- #{s.content}", size: 11
    end
  end

  def compliance
    move_down 5
    @compliance.each do |c|
      text "- #{c.content}", size: 11
    end
  end

  def competency_profile
    text "COMPETENCY PROFILE", size: 14, style: :bold
    move_down 10
    text "<u>Organization competencies</u>", size: 11, style: :bold, :inline_format => true
    organisational
    move_down 10
    text "<u>Functional competencies</u>", size: 11, style: :bold, :inline_format => true
    move_down 5
    text "<u><i><b>Technical</b></i></u>", size: 11, :inline_format => true
    technical
    move_down 8
    text "<u><i><b>Method related</b></i></u>", size: 11, :inline_format => true
    method
    move_down 8
    text "<u><i><b>Social/ self</b></i></u>", size: 11, :inline_format => true
    social
    leadership
  end

  def organisational
    move_down 5
    @position.organisationals.each do |o|
      @dictionary.each do |d|
        if d.id == o.indicator
          text "- #{d.competency_english}"
        end
      end
    end
  end

  def technical
    move_down 5
    @position.functionals.each do |f|
      @dictionary.each do |d|
        if d.id == f.indicator
          text "- #{d.competency_english}"
        end
      end
    end
  end

  def method
    move_down 5
    @position.methodrelations.each do |m|
      @dictionary.each do |d|
        if d.id == m.indicator
          text "- #{d.competency_english}"
        end
      end
    end
  end

  def social
    move_down 5
    @position.socials.each do |s|
      @dictionary.each do |d|
        if d.id == s.indicator
          text "- #{d.competency_english}"
        end
      end
    end
  end

  def leadership
    if @position.leaderships.present?
      move_down 8
      text "<u><i><b>Leadership competencies</b></i></u>", size: 11, :inline_format => true
      move_down 5
      @position.leaderships.each do |l|
        @dictionary.each do |d|
          if d.id == l.indicator
            text "- #{d.competency_english}"
          end
        end
      end
    end
  end

  def attitude
    text "ATTITUDE", size: 14, style: :bold
    @position.attitudes.each do |a|
      text "- #{a.description}"
    end
  end

  def specific_work_environment
    text "SPECIFIC WORK ENVIRONMENT", size: 14, style: :bold
    @position.conditions.each do |con|
      text "- #{con.environment}"
    end
  end
end
