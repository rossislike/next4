import { getHello } from "@/actions/actions"
import Hello from "@/components/hello"

export default async function Page() {
  const resultFromServerAction = await getHello()
  return (
    <main>
      <h1>Hello from server component!</h1>
      <p>Result from server action: {resultFromServerAction}</p>

      <Hello />
    </main>
  )
}
