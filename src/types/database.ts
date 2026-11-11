export type UserRole = 'admin' | 'student'
export type QuestionType = 'sba' | 'flashcard' | 'osce_station'
export type SessionType =
  | 'topic'
  | 'random'
  | 'weakness'
  | 'spaced_repetition'
  | 'full_mock'
  | 'as_many_as_you_can'
  | 'flashcard'
export type PresentationFormat = 'sba' | 'flashcard' | 'cover_the_options' | 'rapid_fire'
export type WeaknessVariant = 'by_topic' | 'by_tag' | 'recent_mistakes' | 'most_missed'
export type AttemptResult = 'correct' | 'incorrect' | 'skipped' | 'partial'
export type FlagStatus = 'open' | 'resolved' | 'dismissed'
export type ThemePreference = 'dark' | 'light' | 'system'

export type Exam = {
  id: string
  slug: string
  name: string
  description: string | null
  is_active: boolean
  created_at: string
  updated_at: string
}

export type Profile = {
  id: string
  email: string
  display_name: string | null
  role: UserRole
  created_at: string
  updated_at: string
}

export type Topic = {
  id: string
  exam_id: string
  parent_id: string | null
  slug: string
  name: string
  sort_order: number
  is_active: boolean
  created_at: string
}

export type Question = {
  id: string
  exam_id: string
  topic_id: string | null
  question_type: QuestionType
  stem: string
  explanation: string | null
  payload: Record<string, unknown>
  difficulty: number | null
  is_active: boolean
  is_uk_practice: boolean
  created_by: string | null
  updated_by: string | null
  created_at: string
  updated_at: string
}

export type QuestionOption = {
  id: string
  question_id: string
  label: string
  body: string
  is_correct: boolean
  sort_order: number
}

export type ExamSettings = {
  exam_id: string
  pass_mark_percent: number
  default_mock_question_count: number
  default_mock_minutes: number
  extra: Record<string, unknown>
  updated_at: string
  updated_by: string | null
}

export type UserPreferences = {
  user_id: string
  theme: ThemePreference
  comparison_opt_out: boolean
  reading_speed_wpm: number | null
  extra: Record<string, unknown>
  updated_at: string
}

export type QuestionWithOptions = Question & {
  question_options: QuestionOption[]
  topics?: Topic | null
}

export type StudySession = {
  id: string
  exam_id: string
  user_id: string
  session_type: SessionType
  presentation_format: PresentationFormat
  topic_id: string | null
  weakness_variant: WeaknessVariant | null
  unseen_only: boolean
  settings: Record<string, unknown>
  started_at: string
  ended_at: string | null
  time_limit_sec: number | null
  question_count: number | null
  score_percent: number | null
  created_at: string
}

export type Attempt = {
  id: string
  session_id: string | null
  exam_id: string
  user_id: string
  question_id: string
  selected_option_id: string | null
  response_payload: Record<string, unknown>
  result: AttemptResult
  time_spent_ms: number | null
  answered_at: string
}

export type SpacedRepetitionState = {
  user_id: string
  question_id: string
  exam_id: string
  ease_factor: number
  interval_days: number
  repetitions: number
  due_at: string
  last_result: AttemptResult | null
  last_reviewed_at: string | null
  updated_at: string
}

export type QuestionTag = {
  question_id: string
  tag_id: string
}

export type MistakeTag = {
  id: string
  attempt_id: string
  tag: string
  note: string | null
  created_at: string
}

export type Database = {
  public: {
    Tables: {
      exams: {
        Row: Exam
        Insert: Partial<Exam> & Pick<Exam, 'slug' | 'name'>
        Update: Partial<Exam>
        Relationships: []
      }
      profiles: {
        Row: Profile
        Insert: Partial<Profile> & Pick<Profile, 'id' | 'email'>
        Update: Partial<Profile>
        Relationships: []
      }
      topics: {
        Row: Topic
        Insert: Partial<Topic> & Pick<Topic, 'exam_id' | 'slug' | 'name'>
        Update: Partial<Topic>
        Relationships: []
      }
      questions: {
        Row: Question
        Insert: Partial<Question> & Pick<Question, 'exam_id' | 'stem'>
        Update: Partial<Question>
        Relationships: []
      }
      question_options: {
        Row: QuestionOption
        Insert: Partial<QuestionOption> & Pick<QuestionOption, 'question_id' | 'label' | 'body'>
        Update: Partial<QuestionOption>
        Relationships: []
      }
      question_tags: {
        Row: QuestionTag
        Insert: QuestionTag
        Update: Partial<QuestionTag>
        Relationships: []
      }
      exam_settings: {
        Row: ExamSettings
        Insert: Partial<ExamSettings> & Pick<ExamSettings, 'exam_id'>
        Update: Partial<ExamSettings>
        Relationships: []
      }
      user_preferences: {
        Row: UserPreferences
        Insert: Partial<UserPreferences> & Pick<UserPreferences, 'user_id'>
        Update: Partial<UserPreferences>
        Relationships: []
      }
      study_sessions: {
        Row: StudySession
        Insert: Partial<StudySession> &
          Pick<StudySession, 'exam_id' | 'user_id' | 'session_type' | 'presentation_format'>
        Update: Partial<StudySession>
        Relationships: []
      }
      attempts: {
        Row: Attempt
        Insert: Partial<Attempt> & Pick<Attempt, 'exam_id' | 'user_id' | 'question_id' | 'result'>
        Update: Partial<Attempt>
        Relationships: []
      }
      mistake_tags: {
        Row: MistakeTag
        Insert: Partial<MistakeTag> & Pick<MistakeTag, 'attempt_id' | 'tag'>
        Update: Partial<MistakeTag>
        Relationships: []
      }
      spaced_repetition_state: {
        Row: SpacedRepetitionState
        Insert: Partial<SpacedRepetitionState> &
          Pick<SpacedRepetitionState, 'user_id' | 'question_id' | 'exam_id'>
        Update: Partial<SpacedRepetitionState>
        Relationships: []
      }
    }
    Views: Record<string, never>
    Functions: {
      current_role: { Args: Record<string, never>; Returns: UserRole }
      is_admin: { Args: Record<string, never>; Returns: boolean }
    }
    Enums: {
      user_role: UserRole
      question_type: QuestionType
      session_type: SessionType
      presentation_format: PresentationFormat
      weakness_variant: WeaknessVariant
      attempt_result: AttemptResult
      flag_status: FlagStatus
    }
    CompositeTypes: Record<string, never>
  }
}
