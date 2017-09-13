# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Question.destroy_all
Answer.destroy_all
Response.destroy_all

class Seed

  def self.begin
    seed = Seed.new
    seed.make_questions
    seed.make_users
  end

  def make_users
    User.create!(
    email: "michelle@artemisconnection.com",
    password: 'Scout.1120',
    admin: true
    )
    User.create!(
    email: "jordanc@aretemisconection.com",
    password: 'Artemis!23',
    admin: true
    )
    User.create!(
    email: "anna@artemisconnection.com",
    password: 'Artemis5432',
    admin: true
    )
    User.create!(
    email: "alina@artemisconnection.com",
    password: 'art17PaKm412!',
    admin: true
    )
    User.create!(
    email: "christy@artemisconnection.com ",
    password: 'ACI0252017',
    admin: true
    )
  end

  def make_questions
    question_list_one = [
      ['Our CEO or another Senior Executive is a sponsor of diversity and inclusion.', 1 ],
      ['We have a dedicated senior level employee overseeing and managing the company’s diversity performance.', 1 ],
      ['We have a diversity/inclusion committee that meets on a regular basis.', 1 ],
      ['We have a diversity and inclusion strategy with clear metrics and goals.', 1 ],
      ['Our diversity and inclusion goals are integrated into the company’s strategic plan.', 1 ],
      ['Our talent management strategy links to the organization’s broader diversity and inclusion strategy and goals.', 2 ],
      ['We are successful in recruiting and retaining Board leaders, senior management, and other leadership positions from diverse backgrounds with the expertise and ability to execute our strategic plan.', 2 ],
      ['All job descriptions include diversity and inclusion statements.', 2 ],
      ['Our interview questions are designed to measure diversity and cultural competence.', 2 ],
      ['We have increased the percentage of diverse employee hires over the same period last year.', 2 ],
      ['We have documented processes that promote a diverse pool of candidates in our hiring, recruiting, retention, and promotion.', 2 ],
      ['Our talent management strategy diversity and inclusion goals have been tailored to individual sites and markets.', 2 ],
      ['Employees have participated in at least one diversity and inclusion or cultural sensitivity training session in the past 12 months.', 2],
      ['Unconscious bias training has been completed by all managers and senior leaders in the organization.', 2],
      ['We conduct regular employee engagement surveys with feedback loops for action in place.', 2],
      ['Our orientation for new employees addresses the organization’s  diversity and inclusion beliefs, strategy and policies.', 2],
      ['Diversity and inclusion policies and beliefs have informed our learning and development strategy.', 2],
      ['Performance appraisals and promotion decisions are monitored to ensure that they are fair and that all employees are being given the opportunity to advance.', 2],
      ['Our work place is accessible to non-English speakers and individuals with disabilities.', 2],
      ['We support and enable the formation of Employee Resource Groups and has feedback loops for action in place.', 2],
      ['Diversity and inclusion considerations and goals have been integrated into all function and departmental strategies across our organization.', 3],
      ['We have a supplier diversity policy that provides equal opportunity for all suppliers, regardless of gender, race, age, education, disability, religion, sexual orientation, background, or family situation.', 3],
      ['All customer experience, marketing, brand and product development employees have participated in at least one diversity and inclusion or cultural sensitivity training session in the past 12 months.', 3],
      ['Our company has policies in place to ensure that marketing and advertising is fair and inclusive.', 3],
      ['Cultural competency considerations are  integrated into the company’s brand policies and processes.', 3],
      ['Cultural competency considerations have been integrated into our product development processes.', 3]
    ]

    culture = [
      ['Our Employees feel valued.', 4],
      ['Our Employees feel like their achievements have been fairly recognized and rewarded.', 4],
      ['Our Employees are encouraged to be themselves.', 4],
      ['Our Employees think outcomes, processes, and communications are fair and respectful.', 4],
      ['Our Leaders encourage honest feedback and constructive criticism.', 4],
      ['Our Employees are encouraged to ask questions.', 4],
      ['Leaders are open to new ideas and innovative approaches.', 4],
      ['Our Employees have influence over their job responsibilities.', 4],
      ['Our teams embrace change well.', 4],
      ['Our Employees are given stretch opportunities.', 4],
      ['All employees are given clear guidance on career development opportunities and potential promotion pathways.', 4],
      ['Employees who are willing to learn new knowledge or skills are valued.', 4],
      ['Work-life balance for employees is a priority for managers and leaders.', 4],
      ['Flexible working arrangements are available.', 4],
      ['Family-friendly policies are in place including extended parental leave and family emergency days.', 4]
    ]
    question_list_two = [
      ['Our diversity and inclusion approach, goals and policies have been integrated into all community partner and network agreements.', 5],
      ['Our CSR/Community engagement strategy demonstrates our commitment to diversity and inclusion.', 5],
      ['We only support organizations that comply with our diversity, inclusion and nondiscrimination policy.', 5],
      ['We support community and nonprofit organizations that focus on improving and/or promoting diversity and inclusion.', 5],
      ['The organization has an official definition and shared understanding of diversity and inclusion that is shared and understood by employees at all levels.', 6],
      ['Employees at all levels can easily describe why diversity and inclusion are important for our organization.', 6],
      ['The organization is transparent about its diversity and inclusion activities and makes information available to its employees, suppliers, consumers, and the public on its website.', 6],
      ['The organization’s diversity, inclusion, and nondiscrimination policy is prominently posted on our website and other public places.', 6],
      ['The organization regularly communicates its diversity and inclusion metrics and progress.', 6],
      ['The organization has an open door policy when it comes to issues diversity and inclusion related issues or concerns.', 6],
      ['We have developed and established metrics for measuring the diversity of our workforce.', 7],
      ['We have measured the gender, race, age, and ethnicity breakdown by role, level, and department in the last year.', 7],
      ['Diversity and inclusion metrics are reviewed on a regular basis to evaluate and assess the progress of diversity and inclusion efforts.', 7],
      ['A pay equity analysis was conducted in the last year.', 7]
    ]

    question_list_one.each do | question |
      Question.create!(
        section_number: question[1],
        question_text: question[0],
        :answers_attributes => [
        {
          answer_text: 'We’ve taken no actions to address this.',
          answer_weight: 1
        },
        {
          answer_text: 'We’ve taken actions to address this, but have not initiated a discussion.',
          answer_weight: 2
        },
        {
          answer_text: 'We’ve defined verbal and written standards to support this.',
          answer_weight: 3
        },
        {
          answer_text: 'We’ve defined standards and are in the process of integrating them into workplace norms.',
          answer_weight: 4
        },
        {
          answer_text: 'We’ve defined  standards and practices and fully integrated them into our workplace norms.',
          answer_weight: 5
        }]
      )
    end

    culture.each do |culture|
      Question.create!(
      section_number: culture[1],
      question_text: culture[0],
        :answers_attributes => [
        {
          answer_text: 'Strongly agree.',
          answer_weight: 5
        },
        {
          answer_text: 'Agree.',
          answer_weight: 4
        },
        {
          answer_text: 'Neither agree nor disagree.',
          answer_weight: 3
        },
        {
          answer_text: 'Disagree.',
          answer_weight: 2
        },
        {
          answer_text: 'Strongly disagree.',
          answer_weight: 1
        }]
        )
    end

  question_list_two.each do | question |
    Question.create!(
      section_number: question[1],
      question_text: question[0],
      :answers_attributes => [
      {
        answer_text: 'We’ve taken no actions to address this.',
        answer_weight: 1
      },
      {
        answer_text: 'We’ve taken actions to address this, but have not initiated a discussion.',
        answer_weight: 2
      },
      {
        answer_text: 'We’ve defined verbal and written standards to support this.',
        answer_weight: 3
      },
      {
        answer_text: 'We’ve defined standards and are in the process of integrating them into workplace norms.',
        answer_weight: 4
      },
      {
        answer_text: 'We’ve defined  standards and practices and fully integrated them into our workplace norms.',
        answer_weight: 5
      }]
    )
  end

end
end
Seed.begin
