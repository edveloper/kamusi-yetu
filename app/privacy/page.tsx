import type { Metadata } from 'next'
import Link from 'next/link'
import { SITE_URL } from '@/lib/constants/site'

// Written for the people who use the site: contributors, speakers deciding
// whether to record, and visitors. It has to be true of the code as it stands.
// When what we collect or who processes it changes, change this page in the
// same commit and move EFFECTIVE_DATE.

export const metadata: Metadata = {
  title: 'Privacy',
  description:
    'What LughaKonnect collects, why, who can see it, where it is stored, and how to see, correct or delete it.',
  alternates: { canonical: `${SITE_URL}/privacy` },
}

const EMAIL = 'ed.veloper10@gmail.com'
const EFFECTIVE_DATE = '17 November 2026'

type Section = { heading: string; body: React.ReactNode }

const SECTIONS: Section[] = [
  {
    heading: 'Who is responsible',
    body: (
      <>
        <p>
          LughaKonnect is run by Eddie Ezekiel Ochieng, who decides how your personal data is used
          and is responsible for it under Kenya&apos;s Data Protection Act, 2019. Write to{' '}
          <a href={`mailto:${EMAIL}`} className="link">{EMAIL}</a> about anything on this page.
        </p>
      </>
    ),
  },
  {
    heading: 'What we collect',
    body: (
      <ul className="space-y-4">
        <li>
          <strong>Your account.</strong> Your email address and password, the name you choose to
          show, and anything you add to your profile, such as a username, a short bio, a photo and
          the languages you speak. Your password is handled by our sign-in provider and we never
          see it.
        </li>
        <li>
          <strong>What you contribute.</strong> Words, phrases, definitions, examples, suggested
          corrections, comments, likes and saved words, each linked to your account.
        </li>
        <li>
          <strong>Recordings, only if you choose to record.</strong> The audio itself, a record of
          exactly what you agreed to and when, and a short speaker profile. That profile covers
          your first language and others you speak, the county where you learned the language and
          where you live now, your age band, your gender and whether you are a first-language,
          heritage or learning speaker. We also keep a short description of the browser and device
          used, because recording quality depends on it.
        </li>
        <li>
          <strong>Searches with no answer.</strong> When the translator cannot find a word, we keep
          the words searched and the two languages involved, so contributors know what people
          need. These are not linked to you or your account.
        </li>
        <li>
          <strong>How the site is used, only if you agree.</strong> If you allow analytics in the
          cookie banner, Google Analytics records the pages visited, roughly where visitors are,
          and the kind of device and browser, using cookies. It tells us which pages help people.
          If you say no, it is never loaded. You can change your answer at any time from Cookie
          Settings at the bottom of every page, and the site works the same either way. Staying
          signed in also uses your browser&apos;s storage, which the site needs in order to work.
        </li>
        <li>
          <strong>Messages you send us</strong>, kept so we can reply and follow up.
        </li>
      </ul>
    ),
  },
  {
    heading: 'Why we use it',
    body: (
      <ul className="space-y-3">
        <li>To run your account and let you contribute, record and save words.</li>
        <li>To review contributions and tell you what happened to yours.</li>
        <li>
          To build an open record of Kenya&apos;s languages that people and technology can use. The
          speaker profile exists for this. A word recorded by many people of different ages and
          regions is far more useful than one recording.
        </li>
        <li>To keep the site working, secure and useful.</li>
      </ul>
    ),
  },
  {
    heading: 'What other people can see',
    body: (
      <>
        <p>
          Your display name appears next to what you contribute and review, and your comments are
          public. Your email address is never shown.
        </p>
        <p className="mt-4">
          Recordings you agree to publish can be heard by anyone on the entry page. They are shown
          with your speaker type, the county where you learned the language and your age band. Your
          name appears only if you chose to be credited, and you can change that later.
        </p>
      </>
    ),
  },
  {
    heading: 'The open licence, and what it means for you',
    body: (
      <>
        <p>
          Entries, examples and recordings you agree to share are released under the Creative
          Commons Attribution 4.0 licence. Anyone may copy and reuse them, including commercially,
          as long as they credit LughaKonnect. That openness is the point of the project.
        </p>
        <p className="mt-4">
          It also has a consequence you should know before you share. Once someone has downloaded a
          copy, we cannot take it back from them. If you withdraw, we stop using your recordings,
          delete the audio from LughaKonnect and leave them out of every future copy of the data.
          Copies made before you withdrew may still exist elsewhere.
        </p>
      </>
    ),
  },
  {
    heading: 'Who else handles your data',
    body: (
      <>
        <p>We use three services to run the site.</p>
        <ul className="mt-4 space-y-3">
          <li>
            <strong>Supabase</strong> stores the database and the recordings and handles sign-in.
          </li>
          <li>
            <strong>Vercel</strong> hosts the website.
          </li>
          <li>
            <strong>Google</strong> provides the analytics.
          </li>
        </ul>
        <p className="mt-4">
          These services keep data on servers outside Kenya, including in the United States. They
          handle it on our behalf and under their own security and privacy commitments. We do not
          sell your data or share it for advertising.
        </p>
      </>
    ),
  },
  {
    heading: 'How long we keep it',
    body: (
      <ul className="space-y-3">
        <li>Your account details, for as long as you have an account.</li>
        <li>
          Recordings, until you withdraw your consent. Withdrawing deletes the audio files from
          LughaKonnect.
        </li>
        <li>
          Words and phrases you contributed stay in the record if you close your account, because
          other entries, translations and people depend on them. Your name is removed from them.
        </li>
        <li>Unanswered searches, for as long as they help decide what to add next.</li>
      </ul>
    ),
  },
  {
    heading: 'Your rights',
    body: (
      <>
        <p>Under the Data Protection Act you can ask us to</p>
        <ul className="mt-4 space-y-2">
          <li>show you the personal data we hold about you,</li>
          <li>correct anything that is wrong,</li>
          <li>delete your account and your personal data,</li>
          <li>stop using your data for a particular purpose,</li>
          <li>withdraw your consent to recording at any time.</li>
        </ul>
        <p className="mt-4">
          You can withdraw recording consent yourself from your{' '}
          <Link href="/profile" className="link">profile</Link>. For anything else, email{' '}
          <a href={`mailto:${EMAIL}`} className="link">{EMAIL}</a> and we will answer within a
          week. If you are not satisfied with how we handle your data, you can complain to the
          Office of the Data Protection Commissioner at{' '}
          <a href="https://www.odpc.go.ke" className="link" rel="noopener">odpc.go.ke</a>.
        </p>
      </>
    ),
  },
  {
    heading: 'Children',
    body: (
      <p>
        You must be 18 or over to create an account, contribute or record. Someone younger may
        take part only with a parent, guardian or teacher who creates the account and supervises
        what is added. Recording is for adults only.
      </p>
    ),
  },
  {
    heading: 'Keeping it safe',
    body: (
      <p>
        Access to the database is limited by rules that decide who can read and change each piece
        of data. Recordings are stored privately and played through links that expire after an
        hour, so a withdrawn recording stops being reachable. No system is perfectly secure, and if
        something goes wrong that affects your data we will tell you.
      </p>
    ),
  },
  {
    heading: 'Changes to this page',
    body: (
      <p>
        When what we collect or how we use it changes, we will update this page and the date at
        the top. If a change matters to people who record, we will tell them before it applies.
      </p>
    ),
  },
]

export default function PrivacyPage() {
  return (
    <div className="min-h-screen bg-paper">
      <header className="border-b border-ink-900 bg-ink-900 text-paper">
        <div className="mx-auto max-w-3xl px-4 py-14 sm:px-6 md:py-20">
          <p className="mark label mb-5 text-signal-300">Privacy</p>
          <h1 className="display text-4xl sm:text-5xl md:text-6xl">Your data, plainly</h1>
          <p className="definition mt-7 max-w-xl text-ink-300">
            What we collect, why, who can see it, and how to get it changed or deleted. In effect
            from {EFFECTIVE_DATE}.
          </p>
        </div>
      </header>

      <main className="mx-auto max-w-3xl px-4 py-12 sm:px-6">
        {SECTIONS.map((section) => (
          <section key={section.heading} className="mb-12 text-ink-700 [&_.link]:text-signal-600 [&_.link]:underline [&_.link]:underline-offset-4 [&_strong]:text-ink-900">
            <h2 className="mark display mb-4 text-2xl text-ink-900">{section.heading}</h2>
            {section.body}
          </section>
        ))}
      </main>
    </div>
  )
}
